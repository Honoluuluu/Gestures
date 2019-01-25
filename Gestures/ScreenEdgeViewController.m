//
//  ScreenEdgeViewController.m
//  Gestures
//
//  Created by Van Luu on 2019-01-25.
//  Copyright © 2019 Van Luu. All rights reserved.
//

#import "ScreenEdgeViewController.h"

@interface ScreenEdgeViewController ()
@property BOOL maxLimit;
@property CGFloat width;
@property CGFloat height;
@property CGFloat maxX;
@property UIScreenEdgePanGestureRecognizer *edgePanGesture;



@end

@implementation ScreenEdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.width = 300;
    self.height = 300;
    
    CGRect frame = CGRectMake(CGRectGetMaxX(self.view.bounds)-10, CGRectGetMaxY(self.view.bounds)-self.height, self.width, self.height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    self.edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgeHandler:)];
    [self.edgePanGesture setEdges:UIRectEdgeRight];
    [view addGestureRecognizer:self.edgePanGesture];

    
}


-(void)edgeHandler:(UIScreenEdgePanGestureRecognizer*)sender {
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y);
    
    if(!self.maxLimit) {
        sender.view.center = newCenter;
        [sender setTranslation:CGPointZero inView:self.view];
}
    if (sender.view.center.x <= self.maxX) {
        self.maxLimit = YES;
    }
    
    if (sender.state == UIGestureRecognizerStateEnded && self.maxLimit) {
        UIPanGestureRecognizer *screenPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(screenPanned:)];
        [sender.view addGestureRecognizer:screenPanGesture];
        [sender.view removeGestureRecognizer:sender];
    }
    
    else if (sender.state == UIGestureRecognizerStateEnded && !self.maxLimit) {
        sender.view.center = CGPointMake((CGRectGetMaxX(self.view.bounds)-10) + self.width/2, sender.view.center.y);
    }
    
}

-(void)screenPanned:(UIPanGestureRecognizer*)sender {
    
    
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y);
    
    if (newCenter.x <= self.maxX) {
        return;
}
    else{
        sender.view.center = newCenter;
    }
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    if(sender.state == UIGestureRecognizerStateEnded && newCenter.x >= 450) {
        sender.view.center = CGPointMake((CGRectGetMaxX(self.view.bounds)-10) + (self.width/2), self.view.center.y);
        
        [self.edgePanGesture setEdges:UIRectEdgeRight];
        [sender.view addGestureRecognizer:self.edgePanGesture];
        [sender.view removeGestureRecognizer:sender];
    }
    
    else if (sender.state == UIGestureRecognizerStateEnded && newCenter.x <= 450) {
        sender.view.center = CGPointMake(self.maxX, sender.view.center.y);
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
