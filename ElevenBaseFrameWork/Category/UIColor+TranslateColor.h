//
//  UIColor+TranslateColor.h
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/15.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TranslateColor)
/**
 * @brief 返回随机颜色
 */
+ (instancetype)randColor;

/**
 * @brief 将16进制字符串转换成UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
