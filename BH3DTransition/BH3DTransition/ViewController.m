//
//  ViewController.m
//  BH3DTransition
//
//  Created by libohao on 15/8/8.
//  Copyright (c) 2015年 libohao. All rights reserved.
//

#import "ViewController.h"
#import "BHNavigation.h"

static NSInteger pushedCount = 1;


@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

#pragma mark - Property

- (UITableView* )tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

#pragma mark - life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    self.bh_NavigationItem.title = [NSString stringWithFormat:@"第 %ld 页", (long)pushedCount];
    
    __weak typeof(ViewController) *weakSelf = self;
    
    if (pushedCount > 0) {
        self.bh_NavigationItem.leftBarButtonItem = [[BHBarButtonItem alloc] initWithTitle:@"返回" style:BHBarButtonItemStylePlain handler:^(id sender) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
    }
    
    self.bh_NavigationItem.rightBarButtonItem = [[BHBarButtonItem alloc] initWithTitle:@"下一页" style:BHBarButtonItemStylePlain handler:^(id sender) {
        [weakSelf pushToNextVC];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pushToNextVC {
    ViewController *vc = [[ViewController alloc] init];
    pushedCount ++;
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"BH3DTransition";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewController* vc = [[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
