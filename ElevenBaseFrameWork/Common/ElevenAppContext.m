//
//  ElevenAppContext.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "ElevenAppContext.h"
#import <AdSupport/AdSupport.h>

@interface ElevenAppContext ()
@property (nonatomic, strong) UIDevice *device;
/*! @brief app 版本 .*/
@property (nonatomic, copy, readwrite) NSString *appVersion;
/*! @brief 内部版本号 .*/
@property (nonatomic, copy, readwrite) NSString *buildVersion;
/*! @brief 当前时间戳 .*/
@property (nonatomic, readwrite) NSTimeInterval timestamp;
/*! @brief 设备名称.*/
@property (nonatomic, copy, readwrite) NSString *deviceName;
/*! @brief 系统名称 .*/
@property (nonatomic, copy, readwrite) NSString *osName;
/*! @brief 系统版本 .*/
@property (nonatomic, copy, readwrite) NSString *osVersion;
/*! @brief MD_5加密后的Mac地址 .*/
@property (nonatomic, copy, readwrite) NSString *macID;
/*! @brief app 设备唯一标识符 .*/
@property (nonatomic, copy, readwrite) NSString *uuid;
/*! @brief 设备广告标识符 .*/
@property (nonatomic, copy, readwrite) NSString *IDFA;
/*! @brief 所在地区.*/
@property (nonatomic, copy, readwrite) NSString *lang;
/*! @brief 手机语言 .*/
@property (nonatomic, copy, readwrite) NSString *locale;
/*! @brief 网络请求的服务器地址 .*/
@property (nonatomic, copy, readwrite) NSString *networkRequestUrl;
/*! @brief app的运行环境. */
@property (nonatomic, readwrite) ELAppEnvironmentOptions appEnvironment;

@end

@implementation ElevenAppContext

@synthesize deviceToken = _deviceToken;

- (UIDevice *)device
{
    if (_device == nil) {
        _device = [UIDevice currentDevice];
    }
    return _device;
}

- (NSString *)appVersion{
    if (_appVersion == nil) {
        _appVersion = [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    }
    return _appVersion;
}

- (NSString *)buildVersion{
    if (_buildVersion == nil) {
        _buildVersion = [NSString stringWithFormat:@"%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    }
    return _buildVersion;
}

- (NSString *)deviceToken{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"BDUserId"];
}

- (void)setDeviceToken:(NSString *)deviceToken{
    if (!deviceToken) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:deviceToken forKey:@"BDUserId"];
}

- (NSTimeInterval)timestamp{
    _timestamp = [[NSDate date] timeIntervalSince1970];
    return _timestamp;
}

- (NSString *)deviceName{
    if (_deviceName == nil) {
        _deviceName = [UIDevice currentDevice].name;
    }
    return _deviceName;
}

- (NSString *)osName{
    if (_osName == nil) {
        _osName = [UIDevice currentDevice].systemName;
    }
    return _osName;
}

- (NSString *)osVersion{
    if (_osVersion) {
        _osVersion = [UIDevice currentDevice].systemVersion;
    }
    return _osVersion;
}

- (ELAppEnvironmentOptions)appEnvironment{
    return KAppEnvironment;
}

- (NSString *)networkRequestUrl{
    if (self.appEnvironment == KEnumELAppEnvironmentDevelop) {
        _networkRequestUrl = ELNetworkRequestUrlForDevelop;
    }else if (self.appEnvironment == KEnumELAppEnvironmentTest){
        _networkRequestUrl = ELNetworkRequestUrlForTest;
    }else{
        _networkRequestUrl = ELNetworkRequestUrlForProduction;
    }
    
    return _networkRequestUrl;
}

+ (instancetype)sharedInstance
{
    static ElevenAppContext *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ElevenAppContext alloc] init];
    });
    return sharedInstance;
}


@end
