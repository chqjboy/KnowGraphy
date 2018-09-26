//
//  AutoLabel.h
//  KnowGraphy
//
//  Created by 陈前进 on 2017/12/14.
//  Copyright © 2017年 chqjboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoLabel : UILabel
+(CGRect)boundingRectWithWidth:(CGFloat)width string:(NSString*)string font:(UIFont*)font;
+(CGRect)boundingRectWithWidth:(CGFloat)width string:(NSString*)string font:(UIFont*)font linespace:(CGFloat)linespace;
@end
