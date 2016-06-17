//
//  TabBarModel.h
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/17.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabBarModel : NSObject

@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *style;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) NSArray *tabBarItems;

- (void)setContentWithPlistFile;

@end
