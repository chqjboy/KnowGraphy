//
//  TableViewCtrler.m
//  Test
//
//  Created by 陈前进 on 2017/11/11.
//  Copyright © 2017年 chqjboy. All rights reserved.
//

#import "TableViewCtrler.h"

@interface TableViewCtrler ()

@end

@implementation TableViewCtrler

- (void)viewDidLoad {
    [self initCells];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initCells
{
    self.cells = [NSMutableArray array];
    NSArray* cells = [self dictionarysOfAnalyCell];
    if (cells==nil)
    {
        cells = @[
                  @{
                      @"name":@"第一个"
                      },
                  @{
                      @"name":@"第二个"
                      },
                  @{
                      @"name":@"第三个"
                      },
                  @{
                      @"name":@"第四个"
                      },
                  @{
                      @"name":@"第五个"
                      },
                  @{
                      @"name":@"第六个"
                      }
                  ];
    }
    for (NSDictionary* dic in cells)
    {
        VPSimpleTableViewCell* param = [[[self classOfAnlayDictinary] alloc]init];
        [param setValuesForKeysWithDictionary:dic];
        [self.cells addObject:param];
    }
    [self.table reloadData];
}
-(NSArray*)dictionarysOfAnalyCell
{
    return nil;
}
-(Class)classOfAnlayDictinary
{
    return [VPSimpleTableViewCell class];
}

-(Class)classOfTableViewCell
{
    return [SimpleTableViewCell class];
}

-(void)initViews
{
    CGRect rect = self.view.bounds;
    
    CGRect rtTable = rect;
    self.table = [[UITableView alloc]initWithFrame:rtTable];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.table setBackgroundColor:COLOR_CLEAR];
    [self.view addSubview:self.table];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VPSimpleTableViewCell* param = [self.cells objectAtIndex:indexPath.row];
    return [[self classOfTableViewCell] heightForCellWithParam:param width:tableView.bounds.size.width];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cells.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleTableViewCell* cell = [[self classOfTableViewCell] cellWithTableView:tableView];
    [cell updateWithParam:[self.cells objectAtIndex:indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self selectCellWithParam:[self.cells objectAtIndex:indexPath.row]];
}
-(void)selectCellWithParam:(VPSimpleTableViewCell*)cell
{
}
@end
