//
//  HScrollView.m
//  MyController
//
//  Created by 陈前进 on 16/4/25.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import "HScrollView.h"

@implementation HScrollView
-(HScrollView*)initWithFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    self.views = [[NSMutableArray alloc]initWithCapacity:20];
    return self;
}
-(void)addItemWithView:(UIView*)view
{
    [self.views addObject:view];
}
-(void)removeAllItems
{
    for (UIView* view in self.views)
    {
        [view removeFromSuperview];
    }
    [self.views removeAllObjects];
}
-(void)reloadItems
{
    CGRect rect = self.frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    for (UIView* view in self.views)
    {
        CGRect rtView = view.frame;
        rtView.origin = rect.origin;
        view.frame = rtView;
        [self addSubview:view];
        rect.origin.x += rtView.size.width;
    }
    [self setContentSize:CGSizeMake(rect.origin.x, rect.size.height)];
}
-(void)moveItemCenterWithIndex:(NSInteger)index
{
    if (index<0 || self.views==nil || self.views.count<=0 || index>self.views.count-1)
    {
        return;
    }
    UIView* item = [self.views objectAtIndex:index];
    [self moveItemCenterWithItem:item];
}
-(void)moveItemCenterWithItem:(UIView*)item
{
    if (![self.subviews containsObject:item])
    {
        return;
    }
    CGRect rect = self.bounds;
    CGSize size = self.contentSize;
    if (rect.size.width>size.width)
    {
        return;
    }
    if (item.center.x<=rect.size.width/2)
    {
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if(item.center.x>=size.width-rect.size.width/2)
    {
        [self setContentOffset:CGPointMake(size.width-rect.size.width, 0) animated:YES];
    }else
    {
        [self setContentOffset:CGPointMake(item.center.x-rect.size.width/2, 0) animated:YES];
    }
}
-(void)addSpiteBarWithWidth:(CGFloat)width andColor:(UIColor*)color
{
    CGRect rect = self.bounds;
    rect.size.width = width;
    UIView* view = [[UIView alloc]initWithFrame:rect];
    [view setBackgroundColor:color];
    [self addItemWithView:view];
}
@end
