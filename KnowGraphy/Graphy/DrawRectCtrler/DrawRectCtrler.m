
#import "DrawRectCtrler.h"

@interface DrawRectCtrler ()

@end

@implementation DrawRectCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DrawRect";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initViews
{
    CGRect rect = self.view.bounds;
    CGRect rtMenubar = rect;
    [self initMenubarWithRect:rtMenubar];
    rtMenubar = self.menubar.frame;
    
    CGRect rtDraw = rect;
    rtDraw.origin.y = rtMenubar.size.height;
    rtDraw.size.height = rect.size.height-rtDraw.origin.y;
    [self initDrawWithRect:rtDraw];
}
-(void)initMenubarWithRect:(CGRect)rect
{
    NSArray* items = @[
                       @{
                           @"key":@(eDrawRectType_def),
                           @"title":@"默认"
                           },
                       @{
                           @"key":@(eDrawRectType_original),
                           @"title":@"原始"
                           },
                       @{
                           @"key":@(eDrawRectType_direct),
                           @"title":@"直接"
                           },
                       @{
                           @"key":@(eDrawRectType_bezier),
                           @"title":@"bezier"
                           },
                       @{
                           @"key":@(eDrawRectType_curve_original),
                           @"title":@"曲线原始"
                           },
                       @{
                           @"key":@(eDrawRectType_curve_direct),
                           @"title":@"曲线直接"
                           },
                       @{
                           @"key":@(eDrawRectType_roundrect),
                           @"title":@"圆角矩形"
                           },
                       @{
                           @"key":@(eDrawRectType_sector),
                           @"title":@"扇形"
                           },
                       @{
                           @"key":@(eDrawRectType_stateline),
                           @"title":@"状态管线"
                           },
                       @{
                           @"key":@(eDrawRectType_matrix),
                           @"title":@"矩阵变换"
                           },
                       @{
                           @"key":@(eDrawRectType_watermark),
                           @"title":@"水印"
                           },
                       @{
                           @"key":@(eDrawRectType_imagecut),
                           @"title":@"裁剪图片"
                           },
                       @{
                           @"key":@(eDrawRectType_viewsave),
                           @"title":@"视图保存"
                           }
                       ];
    self.menubar = [[HScrollMenuBar alloc]initWithFrame:rect items:[ParamMenuItem itemsWithArrData:items]];
    self.menubar.delegate = self;
    [self.view addSubview:self.menubar];
}
-(void)initDrawWithRect:(CGRect)rect
{
    self.draw = [[DrawRectView alloc]initWithFrame:rect];
    [self.view addSubview:self.draw];
}
-(void)selectedItem:(ParamMenuItem*)item
{
    [self.draw setType:item.key.integerValue];
}
@end
