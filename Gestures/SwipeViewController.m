//
//  SwipeViewController.m
//  Gestures
//
//  Created by Van Luu on 2019-01-25.
//  Copyright © 2019 Van Luu. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()
@property (nonatomic,strong) UIView *swipeView;
@property (nonatomic,strong) UIView *backgroundView;
@property BOOL isOpen;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = 400;
    CGFloat height = 50;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds)-width/2, CGRectGetMidY(self.view.bounds)-height/2, width, height);
    
    self.backgroundView = [[UIView alloc] initWithFrame:frame];
    self.backgroundView.backgroundColor = [UIColor brownColor];
    [self.view addSubview: self.backgroundView];
    
    CGRect frameForSwipe = CGRectMake(CGRectGetMidX(self.backgroundView.bounds) - width/2, CGRectGetMidY(self.backgroundView.bounds) - height/2, width, height);
    
    self.swipeView = [[UIView alloc]initWithFrame:frameForSwipe];
    self.swipeView.backgroundColor = [UIColor whiteColor];
    [self.backgroundView addSubview:self.swipeView];
    
    [self.backgroundView setClipsToBounds:YES];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftHandler:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.swipeView addGestureRecognizer:swipeLeft];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightHandler:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.swipeView addGestureRecognizer:swipeRight];
    
    
}

-(void)swipeLeftHandler:(UIGestureRecognizer*)sender {
    if (!self.isOpen) {
        [UIView animateWithDuration:1
                         animations:^{
                             sender.view.center = CGPointMake(100, sender.view.center.y);
                         }
                         completion:^(BOOL finished) {
                             self.isOpen = !self.isOpen;
                         }];
         
    }
    }

-(void)swipeRightHandler:(UIGestureRecognizer*)sender {
    
    if (self.isOpen) {
        
        [UIView animateWithDuration:1
                         animations:^
         {
             sender.view.center = CGPointMake(self.backgroundView.center.x - 7,sender.view.center.y);
         }
                         completion:^(BOOL finished)
         {
             self.isOpen = NO;
         }];
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
