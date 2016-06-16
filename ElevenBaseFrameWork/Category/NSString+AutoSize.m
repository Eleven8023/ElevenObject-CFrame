//
//  NSString+AutoSize.m
//  ElevenAutoTextSize
//
//  Created by Eleven on 16/6/15.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "NSString+AutoSize.h"

@implementation NSString (AutoSize)

-(CGSize)sizeWithFont:(UIFont *)font drawInSize:(CGSize)size{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize sizeToFit = [self boundingRectWithSize:CGSizeMake(size.width, size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    sizeToFit = CGSizeMake(ceil(sizeToFit.width), ceil(sizeToFit.height));
    return sizeToFit;
}

- (CGSize)calculateHeightOfContentWithWidth:(CGFloat)fWidth withFontSize:(CGFloat)fontSize withLineSpacing:(CGFloat)lineSpacing
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    NSDictionary * attribute = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle};
    CGSize sizeToFit = [self boundingRectWithSize:CGSizeMake(fWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    return sizeToFit;
}

@end
