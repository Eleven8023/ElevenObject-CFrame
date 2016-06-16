//
//  NSString+AutoSize.h
//  ElevenAutoTextSize
//
//  Created by Eleven on 16/6/15.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (AutoSize)
/**
 @brief 自适应文本(不带行间距)
 @param font 字体大小 size
 */
- (CGSize)sizeWithFont:(UIFont *)font drawInSize:(CGSize)size;

/**
 @brief 自适应文本大小(带行间距)
 @param fwidth 视图的width  fontSize 文本字体大小 lineSpacing 行间距
 */

- (CGSize)calculateHeightOfContentWithWidth:(CGFloat)fWidth
                                withFontSize:(CGFloat)fontSize
                             withLineSpacing:(CGFloat)lineSpacing;


@end
