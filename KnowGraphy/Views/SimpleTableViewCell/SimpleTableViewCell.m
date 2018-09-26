//
//  SimpleTableViewCell.m
//  Test
//
//  Created by 陈前进 on 2017/11/9.
//  Copyright © 2017年 chqjboy. All rights reserved.
//

#import "SimpleTableViewCell.h"
@implementation VPSimpleTableViewCell
-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
}
@end
@implementation SimpleTableViewCell
+(instancetype)cellWithTableView:(UITableView*)tableView
{
    SimpleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:SimpleReuseIdentifier];
    if (cell==nil)
    {
        cell = [[[self class] alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
+(CGFloat)heightForCellWithParam:(VPSimpleTableViewCell*)param width:(CGFloat)width
{
    return ScaleSize(45);
}
-(instancetype)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleReuseIdentifier];
    [self setBackgroundColor:COLOR_CELL];
    [self initSubViews];
    return self;
}
-(void)initSubViews
{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.name = [[UILabel alloc]init];
    [self.name setText:self.param.name];
    [self.name setFont:SystemFont(15)];
    [self.name setTextColor:COLOR_FT_2];
    [self.contentView addSubview:self.name];
    
    self.arrow = [[UIImageView alloc]initWithImage:ImageLoad(@"arrow_right")];
    [self.contentView addSubview:self.arrow];
    
    self.bottomline = [[UIView alloc]init];
    [self.bottomline setBackgroundColor:RGB(221, 221, 221)];
    [self.contentView addSubview:self.bottomline];
}
-(void)layoutSubviews
{
    CGRect rect = self.bounds;
    
    CGRect rtArrow = rect;
    rtArrow.size.width = ScaleSize(4.5);
    rtArrow.size.height = ScaleSize(8);
    rtArrow.origin.x = rect.size.width-rtArrow.size.width-ScaleSize(12);
    rtArrow.origin.y = (rect.size.height-rtArrow.size.height)/2;
    [self.arrow setFrame:rtArrow];
    
    CGRect rtName = rect;
    rtName.origin.x = ScaleSize(12);
    rtName.size.width = rtArrow.origin.x-2*rtName.origin.x;
    [self.name setFrame:rtName];
    
    CGRect rtLine = rect;
    rtLine.size.height = 0.5;
    rtLine.origin.y = rect.size.height-rtLine.size.height;
    [self.bottomline setFrame:rtLine];
}
-(void)updateWithParam:(VPSimpleTableViewCell*)param
{
    self.param = param;
    [self.name setText:self.param.name];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
