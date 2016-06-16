//
//  NSDictionary+ELNetworkingMethods.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "NSDictionary+ELNetworkingMethods.h"
#import "NSArray+ELNetworkingMethods.h"

@implementation NSDictionary (ELNetworkingMethods)


/** 字符串前面是没有问号的，如果用于POST，那就不用加问号，如果用于GET，就要加个问号 */
- (NSString *)SF_urlParamsStringSignature:(BOOL)isForSignature
{
    NSArray *sortedArray = [self SF_transformedUrlParamsArraySignature:isForSignature];
    return [sortedArray SF_paramsString];
}

/** 字典变json */
- (NSString *)SF_jsonString
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/** 转义参数 */
- (NSArray *)SF_transformedUrlParamsArraySignature:(BOOL)isForSignature
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![obj isKindOfClass:[NSString class]]) {
            obj = [NSString stringWithFormat:@"%@", obj];
        }
        if (!isForSignature) {
            obj = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,  (CFStringRef)obj,  NULL,  (CFStringRef)@"!*'();:@&;=+$,/?%#[]",  kCFStringEncodingUTF8));
        }
        [result addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
        //        if ([obj length] > 0) {
        //            [result addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
        //        }
    }];
    NSArray *sortedResult = [result sortedArrayUsingSelector:@selector(compare:)];
    return sortedResult;
}


@end
