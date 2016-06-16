//
//  UIImage+Size.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/15.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "UIImage+Size.h"

@implementation UIImage (Size)

+ (UIImage *)imageWithCaputureView:(UIView *)view
{
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 把控件上的图层渲染到上下文, layer只能渲染
    [view.layer renderInContext:ctx];
    // 生成一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}


@end
