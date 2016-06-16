//
//  ElevenAppContext.h
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ElevenNetworkConfiguration.h"
@interface ElevenAppContext : NSObject

//凡是未声明成readonly的都是需要在初始化的时候由外面给的

/*! @brief 渠道号. */
@property (nonatomic, copy) NSString *channelID;
/*! @brief 应用名称. */
@property (nonatomic, copy) NSString *appName;
/*! @brief deviceToken. */
@property (nonatomic, copy) NSString *deviceToken;
/*! @brief app版本. */
@property (nonatomic, copy, readonly) NSString *appVersion;
/*! @brief 内部版本号. */
@property (nonatomic, copy, readonly) NSString *buildVersion;
/*! @brief 当前时间戳. */
@property (nonatomic, readonly) NSTimeInterval timestamp;
/*! @brief 设备名称. */
@property (nonatomic, copy, readonly) NSString *deviceName;
/*! @brief 系统名称. */
@property (nonatomic, copy, readonly) NSString *osName;
/*! @brief 系统版本. */
@property (nonatomic, copy, readonly) NSString *osVersion;
/*! @brief MD_5加密后的mac地址. */
@property (nonatomic, copy, readonly) NSString *macId;
/*! @brief 设备唯一标识符 */
@property (nonatomic, copy, readonly) NSString *uuid;
/*! @brief 设备广告标识符. */
@property (nonatomic, copy, readonly) NSString *IDFA;
/*! @brief 所在地区 */
@property (nonatomic, copy, readonly) NSString *lang;
/*! @brief 手机语言 */
@property (nonatomic, copy, readonly) NSString *locale;
/*! @brief app的运行环境 */
@property (nonatomic, readonly) ELAppEnvironmentOptions appEnvironment;
/*! @brief 网络请求的服务器地址. */
@property (nonatomic, copy, readonly) NSString * networkRequestUrl;
/*! @brief 网络请求的appkey */
@property (nonatomic, copy, readonly) NSString *appkey;
/*! @brief 网络请求的appSecrect */
@property (nonatomic, copy, readonly) NSString *appSecrect;

+ (instancetype)sharedInstance;


@end
