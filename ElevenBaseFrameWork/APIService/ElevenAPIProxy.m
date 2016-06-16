//
//  ElevenAPIProxy.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "ElevenAPIProxy.h"
#import "AFNetworking.h"
#import "NSArray+ELNetworkingMethods.h"
#import "NSDictionary+ELNetworkingMethods.h"
#import "NSString+SFNetworking.h"
#import "ElevenAppContext.h"
#import "ElevenNetworkConfiguration.h"
@implementation ElevenAPIProxy

+ (instancetype)shareInstance
{
    static ElevenAPIProxy *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[ElevenAPIProxy alloc] init];
    });
    return shareInstance;
}

- (NSURLSessionDataTask *)postRequestWithUrl:(NSString *)urlString paramsDic:(NSDictionary *)paramsDic successBlock:(ELCallbackSuccess)successBlock failureBlock:(ELCallbackFailure)failureBlock{
    
    // 签名业务参数
    NSMutableArray *signArray = [[NSMutableArray alloc] initWithArray:[paramsDic SF_transformedUrlParamsArraySignature:YES]];
    [signArray addObject:[NSString stringWithFormat:@"app_secret=%@",[ElevenAppContext sharedInstance].appSecrect]];
    // 生成签名
    NSString * sign = [[signArray SF_paramsString] SF_md5];
    // 请求参数拼接签名
    NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithDictionary:paramsDic];
    [params setObject:sign forKey:@"sign"];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",[ElevenAppContext sharedInstance].networkRequestUrl, urlString]];
    
    // 请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    requestSerializer.timeoutInterval = kSFNetworkingTimeoutSeconds;
    manager.requestSerializer = requestSerializer;
    
    if ([urlString hasPrefix:@"https://"]) {
        manager.securityPolicy = [self customSecurityPolicy];
    }
    
    __block UIApplication * weekApp = [UIApplication sharedApplication];
    weekApp.networkActivityIndicatorVisible = YES;
    
    NSURLSessionDataTask *task = [manager POST:URL.absoluteString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        weekApp.networkActivityIndicatorVisible = NO;
        if (!TYPESECURITYCHECK(responseObject, [NSData class])) {
            failureBlock(nil, KEnumURLResponseStasusErrorFormatError);
            return ;
        }
        
        NSDictionary *dicResponse = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        successBlock(dicResponse, KEnumURLResponseStatusSuccess);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        weekApp.networkActivityIndicatorVisible = NO;
        // 1,未能连接服务器 2, 似乎已断开与互联网的连接 3,请求超时 4, 请求取消
        if ([error.localizedDescription rangeOfString:@"已取消"].length != 0) {
            failureBlock(nil, KEnumURLResponseStatusErrorCancell);
        }else if ([error.localizedDescription rangeOfString:@"请求超时"].length != 0){
            failureBlock(nil, KEnumURLResponseStatusErrorTimeout);
        }else if ([error.localizedDescription rangeOfString:@"未能连接到服务器"].length != 0){
            failureBlock(nil, KEnumURLResponseStatusErrorNoConnect);
        }else{
            failureBlock(nil, KEnumURLResponseStatusErrorNoNetwork);
        }
    }];
    return task;
}

- (AFSecurityPolicy *)customSecurityPolicy
{
    // 先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"serverdevelop" ofType:@"cer"];// 证书的路径
    if ([ElevenAppContext sharedInstance].appEnvironment == KEnumELAppEnvironmentProduction) {
        cerPath = [[NSBundle mainBundle] pathForResource:@"severProduction" ofType:@"cer"];
    }
    
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // 如果需要验证自建证书 需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = [NSSet setWithArray:@[cerData]];
    return securityPolicy;
}

- (void)cancellRequestWithTask:(NSURLSessionDataTask *)task{
    if (task.state != NSURLSessionTaskStateCompleted) {
        [task cancel];
        
        NSLog(@"request clearDelegatesAndCancel\n");
    }
    else {
        NSLog(@"request has finished\n");
    }

}

@end
