//
//  TraceView.h
//  KnowGraphy
//
//  Created by 陈前进 on 2017/12/9.
//  Copyright © 2017年 chqjboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TraceTextView.h"

@protocol TraceViewDelegate<NSObject>
-(void)traceBeginExpand:(BOOL)expand;
-(void)traceEndExpand:(BOOL)expand;
@end
@interface TraceView : UIView
@property(nonatomic, weak) id<TraceViewDelegate>delegate;
@property(nonatomic, retain) UILabel* title;
@property(nonatomic, retain) UIImageView* expand;
@property(nonatomic, retain) TraceTextView* trace;
@property(nonatomic, assign) BOOL isexpand;

-(void)trace:(NSString*)format,...;
-(void)appendTrace:(NSString*)format,...;
-(void)clear;
@end
