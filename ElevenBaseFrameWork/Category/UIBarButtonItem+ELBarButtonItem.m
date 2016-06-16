//
//  UIBarButtonItem+ELBarButtonItem.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "UIBarButtonItem+ELBarButtonItem.h"

@implementation UIBarButtonItem (ELBarButtonItem)


+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height
{
    CGRect frames = CGRectMake(0, 0, width, height);
    UIButton *barbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    barbutton.frame = frames;
    [barbutton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [barbutton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barbutton];
    return barButtonItem;
}

+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image titleName:(NSString *)titleName titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height
{
    CGRect frames = CGRectMake(0, 5, width, height);
    UIButton *barbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    barbutton.frame = frames;
    [barbutton setTitle:titleName forState:UIControlStateNormal];
    [barbutton setTitleColor:titleColor forState:UIControlStateNormal];
    [barbutton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    barbutton.titleLabel.font = [UIFont systemFontOfSize:14];
    [barbutton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barbutton];;
    return barButtonItem;
}


@end
