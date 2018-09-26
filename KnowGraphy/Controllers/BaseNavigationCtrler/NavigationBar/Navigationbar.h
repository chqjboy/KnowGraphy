//
//  Navigationbar.h
//  MyController
//
//  Created by 陈前进 on 16/3/23.
//  Copyright © 2016年 mycontroller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
@interface Navigationbar : UINavigationBar
@property (nonatomic,retain)UIColor *stateBarColor;/**< 默认black*/
@property (nonatomic,assign)UIBarStyle cusBarStyele;/**< 默认UIBarStyleBlackOpaque*/
@property (nonatomic,retain)NSNumber *stateBarStyle;
@property(nonatomic, retain)UIImage* colorImage;
- (void)setDefault;
@end
