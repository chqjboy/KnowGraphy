//
//  TraceTextView.m
//  Test
//
//  Created by 陈前进 on 2017/11/11.
//  Copyright © 2017年 chqjboy. All rights reserved.
//

#import "TraceTextView.h"

@implementation TraceTextView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.textColor = RGB(221, 221, 221);
    self.textContainerInset = UIEdgeInsetsMake(10, 12, 3, 10);
    self.font = SystemFont(11);
    self.editable = NO;
    self.scrollEnabled = YES;
    self.selectable = NO;
    [self setBackgroundColor:COLOR_CLEAR];
    return self;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if ([UIMenuController sharedMenuController].isMenuVisible)
    {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}

-(void)trace:(NSString*)format,...
{
    [self clear];
    va_list ap;
    va_start(ap, format);
    [self appendTrace:format arguments:ap];
    va_end(ap);
}
-(void)appendTrace:(NSString*)format,...
{
    va_list ap;
    va_start(ap, format);
    [self appendTrace:format arguments:ap];
    va_end(ap);
}
-(void)appendTrace:(NSString*)format arguments:(va_list)argList
{
    NSString* body = [[NSString alloc]initWithFormat:format arguments:argList];
    if (self.text==nil)
    {
        self.text = @"";
    }
    self.text = [self.text stringByAppendingFormat:@"%@\n", body];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = 5;// 字体的行间距
    
    NSDictionary *attributes = @{
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 NSForegroundColorAttributeName:RGB(221, 221, 221)
                                 };
    self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:attributes];
}
-(void)clear
{
    self.text = nil;
}
@end
