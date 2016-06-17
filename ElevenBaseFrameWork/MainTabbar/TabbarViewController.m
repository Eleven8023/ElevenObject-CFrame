//
//  TabbarViewController.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/17.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "TabbarViewController.h"
#import "TabBarModel.h"
#import "CustomTabbarView.h"
#import "UIView+SDAutoLayout.h"
@interface TabbarViewController ()<selectedTabbarIndexDelegate>
@property (nonatomic, strong) TabBarModel *barModel;
@property (nonatomic, strong) CustomTabbarView *customTabBar;

@end

@implementation TabbarViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _barModel = [[TabBarModel alloc] init];
        [_barModel setContentWithPlistFile];
        NSMutableArray *viewControllerArray = [[NSMutableArray alloc] initWithCapacity:_barModel.tabBarItems.count];
        for (NSDictionary *dic in _barModel.tabBarItems) {
            Class class = NSClassFromString([dic objectForKey:@"uiviewControllerName"]);
            [viewControllerArray addObject:[ [class alloc] init]];
        }
        self.viewControllers = viewControllerArray;
        [self.tabBar setHidden:TRUE];
        [self layoutSubViews];
    }
    return self;
}

- (void)layoutSubViews
{
    self.customTabBar = [[CustomTabbarView alloc] initWithTabbarModel:self.barModel];
    self.customTabBar.tabbarSelectedDelegate = self;
    [self.view addSubview:self.customTabBar];
    self.customTabBar.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(self.view, UISCREEN_HEIGHT - 50);
}

#pragma mark - tabbarDelegate
- (void)selecteTarItemIndex:(NSInteger)index
{
    self.selectedIndex = index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
