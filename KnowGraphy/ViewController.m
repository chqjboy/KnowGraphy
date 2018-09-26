
#import "ViewController.h"
#import "DrawRectCtrler.h"
#import "CIFilterSortsCtrler.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.title = @"图像处理";
    [super viewDidLoad];
    [self.btnBack setHidden:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(NSArray*)dictionarysOfAnalyCell
{
    NSArray* cells = @[
                       @{
                           @"name":@"绘图(DrawRect)",
                           @"data":NSStringFromClass([DrawRectCtrler class])
                           },
                       @{
                           @"name":@"滤镜分类(CIFilterSorts)",
                           @"data":NSStringFromClass([CIFilterSortsCtrler class])
                           },
                       ];
    return cells;
}
-(void)selectCellWithParam:(VPSimpleTableViewCell *)param
{
    NSString* clsName = param.data;
    
    NavigationCtrler* ctrler = [[NSClassFromString(clsName) alloc]init];
    ctrler.title = param.name;
    [self.navigationController pushViewController:ctrler animated:YES];
}

@end
