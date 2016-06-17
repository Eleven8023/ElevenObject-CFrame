//
//  CustomTabbarView.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/17.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "CustomTabbarView.h"
#import "UIView+SDAutoLayout.h"
#import "UIColor+TranslateColor.h"

@implementation CustomTabbarView{
    TabBarModel *_tabbarmodel;
}

- (instancetype)initWithTabbarModel:(TabBarModel *)tabbarModel
{
    self = [super init];
    if (self) {
        _tabbarmodel = tabbarModel;
        self.backgroundColor = [UIColor colorWithHexString:tabbarModel.color alpha:1.0];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    
    if ([_tabbarmodel.style isEqualToString:@"UIVisualEffectView"]) {
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        visualEffectView.frame = self.bounds;
        visualEffectView.alpha = 1.0;
        [self addSubview:visualEffectView];
    }
    
    for (int i = 0; i < _tabbarmodel.tabBarItems.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(UISCREEN_WIDTH / _tabbarmodel.tabBarItems.count * i + (UISCREEN_WIDTH - UISCREEN_WIDTH / _tabbarmodel.tabBarItems.count * (_tabbarmodel.tabBarItems.count - 1) - 50) / 2, -2, 50, 50);
        [button setImage:[UIImage imageNamed:[[_tabbarmodel.tabBarItems objectAtIndex:i] objectForKey:@"unselectedIconName"]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[[_tabbarmodel.tabBarItems objectAtIndex:i] objectForKey:@"selectedIconName"]] forState:UIControlStateSelected];
        button.tag = i + 10;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(customButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    [self customButtonAction:(UIButton *)[self viewWithTag:_tabbarmodel.selectIndex + 10]];
}

- (void)customButtonAction:(UIButton *)sender
{
    UIButton *btn = (UIButton *)[self viewWithTag:_tabbarmodel.selectIndex + 10];
    btn.selected = NO;
    sender.selected = YES;
    [self selectedIten:sender.tag - 10];
    [self.tabbarSelectedDelegate selecteTarItemIndex:sender.tag - 10];
}

- (void)selectedIten:(NSInteger )index
{
    _tabbarmodel.selectIndex = index;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
