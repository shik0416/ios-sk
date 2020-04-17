//
//  FindViewController.m
//  sk-ios
//
//  Created by 史凯 on R 2/04/13.
//  Copyright © Reiwa 2 shikai. All rights reserved.
//

#import "FindViewController.h"
#import "GouWuViewController.h"

@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong )UITableView *tableView;
@property (nonatomic ,strong )NSArray *dataArray;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self getNameData];
    [self.view addSubview:self.tableView];
    //去除导航栏下方的横线
    [self clearNavigationBarLine];
}

-(void)viewWillAippear:(BOOL)animated{
      
    [super viewWillAppear:animated];
    [self clearNavigationBarLine];
    
}

- (void)getNameData
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"dataManage" ofType:@"plist"];

    NSDictionary *usersDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];

    _dataArray = [usersDic objectForKey:@"FindInterface"];
}

//去除导航栏下方的横线
- (void)clearNavigationBarLine
{
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init]
        forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.backgroundColor = UIColor.blackColor;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
}
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource =self;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section < _dataArray.count) {
        if ([_dataArray[section] isKindOfClass:[NSArray class]]) {
            NSArray *array = _dataArray[section];
            return array.count;
        }
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section < _dataArray.count) {
        NSString *str;
        if ([_dataArray[indexPath.section] isKindOfClass:[NSArray class]]) {
            NSArray *array = _dataArray[indexPath.section];
            str = array[indexPath.row];
            NSArray *array2 = [str componentsSeparatedByString:@"-"];
            cell.imageView.image = [UIImage imageNamed:array2[0]];
            cell.textLabel.text = array2[1];
        } else if([_dataArray[indexPath.section] isKindOfClass:[NSString class]]) {
            str = _dataArray[indexPath.section];
            NSArray *array = [str componentsSeparatedByString:@"-"];
            cell.imageView.image = [UIImage imageNamed:array[0]];
            cell.textLabel.text = array[1];
        }
    }
    cell.backgroundColor = [UIColor lightTextColor];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 8;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GouWuViewController *gouWu = [[GouWuViewController alloc]init];
    [gouWu viewDidLoad];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
