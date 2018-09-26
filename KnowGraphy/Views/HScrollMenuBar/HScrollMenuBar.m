
#import "HScrollMenuBar.h"

@implementation HScrollMenuBar
-(instancetype)initWithFrame:(CGRect)frame items:(NSArray<ParamMenuItem*>*)items
{
    frame.size.height = ScaleSize(40);
    self = [super initWithFrame:frame];
    self.items = items;
    [self initViews];
    return self;
}
-(void)initViews
{
    CGRect rect = self.bounds;
    [self initHscrollWithRect:rect];
}
-(void)initHscrollWithRect:(CGRect)rect
{
    self.hscroll = [[HScrollView alloc]initWithFrame:rect];
    [self addSubview:self.hscroll];
    [self reloadContent];
}
-(void)reloadContent
{
    [self.hscroll removeAllItems];
    CGRect rect = self.bounds;
    for (ParamMenuItem* param in self.items)
    {
        MenuItem* item = [[MenuItem alloc]initWithFrame:rect param:param];
        item.delegate = self;
        [self.hscroll addItemWithView:item];
    }
    [self.hscroll reloadItems];
}
-(void)selectedMenuItem:(MenuItem *)item
{
    for (UIView* view in self.hscroll.views)
    {
        if (![view isKindOfClass:[MenuItem class]])
        {
            continue;
        }
        MenuItem* tmp = (MenuItem*)view;
        [tmp setSelect:(item==tmp)];
    }
    if ([self.delegate respondsToSelector:@selector(selectedItem:)])
    {
        [self.delegate selectedItem:item.param];
    }
}
@end
