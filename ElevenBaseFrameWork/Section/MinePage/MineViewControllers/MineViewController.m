//
//  MineViewController.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/17.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 给应用打分
- (void)onMarking:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:APP_DOWNLOAD_URL]];
    NSString *strLocalVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:@"score" forKey:[NSString stringWithFormat:@"score%@", strLocalVersion]];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
