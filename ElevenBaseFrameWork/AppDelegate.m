//
//  AppDelegate.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/15.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "AppDelegate.h"
#import "TabbarViewController.h"
#import "XHLaunchAd.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setKeyWindow];

    return YES;
}

- (void)setKeyWindow{
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSString *isFirstOpenStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"isFirstOpenApp"];
    if ([isFirstOpenStr isEqualToString:@"1"]) {
        TabbarViewController *tabVC = [[TabbarViewController alloc] init];
        UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:tabVC];
        self.window.rootViewController = naVC;
    }else{
        self.window.rootViewController = nil;
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"isFirstOpenApp"];
    }
    // 初始化启动页广告
   XHLaunchAd *launchAd = [[XHLaunchAd alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT - 150) andDuration:5];
    // 设置启动页广告图片的url
    NSString *imgUrlString = @"http://img.taopic.com/uploads/allimg/120906/219077-120Z616330677.jpg";
    [launchAd imgUrlString:imgUrlString completed:^(UIImage *image, NSURL *url) {
        
    }];
    launchAd.hideSkip = NO;
    // 广告页点击时间
    launchAd.clickBlock = ^(){
        NSString *url = @"https://www.baidu.com";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    };
    [self.window.rootViewController.view addSubview:launchAd];
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
