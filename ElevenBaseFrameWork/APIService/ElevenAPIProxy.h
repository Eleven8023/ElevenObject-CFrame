//
//  ElevenAPIProxy.h
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ELURLResponseStatus){
    KEnumURLResponseStatusSuccess,// 作为底层, 请求是否成功只考虑是否成功收到服务器反馈
    KEnumURLResponseStatusErrorTimeout, // 未收到服务器反馈, 网络连接超时错误
    KEnumURLResponseStatusErrorNoNetwork,// 无网络错误
    KEnumURLResponseStatusErrorNoConnect,// 未能连接到服务器
    KEnumURLResponseStasusErrorFormatError,// 数据格式错误
    KEnumURLResponseStatusErrorCancell,// 请求取消
};

typedef void(^ELCallbackSuccess)(NSDictionary *response, ELURLResponseStatus status);
typedef void(^ELCallbackFailure)(id *response, ELURLResponseStatus status);
@interface ElevenAPIProxy : NSObject

+ (instancetype)shareInstance;

- (NSURLSessionDataTask *)postRequestWithUrl:(NSString *)urlString
                                   paramsDic:(NSDictionary *)paramsDic
                               successBlock:(ELCallbackSuccess)successBlock
                                failureBlock:(ELCallbackFailure)failureBlock;
// 取消网络任务
- (void)cancellRequestWithTask:(NSURLSessionDataTask *)task;


@end
