//
//  HomePagesViewController.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/17.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "HomePagesViewController.h"
#import "ElevenAPIProxy.h"
@interface HomePagesViewController ()

@end

@implementation HomePagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [[ElevenAPIProxy shareInstance] postRequestWithUrl:@"a=tag_recommend&c=topic&action=sub" paramsDic:nil successBlock:^(NSDictionary *response, ELURLResponseStatus status) {
        NSLog(@"ress %@", response);
    } failureBlock:^(__autoreleasing id *response, ELURLResponseStatus status) {
        
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
