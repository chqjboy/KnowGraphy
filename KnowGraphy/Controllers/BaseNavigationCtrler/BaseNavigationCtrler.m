//
//  BaseNavigationCtrler.m
//  ArtEdu
//
//  Created by 陈前进 on 17/7/14.
//  Copyright © 2017年 precare. All rights reserved.
//

#import "BaseNavigationCtrler.h"

@interface BaseNavigationCtrler ()

@end

@implementation BaseNavigationCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [Global getWindowOrientationMask];
}


- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [Global getWindowOrientation];
}
@end
