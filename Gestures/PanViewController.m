//
//  PanViewController.m
//  Gestures
//
//  Created by Van Luu on 2019-01-17.
//  Copyright © 2019 Van Luu. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController


- (IBAction)redViewPanned:(UIPanGestureRecognizer*)sender {
    
//    CGPoint locationInview = [sender locationInView:self.view];
//    sender.view.center = locationInview;
    
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
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
