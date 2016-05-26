//
//  ViewController.m
//  PostCodeInChinaStoreByCoreData
//
//  Created by suxinde on 16/5/27.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#import "ViewController.h"
#import "PostCode.h"
#import "XDStore.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UISearchBar *searchBar;
//
@property (nonatomic, strong) XDStore *store;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initModels];
    [self initUI];
    
    [self loadData];
}

- (void)initUI
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-20) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setScrollIndicatorInsets:UIEdgeInsetsMake(44, 0, 0, 0)];
    [self.view addSubview:_tableView];
}

- (void)initModels
{
    self.store = [XDStore sharedInstance];
    self.dataSource = [[NSMutableArray alloc] initWithCapacity:0];
}

- (void)loadData
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"PostCode"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"province" ascending:NO],
                                [NSSortDescriptor sortDescriptorWithKey:@"city" ascending:NO],
                                [NSSortDescriptor sortDescriptorWithKey:@"district" ascending:NO]];
    NSError *error = nil;

    NSArray *tmpArr = [[XDStore sharedInstance].managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"%@", error);
    }
    if ((!tmpArr) || ([tmpArr isKindOfClass:[NSArray class]] && tmpArr.count <= 0)) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *strPath = [[NSBundle mainBundle] pathForResource:@"城市邮编最终整理_方便导入数据库" ofType:@"txt"];
            NSString *text = [NSString stringWithContentsOfFile:strPath encoding:NSUTF16StringEncoding error:nil];
            NSArray *lineArr = [text componentsSeparatedByString:@"\n"];
            NSEntityDescription *description = [NSEntityDescription entityForName:@"PostCode" inManagedObjectContext:self.store.managedObjectContext];
            for (NSString *line in lineArr) {
                NSArray *items = [line componentsSeparatedByString:@"\t"];
                /*items[0],items[1], items[2], items[3], items[4], items[5]*/
                PostCode *postcode = [[PostCode alloc] initWithEntity:description insertIntoManagedObjectContext:self.store.managedObjectContext];
                postcode.id = items[0];
                postcode.province = items[1];
                postcode.city = items[2];
                postcode.district = items[3];
                postcode.cityId = ((NSString *)items[4]).length >=4 ? items[4]:[@"0" stringByAppendingString:items[4]];
                postcode.postCode = items[5];
            }
            [weakSelf.store saveContext];
            
            NSError *error = nil;
            NSArray *tmpArr2 = [weakSelf.store.managedObjectContext executeFetchRequest:request error:&error];
            if (error) {
                NSLog(@"%@", error);
            } else {
                [weakSelf.dataSource removeAllObjects];
                [weakSelf.dataSource addObjectsFromArray:tmpArr2];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_tableView reloadData];
                });
            }

        });
        
    }else {
        [self.dataSource removeAllObjects];
        [self.dataSource addObjectsFromArray:tmpArr];
        [self.tableView reloadData];
    }
    
    // 删除所有数据
    //        for (PostCode *postcode in a) {
    //            [self.store.managedObjectContext deleteObject:postcode];
    //        }
    //        [self.store saveContext];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"搜索";
    }
    return _searchBar;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"POSTCODE";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == NULL) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    PostCode *postcode = [_dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@   %@   %@", postcode.province, postcode.city, postcode.district];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@   %@   %@   %@   %@   %@", postcode.id, postcode.province, postcode.city, postcode.district, postcode.cityId, postcode.postCode];
    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (!searchText.length) {
        [self loadData];
        return;
    }
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"PostCode"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"province" ascending:NO],
                                [NSSortDescriptor sortDescriptorWithKey:@"city" ascending:NO],
                                [NSSortDescriptor sortDescriptorWithKey:@"district" ascending:NO]];
    request.predicate = [NSPredicate predicateWithFormat:@"province CONTAINS %@ OR city CONTAINS %@ OR district CONTAINS %@", searchText, searchText, searchText];
    NSError *error = nil;
    NSArray *b = [self.store.managedObjectContext executeFetchRequest:request error:&error];
    _dataSource = [[NSMutableArray alloc] initWithArray:b];
    [_tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCode *postcode = [_dataSource objectAtIndex:indexPath.row];
    NSLog(@"%@", [NSString stringWithFormat:@"数据ID   :%@\n省份  :%@\n市  :%@\n区  :%@\n区号 :%@\n邮编 :%@\n", postcode.id, postcode.province, postcode.city, postcode.district, postcode.cityId, postcode.postCode]);
}

@end
