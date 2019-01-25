//
//  TapViewController.m
//  Gestures
//
//  Created by Van Luu on 2019-01-17.
//  Copyright © 2019 Van Luu. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@property (nonatomic, strong) UIView *colorChangeBox;

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);

    UIView *newBox = [[UIView alloc]initWithFrame:frame];
    self.colorChangeBox = newBox;
    self.colorChangeBox.backgroundColor = [UIColor purpleColor];

    

    [self.view addSubview:self.colorChangeBox];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc ]initWithTarget:self action:@selector(viewTapped:)];

    [self.colorChangeBox addGestureRecognizer:tapGesture];


}

-(void)viewTapped:(UITapGestureRecognizer*)sender {
//    CGFloat r = arc4random_uniform(255) / 255.0;
//    CGFloat g = arc4random_uniform(255) / 255.0;
//    CGFloat b = arc4random_uniform(255) / 255.0;
    
    UIColor *purpleColor = [UIColor purpleColor];
    UIColor *orangeColor = [UIColor orangeColor];
    
    // ternary operator
//    if (true) {
//        a;
//    } else {
//        b;
//    }
//
//    true ?? a() : b()
    
    self.colorChangeBox.backgroundColor = self.colorChangeBox.backgroundColor == purpleColor ? orangeColor : purpleColor;
                         
//    if (self.colorChangeBox.backgroundColor == purpleColor) {
//
//        self.colorChangeBox.backgroundColor = orangeColor;
//    }else {
//        self.colorChangeBox.backgroundColor = purpleColor;
//    }
    
                         
//
    
    
    
    
    
    
    

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
