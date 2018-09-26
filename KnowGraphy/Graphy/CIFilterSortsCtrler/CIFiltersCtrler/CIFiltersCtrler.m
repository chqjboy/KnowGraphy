
#import "CIFiltersCtrler.h"

@interface CIFiltersCtrler ()

@end

@implementation CIFiltersCtrler

- (void)viewDidLoad {
    self.title = [NSString stringWithFormat:@"%@(%@)", self.sort.name, self.sort.key];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backClick
{
    [self.filters stopTimer];
    [super backClick];
}
-(void)initViews
{
    CGRect rect = self.view.bounds;
    
    CGRect rtMenubar = rect;
    [self initMenubarWithRect:rtMenubar];
    rtMenubar = self.menubar.frame;
    
    CGRect rtMessage = rect;
    rtMessage.size.height = ScaleSize(40);
    rtMessage.origin.y = rtMenubar.origin.y+rtMenubar.size.height;
    [self initMessageWithRect:rtMessage];
    
    CGRect rtFilters = rect;
    rtFilters.origin.y = rtMessage.origin.y+rtMessage.size.height;
    rtFilters.size.height = rect.size.height-rtFilters.origin.y;
    [self initFiltersWithRect:rtFilters];
    
    
}
-(void)initMenubarWithRect:(CGRect)rect
{
    NSMutableArray* menus = [[NSMutableArray alloc]init];
    
    NSDictionary* dic = nil;
    ParamMenuItem* menu = nil;
    dic = @{
            @"key":@(eEmbedFilterMenu_sigleplay),
            @"title":@"单个播放"
            };
    menu = [ParamMenuItem instanceWithData:dic];
    [menus addObject:menu];
    
    dic = @{
            @"key":@(eEmbedFilterMenu_listplay),
            @"title":@"链式播放"
            };
    menu = [ParamMenuItem instanceWithData:dic];
    [menus addObject:menu];
    
    for (ParamCIFilter* filter in self.sort.filters)
    {
        dic = @{
                @"key":filter.key,
                @"title":filter.name,
                @"data":filter
                };
        ParamMenuItem* menu = [ParamMenuItem instanceWithData:dic];
        [menus addObject:menu];
    }
    self.menubar = [[HScrollMenuBar alloc]initWithFrame:rect items:menus];
    self.menubar.delegate = self;
    [self.view addSubview:self.menubar];
}

-(void)initMessageWithRect:(CGRect)rect
{
    self.message = [[UILabel alloc]initWithFrame:rect];
    [self.message setFont:SystemFont(12)];
    [self.message setTextAlignment:NSTextAlignmentCenter];
    [self.message setTextColor:COLOR_FT_2];
    [self.message setBackgroundColor:RGB(38, 41, 50)];
    [self.message setText:@"消息"];
    [self.view addSubview:self.message];
}
-(void)initFiltersWithRect:(CGRect)rect
{
    self.filters = [CIFiltersView insstanceWithFrame:rect sort:self.sort];
    self.filters.delegate = self;
    [self.view addSubview:self.filters];
}

-(void)selectedItem:(ParamMenuItem*)item
{
    if ([item.data isKindOfClass:[ParamCIFilter class]])
    {
        [self.filters actDefaultWithFilter:item.data];
    }else if(item.key.integerValue==eFiltersPlayMode_sigle)
    {
        [self.filters siglePlay];
    }else if(item.key.integerValue==eFiltersPlayMode_list)
    {
        [self.filters listPlay];
    }
}
-(void)outputMsg:(NSString*)msg
{
    [self.message setText:msg];
}
@end
