//
//  NSArray+ELNetworkingMethods.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "NSArray+ELNetworkingMethods.h"

@implementation NSArray (ELNetworkingMethods)

/** 字母排序之后形成的参数字符串 */
- (NSString *)SF_paramsString
{
    NSMutableString *paramString = [[NSMutableString alloc] init];
    NSArray *sortedParams = [self sortedArrayUsingSelector:@selector(compare:)];
    [sortedParams enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([paramString length] == 0) {
            [paramString appendFormat:@"%@",obj];
        } else {
            [paramString appendFormat:@"&%@",obj];
        }
        
    }];
    
    return paramString;
}

/* 数组json */
- (NSString *)SF_jsonString
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


@end
