//
//  TabBarModel.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/17.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "TabBarModel.h"

#define TABBAR_PLIST_FILENAME @"TabBar"

@implementation TabBarModel

- (void)setContentWithPlistFile
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:TABBAR_PLIST_FILENAME ofType:@"plist"];
    NSDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    self.color = (NSString *)[dic objectForKey:@"color"];
    self.style = (NSString *)[dic objectForKey:@"style"];
    self.height = [[dic objectForKey:@"height"] integerValue];
    self.selectIndex = [[dic objectForKey:@"selectIndex"] integerValue];
    self.tabBarItems = [dic objectForKey:@"tabBarItems"];
}

@end
