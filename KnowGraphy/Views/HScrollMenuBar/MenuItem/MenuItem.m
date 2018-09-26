
#import "MenuItem.h"
@implementation ParamMenuItem
+(instancetype)instanceWithData:(NSDictionary*)data
{
    ParamMenuItem* item = [[ParamMenuItem alloc]init];
    [item setValuesForKeysWithDictionary:data];
    return item;
}
+(NSArray*)itemsWithArrData:(NSArray*)array
{
    NSMutableArray* ret = [[NSMutableArray alloc]init];
    for (NSDictionary* dic in array)
    {
        ParamMenuItem* item = [ParamMenuItem instanceWithData:dic];
        if (item)
        {
            [ret addObject:item];
        }
    }
    return ret;
}
@end

@implementation MenuItem

-(instancetype)initWithFrame:(CGRect)frame param:(ParamMenuItem*)param
{
    self = [super initWithFrame:frame];
    self.param = param;
    self.text = self.param.title;
    self.font = SystemFont(12);
    self.textColor = COLOR_FT_2;
    self.textAlignment = NSTextAlignmentCenter;
    self.select = param.select;
    [self anlyFrame];
    [Global addTapEventWithTarget:self View:self andAction:@selector(itemClick)];
    return self;
}
-(void)anlyFrame
{
    CGRect bounding = [FitLineLabel boundingRectWithWidth:CGFLOAT_MAX string:self.param.title font:self.font lines:0];
    bounding.size.width += ScaleSize(15);
    bounding.size.height = ScaleSize(40);
    CGRect frame = self.frame;
    frame.size = bounding.size;
    self.frame = frame;
}
-(void)setSelect:(BOOL)select
{
    _select = select;
    self.param.select = select;
    if (select)
    {
        self.textColor = COLOR_FT_3;
        self.font = SystemFont(13);
    }else
    {
        self.textColor = COLOR_FT_2;
        self.font = SystemFont(12);
    }
}
-(void)itemClick
{
    if ([self.delegate respondsToSelector:@selector(selectedMenuItem:)])
    {
        [self.delegate selectedMenuItem:self];
    }
}
@end
