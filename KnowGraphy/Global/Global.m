//
//  Global.m
//  Test
//
//  Created by 陈前进 on 2017/11/9.
//  Copyright © 2017年 chqjboy. All rights reserved.
//

#import "Global.h"
static CGFloat g_scale = 1;
static UIInterfaceOrientation g_orientation = UIInterfaceOrientationPortrait;
@implementation Global
+(CGFloat)getScaleSize:(CGFloat)size
{
    if (g_scale==0)
    {
        CGRect rect = [UIScreen mainScreen].bounds;
        if (rect.size.width>rect.size.height)
        {
            g_scale = rect.size.height/320.0;
        }else
        {
            g_scale = rect.size.width/320.0;
        }
        
    }
    return size*g_scale;
}
+(void)addTapEventWithTarget:(id)target View:(UIView*)view andAction:(SEL)action
{
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    tapGesture.delegate = target;
    [view addGestureRecognizer:tapGesture];
}
+(void)registNotifyWithObserver:(id)obj selector:(SEL)select message:(NSString*)message
{
    [[NSNotificationCenter defaultCenter] addObserver:obj selector:select name:message object:nil];
}
+(void)releaseNotifyWithObserver:(id)obj
{
    [[NSNotificationCenter defaultCenter] removeObserver:obj];
}
+(void)postNotifyWithMessage:(NSString*)msg andObj:(NSObject*)obj
{
    [[NSNotificationCenter defaultCenter] postNotificationName:msg object:obj];
}
+(void)showCancelAlertWithTitle:(NSString*)title andMessage:(NSString*)message andDelegate:(id)delegate andCancelBtn:(NSString*)cancel
{
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancel otherButtonTitles:nil];
    [alert show];
}
+(UIInterfaceOrientation)getWindowOrientation
{
    return g_orientation;
}
+(UIInterfaceOrientationMask)getWindowOrientationMask
{
    UIInterfaceOrientation orientation = [Global getWindowOrientation];
    if (orientation==UIInterfaceOrientationLandscapeRight)
    {
        return UIInterfaceOrientationMaskLandscapeRight;
    }else
    {
        return UIInterfaceOrientationMaskPortrait;
    }
}
+(void)setWindowOrientation:(UIInterfaceOrientation)orientation
{
    if (g_orientation==orientation)
    {
        return;
    }
    g_orientation = orientation;
    [TestDelegate application:TestApplication supportedInterfaceOrientationsForWindow:TestWindow];
    if([[UIDevice currentDevice]respondsToSelector:@selector(setOrientation:)])
    {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;//横屏
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
    [UIViewController attemptRotationToDeviceOrientation];
}
+(CGSize)sizeForText:(NSString*)text font:(UIFont*)font maxWidth:(CGFloat)maxWidth style:(NSParagraphStyle*)style
{
    if (text==nil || font==nil || maxWidth<=0)
    {
        return CGSizeZero;
    }
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    if (style)
    {
        [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    }
    
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:options context:nil];
    return rect.size;
}
+(UIImage*)createImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage*theImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
