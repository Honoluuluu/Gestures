//
//  RotateViewController.m
//  Gestures
//
//  Created by Van Luu on 2019-01-25.
//  Copyright © 2019 Van Luu. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()

@end

@implementation RotateViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds)-width/2, CGRectGetMidY(self.view.bounds)-height/2, width, height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateHandler:)];
    [view addGestureRecognizer:rotate];
    
}
-(void)rotateHandler:(UIRotationGestureRecognizer*)sender {
    
    CGFloat rotation = sender.rotation;
    
    sender.view.transform = CGAffineTransformMakeRotation(rotation);
    rotation = 0.0f;
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
