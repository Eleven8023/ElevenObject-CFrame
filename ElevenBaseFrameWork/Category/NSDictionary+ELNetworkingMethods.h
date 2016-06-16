//
//  NSDictionary+ELNetworkingMethods.h
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ELNetworkingMethods)

- (NSString *)SF_urlParamsStringSignature:(BOOL)isForSignature;
- (NSString *)SF_jsonString;
- (NSArray *)SF_transformedUrlParamsArraySignature:(BOOL)isForSignature;

@end
