
#import <UIKit/UIKit.h>

@interface FitLineLabel : UILabel
@property(nonatomic, assign) CGFloat originWidth;
-(FitLineLabel*) initWithFrame:(CGRect)rect andContent:(NSString*)content andFont:(UIFont*)font andColor:(UIColor*)color;
-(FitLineLabel*)initWithFrame:(CGRect)rect andContent:(NSAttributedString*)content;
-(FitLineLabel*)initWithFrame:(CGRect)rect andContent:(NSAttributedString*)content andLimitLine:(NSInteger)lines;
-(FitLineLabel*) initWithFrame:(CGRect)rect andContent:(NSString*)content andFont:(UIFont*)font andColor:(UIColor*)color andLimitLine:(NSInteger)lines;
-(void)reloadText:(NSString*)text;
-(void)reloadText:(NSString *)text font:(UIFont*)font color:(UIColor*)color;
-(void)reloadAttribute:(NSAttributedString*)attribute;
-(NSInteger)getLines;
+(CGFloat)heightWithFont:(UIFont*)font;
+(CGRect)boundingRectWithWidth:(CGFloat)width string:(NSString*)string font:(UIFont*)font lines:(NSInteger)lines;
+(CGRect)boundingRectWithWidth:(CGFloat)width string:(NSString*)string font:(UIFont*)font linespace:(CGFloat)space lines:(NSInteger)lines;
+(NSAttributedString*)attributeWithString:(NSString*)string font:(UIFont*)font linespace:(CGFloat)space lines:(NSInteger)lines;
+(CGRect)boundingRectWithWidth:(CGFloat)width attribute:(NSAttributedString*)attribute lines:(NSInteger)lines;
@end
