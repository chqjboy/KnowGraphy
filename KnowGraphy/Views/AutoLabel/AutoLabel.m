
#import "AutoLabel.h"

@implementation AutoLabel
+(CGRect)boundingRectWithWidth:(CGFloat)width string:(NSString*)string font:(UIFont*)font
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                       options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName: font}
                                       context:nil];
    return rect;
}
+(CGRect)boundingRectWithWidth:(CGFloat)width string:(NSString*)string font:(UIFont*)font linespace:(CGFloat)linespace
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = linespace; //设置行间距
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                       options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName: font,
                                                 NSParagraphStyleAttributeName: paraStyle
                                                 }
                                       context:nil];
    return rect;
}
@end
