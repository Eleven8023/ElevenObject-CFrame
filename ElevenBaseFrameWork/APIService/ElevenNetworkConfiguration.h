//
//  ElevenNetworkConfiguration.h
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/16.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#ifndef ElevenNetworkConfiguration_h
#define ElevenNetworkConfiguration_h

#endif /* ElevenNetworkConfiguration_h */

typedef NS_ENUM(NSUInteger, ELAppEnvironmentOptions){
    KEnumELAppEnvironmentDevelop = 0,
    KEnumELAppEnvironmentTest,
    KEnumELAppEnvironmentProduction,
};
/*! @brief app运行环境*/
static ELAppEnvironmentOptions KAppEnvironment = KEnumELAppEnvironmentDevelop;

static NSString *ELNetworkRequestUrlForDevelop = @"http://api.budejie.com/api/api_open.php";

static NSString *ELNetworkRequestUrlForTest = @"";

static NSString *ELNetworkRequestUrlForProduction = @"";

/* @brief 网络连接超时时间*/
static NSTimeInterval kSFNetworkingTimeoutSeconds = 60.0f;


