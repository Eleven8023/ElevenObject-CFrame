//
//  UIBarButtonItem+ELBarButtonItem.h
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ELBarButtonItem)

/**
 * @brief 根据图片创建一个UIBarButtonItem
 */
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image
                                  target:(id)target
                                  action:(SEL)action
                                   width:(CGFloat)width
                                  height:(CGFloat)height;
/**
 * @brief UIBarButtonItem样式为一张icon和title
 */
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image
                               titleName:(NSString *)titleName
                              titleColor:(UIColor *)titleColor
                                  target:(id)target
                                  action:(SEL)action
                                   width:(CGFloat)width
                                  height:(CGFloat)height;
@end
