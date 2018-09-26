//
//  SimpleTableViewCell.h
//  Test
//
//  Created by 陈前进 on 2017/11/9.
//  Copyright © 2017年 chqjboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SimpleReuseIdentifier @"SimpleTableViewCell"

@interface VPSimpleTableViewCell:NSObject
@property(nonatomic, retain) NSString* name;
@property(nonatomic, retain) id data;
@property(nonatomic, assign) CGFloat cellHeight;
@end

@interface SimpleTableViewCell : UITableViewCell
@property(nonatomic, retain) VPSimpleTableViewCell* param;
@property(nonatomic, retain) UILabel* name;
@property(nonatomic, retain) UIImageView* arrow;
@property(nonatomic, retain) UIView* bottomline;

+(instancetype)cellWithTableView:(UITableView*)tableView;
+(CGFloat)heightForCellWithParam:(VPSimpleTableViewCell*)param width:(CGFloat)width;
-(void)updateWithParam:(VPSimpleTableViewCell*)param;

@end
