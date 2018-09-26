//
//  TraceTextView.h
//  Test
//
//  Created by 陈前进 on 2017/11/11.
//  Copyright © 2017年 chqjboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TraceTextView : UITextView
-(void)trace:(NSString*)format,...;
-(void)appendTrace:(NSString*)format,...;
-(void)clear;
-(void)appendTrace:(NSString*)format arguments:(va_list)argList;
@end
