
#import "CIFilterSortsCtrler.h"
#import "CIFiltersCtrler.h"
@interface CIFilterSortsCtrler ()

@end

@implementation CIFilterSortsCtrler

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSArray*)dictionarysOfAnalyCell
{
    NSMutableArray<NSDictionary*>* cells = [[NSMutableArray alloc]init];
    NSArray* sorts = [CIFiltersDef getParamFilterSorts];
    for (ParamCIFilterSort* sort in sorts)
    {
        NSDictionary* cell = @{
                               @"name":sort.name,
                               @"data":sort
                               };
        [cells addObject:cell];
    }
    return cells;
}
-(void)selectCellWithParam:(VPSimpleTableViewCell *)param
{
    CIFiltersCtrler* ctrler = [[CIFiltersCtrler alloc]init];
    ctrler.sort = param.data;
    [self.navigationController pushViewController:ctrler animated:YES];
}

@end
