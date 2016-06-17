//
//  CustomTabbarView.h
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/17.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarModel.h"
@protocol selectedTabbarIndexDelegate <NSObject>

- (void)selecteTarItemIndex:(NSInteger)index;

@end

@interface CustomTabbarView : UIView

- (instancetype)initWithTabbarModel:(TabBarModel *)tabbarModel;
@property (nonatomic, assign) id<selectedTabbarIndexDelegate> tabbarSelectedDelegate;
@end
