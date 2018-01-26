//
//  ViewController.m
//  KEColorPicker
//
//  Created by Kaan Esin on 25.01.2018.
//  Copyright © 2018 Kaan Esin. All rights reserved.
//

#import "ViewController.h"
#import "ColorsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "KEButton.h"

@interface ViewController () <CAAnimationDelegate,UINavigationControllerDelegate,ColorsViewControllerDelegate>

@property (weak, nonatomic) IBOutlet KEButton *btnChooseColor;

- (IBAction)chooseColor:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)chooseColor:(id)sender {
    ColorsViewController *colorsVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ColorsViewController"];
    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:colorsVC.view.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(20, 20)];
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.frame = colorsVC.view.bounds;
//    maskLayer.path = maskPath.CGPath;
//    colorsVC.view.layer.mask = maskLayer;
//
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    [self.view addSubview:colorsVC.view];
//
//    colorsVC.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        colorsVC.view.frame = CGRectMake(0, 44.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    } completion:nil];
    
//    [self.navigationController pushViewController:colorsVC animated:YES];
    
    colorsVC.delegate = self;
    [self presentViewController:colorsVC animated:YES completion:nil];
}
-(void)colorSelected:(UIColor *)selectedColor{
    self.view.backgroundColor = selectedColor;
}

@end
