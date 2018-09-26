
#import "NavigationCtrler.h"
#import "SimpleTableViewCell.h"
@interface TableViewCtrler : NavigationCtrler
<
UITableViewDelegate,
UITableViewDataSource
>
@property(nonatomic, retain) UITableView* table;
@property(nonatomic, retain) NSMutableArray<VPSimpleTableViewCell*>* cells;
-(NSArray*)dictionarysOfAnalyCell;
-(Class)classOfAnlayDictinary;
-(Class)classOfTableViewCell;
-(void)selectCellWithParam:(VPSimpleTableViewCell*)param;
@end
