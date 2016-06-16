//
//  UIView+Toast.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/15.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "UIView+Toast.h"
#import "UIImage+GIF.h"

@implementation UIView (Toast)

- (void)showIndicatorView
{
    UIView *indicatorView = (UIView *)[self viewWithTag:2101];
    if (!indicatorView) {
        indicatorView = [self createIndicatorView];
    }
    [self addSubview:indicatorView];
}

// 创建展示动画视图
- (UIView *)createIndicatorView{
    UIView *indicatorView = [[UIView alloc] initWithFrame:UISCREEN_BOUNCE];
    indicatorView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    indicatorView.tag = 2101;
    indicatorView.backgroundColor = [UIColor clearColor];
    
    UIImageView *launchAnimationView = [[UIImageView alloc] init];
    // 创建GIF, 传入GIF图片名称即可
    UIImage *git_image = [UIImage sd_animatedGIFNamed:@"loading"];
    launchAnimationView.image = git_image;
    launchAnimationView.tag = 103;
    launchAnimationView.frame = UISCREEN_BOUNCE;
    launchAnimationView.center = CGPointMake(indicatorView.frame.size.width/ 2.0, indicatorView.frame.size.height / 2.0);
    [indicatorView addSubview:launchAnimationView];
    return indicatorView;
}

// 隐藏IndicatorView
- (void)hideIndicatorView
{
    UIView *indicatorView = (UIView *)[self viewWithTag:2101];
    if (indicatorView) {
        [indicatorView removeFromSuperview];
    }
}


@end
