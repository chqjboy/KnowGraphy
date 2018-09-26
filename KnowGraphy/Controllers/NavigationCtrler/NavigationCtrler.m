//
//  NavigationCtrler.m
//  预健社
//
//  Created by 陈前进 on 16/12/26.
//  Copyright © 2016年 上门预健. All rights reserved.
//

#import "NavigationCtrler.h"
#import "TabItemCtrler.h"
@interface NavigationCtrler ()

@end

@implementation NavigationCtrler
@synthesize delegate=_delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.hidesBottomBarWhenPushed = ![self isKindOfClass:[TabItemCtrler class]];
    [Global registNotifyWithObserver:self selector:@selector(deviceOrientationChanged:) message:UIDeviceOrientationDidChangeNotification];

    self.view.backgroundColor = COLOR_BACK;
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
                    RGB(255, 255, 255),NSForegroundColorAttributeName,
                    SystemFont(14), NSFontAttributeName,nil]];
    
    Navigationbar* navbar = (Navigationbar*)self.navigationController.navigationBar;
    CGRect rect = self.view.frame;
    if (!self.navigationController.navigationBarHidden)
    {
        CGRect rtBar = navbar.frame;
        navbar.cusBarStyele = UIBarStyleDefault;
        UIView* leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, NavItemWidth*2, NavItemHeight)];
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftView]];
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnBack = backBtn;
        if ([self isKindOfClass:[TabItemCtrler class]])
        {
            [backBtn setHidden:YES];
        }
        backBtn.frame = CGRectMake(0, 0,NavItemWidth , NavItemHeight);
        [backBtn setBackgroundImage:ImageLoad(@"nav_back") forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [leftView addSubview:backBtn];
        

        UIView* rightBtn = [self installRightButton];
        if (rightBtn!=nil)
        {
            UIView* rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, NavItemWidth*2, NavItemHeight)];
            [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:rightView]];
            
            self.rightView = rightBtn;
            CGRect rtRightBtn = rightBtn.frame;
            rtRightBtn.origin.x = NavItemWidth*2-rightBtn.bounds.size.width;
            rightBtn.frame = rtRightBtn;
            [Global addTapEventWithTarget:self View:rightBtn andAction:@selector(rightClick)];
            [rightView addSubview:rightBtn];
        }
        
        UIView* titleView = [self installTitleView];
        if (titleView!=nil)
        {
            self.navigationItem.titleView = titleView;
        }
        
        CGRect rtClient = rect;
        rtClient.origin.y = rtBar.origin.y+rtBar.size.height;
        rtClient.size.height = rect.size.height-rtBar.size.height-20;
        if (!self.hidesBottomBarWhenPushed)
        {
            rtClient.size.height -= self.navigationController.toolbar.frame.size.height;
        }
        self.view.frame = rtClient;
    }else
    {
        CGRect rtClient = rect;
        
        if (!self.hidesBottomBarWhenPushed)
        {
            rtClient.size.height -= self.navigationController.toolbar.frame.size.height;
        }
        self.view.frame = rtClient;
    }
    [self initViews];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarOrientation:[Global getWindowOrientation]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(BOOL)canBackto
{
    return NO;
}
-(void)backClick
{
    if (self.delegate!=nil &&
        [self.delegate respondsToSelector:@selector(backWithCtrler:)])
    {
        [self.delegate backWithCtrler:self];
    }
    if (self.isPresent)
    {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }else
    {
        if (self.backto && [self canBackto])
        {
            [self.navigationController popToViewController:self.backto animated:YES];
        }else
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}
-(void)rightClick
{
    NSLog(@"rightClick");
}
-(void)appendLeftButtonsClick:(id)sender
{
    
}
-(NSArray<UIView*>*)appendLeftButtons
{
    return nil;
}
-(UIView*)installRightButton
{
    return nil;
}
-(UIView*)installTitleView
{
    return nil;
}
-(void)initViews
{
    
}

- (void) registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChanged:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void) keyboardWasHide:(NSNotification*)notify
{
    [self resizeWithKeyboardHeight:0];
}

- (void) keyboardWasShown:(NSNotification *) notify
{
    NSDictionary *info = [notify userInfo];
    NSValue *value = [info objectForKey:@"UIKeyboardBoundsUserInfoKey"];
    CGSize keyboardSize = [value CGRectValue].size;
    [self resizeWithKeyboardHeight:keyboardSize.height];
}

-(void)keyboardFrameChanged:(NSNotification*)notify
{
    NSDictionary *info = [notify userInfo];
    NSValue *value = [info objectForKey:@"UIKeyboardBoundsUserInfoKey"];
    CGSize keyboardSize = [value CGRectValue].size;
    [self resizeWithKeyboardHeight:keyboardSize.height];
}

-(void)removeKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)resizeWithKeyboardHeight:(CGFloat)height
{
    
}

-(BOOL)shouldAutorotate
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
-(void)deviceOrientationChanged:(NSNotification*)notification
{
    [[UIApplication sharedApplication] setStatusBarOrientation:[Global getWindowOrientation]];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
@end
