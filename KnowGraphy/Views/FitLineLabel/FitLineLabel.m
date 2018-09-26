
#import "FitLineLabel.h"
UILabel* g_testLabel = nil;
@implementation FitLineLabel
-(FitLineLabel*) initWithFrame:(CGRect)rect andContent:(NSString*)content andFont:(UIFont*)font andColor:(UIColor*)color
{
    if (![content isKindOfClass:[NSString class]])
    {
        content = [NSString stringWithFormat:@"%@", content];
    }
    self = [super initWithFrame:rect];
    [self setFont:font];
    [self setTextColor:color];
    [self setText:content];
    
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.originWidth = self.frame.size.width;
    CGSize size = CGSizeMake(self.originWidth, MAXFLOAT);
    size = [self sizeThatFits:size];
    rect.size = size;
    [self setFrame:rect];
    return self;
}

-(FitLineLabel*)initWithFrame:(CGRect)rect andContent:(NSAttributedString*)content
{
    self = [super initWithFrame:rect];
    [self setAttributedText:content];
    
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.originWidth = self.frame.size.width;
    CGSize size = CGSizeMake(self.originWidth, MAXFLOAT);
    size = [self sizeThatFits:size];
    rect.size = size;
    [self setFrame:rect];
    return self;
}

-(FitLineLabel*)initWithFrame:(CGRect)rect andContent:(NSAttributedString*)content andLimitLine:(NSInteger)lines
{
    self = [super initWithFrame:rect];
    [self setAttributedText:content];
    
    self.numberOfLines = lines;
    self.lineBreakMode = NSLineBreakByTruncatingTail;
    self.originWidth = self.frame.size.width;
    CGSize size = CGSizeMake(self.originWidth, MAXFLOAT);
    size = [self sizeThatFits:size];
    if (size.width>self.originWidth)
    {
        size.width = self.originWidth;
    }
    rect.size = size;
    [self setFrame:rect];
    return self;
}

-(FitLineLabel*) initWithFrame:(CGRect)rect andContent:(NSString*)content andFont:(UIFont*)font andColor:(UIColor*)color andLimitLine:(NSInteger)lines
{
    self = [super initWithFrame:rect];
    [self setFont:font];
    [self setTextColor:color];
    [self setText:content];
    
    self.numberOfLines = lines;
    self.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSString* text = @"测";
    for (int i=0; i<lines-1; i++)
    {
        text = [text stringByAppendingString:@"\n测"];
    }
    
    CGSize sizeTest = [text sizeWithAttributes:@{NSFontAttributeName: font}];
    
    
    self.originWidth = self.frame.size.width;
    CGSize size = CGSizeMake(self.originWidth, MAXFLOAT);
    size.height = sizeTest.height;
    size = [self sizeThatFits:size];
    rect.size.height = size.height;
    [self setFrame:rect];
    return self;
}
-(void)reloadText:(NSString*)text
{
    if (![text isKindOfClass:[NSString class]])
    {
        text = [NSString stringWithFormat:@"%@", text];
    }
    self.text = text;
    CGRect rect = self.frame;
    rect.size.width = self.originWidth;
    CGSize size = CGSizeMake(self.originWidth, MAXFLOAT);
    size = [self sizeThatFits:size];
    rect.size = size;
    [self setFrame:rect];
}
-(void)reloadText:(NSString *)text font:(UIFont*)font color:(UIColor*)color
{
    if (text==nil)
    {
        return;
    }
    NSMutableAttributedString* attribute = [[NSMutableAttributedString alloc]initWithString:text];
    [attribute addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    [attribute addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, text.length)];
    [self reloadAttribute:attribute];
}
-(void)reloadAttribute:(NSAttributedString*)attribute
{
    if (attribute==nil)
    {
        return;
    }
    self.attributedText = attribute;
    CGRect rect = self.frame;
    rect.size.width = self.originWidth;
    CGSize size = CGSizeMake(self.originWidth, MAXFLOAT);
    size = [self sizeThatFits:size];
    rect.size = size;
    [self setFrame:rect];
}
-(NSInteger)getLines
{
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(self.bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
    CGSize textSize = [self.text sizeWithAttributes:@{NSFontAttributeName :self.font}];
    NSUInteger textRow = (NSUInteger)(rect.size.height / textSize.height);
    return textRow;
}
+(CGFloat)heightWithFont:(UIFont*)font
{
    NSString* string = @"测试";
    CGRect bounds = [FitLineLabel boundingRectWithWidth:ScaleSize(100) string:string font:font lines:0];
    return bounds.size.height;
}
+(CGRect)boundingRectWithWidth:(CGFloat)width string:(NSString*)string font:(UIFont*)font lines:(NSInteger)lines
{
    if (g_testLabel==nil)
    {
        g_testLabel = [[UILabel alloc]init];
    }
    if (string==nil)
    {
        return CGRectZero;
    }
    NSMutableAttributedString* attribute = [[NSMutableAttributedString alloc]initWithString:string];
    [attribute addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    g_testLabel.attributedText = attribute;
    g_testLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    g_testLabel.numberOfLines = lines;
    CGSize size = [g_testLabel sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return CGRectMake(0, 0, size.width, size.height);
}
+(CGRect)boundingRectWithWidth:(CGFloat)width string:(NSString*)string font:(UIFont*)font linespace:(CGFloat)space lines:(NSInteger)lines
{
    if (g_testLabel==nil)
    {
        g_testLabel = [[UILabel alloc]init];
    }
    if (string==nil)
    {
        return CGRectZero;
    }
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    NSMutableAttributedString* attribute = [[NSMutableAttributedString alloc]initWithString:string];
    [attribute addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    [attribute addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    g_testLabel.attributedText = attribute;
    g_testLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    g_testLabel.numberOfLines = lines;
    CGSize size = [g_testLabel sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return CGRectMake(0, 0, size.width, size.height);
}
+(NSAttributedString*)attributeWithString:(NSString*)string font:(UIFont*)font linespace:(CGFloat)space lines:(NSInteger)lines
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    NSMutableAttributedString* attribute = [[NSMutableAttributedString alloc]initWithString:string];
    [attribute addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    [attribute addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    return attribute;
}
+(CGRect)boundingRectWithWidth:(CGFloat)width attribute:(NSAttributedString*)attribute lines:(NSInteger)lines
{
    g_testLabel.attributedText = attribute;
    g_testLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    g_testLabel.numberOfLines = lines;
    CGSize size = [g_testLabel sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return CGRectMake(0, 0, size.width, size.height);
}
@end
