//
//  MacroDefine.h
//  Test
//
//  Created by 陈前进 on 2017/11/9.
//  Copyright © 2017年 chqjboy. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h
#import "Global.h"
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define COLOR_CELL RGB(244, 244, 244)
#define COLOR_MAIN RGB(31,224,149)
#define COLOR_BACK RGB(238, 238, 238)
#define ACOLOR_BACK(a) RGBA(238, 238, 238, a)
#define COLOR_CLEAR [UIColor clearColor]
#define COLOR_WHITE [UIColor whiteColor]
#define COLOR_BLACK [UIColor blackColor]
#define COLOR_FT_1 RGB(205, 210, 213)
#define COLOR_FT_2 RGB(116, 119, 130)
#define COLOR_FT_3 RGB(31, 224, 149)

#define ImageLoad(filename) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:@"png"]]
#define ScaleSize(x) [Global getScaleSize:x]
#define NavItemHeight 44.0
#define NavItemWidth 35.0
#define TabItemHeight 49.0
#define SystemFont(size) [UIFont systemFontOfSize:ScaleSize(size)]
#define ALERT_MSG(msg) [Global showCancelAlertWithTitle:@"" andMessage:msg andDelegate:nil andCancelBtn:@"确定"]
#define RetainCount(object) CFGetRetainCount((__bridge CFTypeRef)(object))
#endif /* MacroDefine_h */
