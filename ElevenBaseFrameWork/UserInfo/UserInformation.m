
//
//  UserInformation.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/20.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation


+ (UserInformation *)shareInstance
{
    static UserInformation *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[UserInformation alloc] init];
    });
    return shareInstance;
}



@end
