//
//  ViewController.m
//  ElevenBaseFrameWork
//
//  Created by Eleven on 16/6/15.
//  Copyright © 2016年 Eleven. All rights reserved.
//

#import "ViewController.h"
#import "ElevenAPIProxy.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[ElevenAPIProxy shareInstance] postRequestWithUrl:@"a=tag_recommend&c=topic&action=sub" paramsDic:nil successBlock:^(NSDictionary *response, ELURLResponseStatus status) {
        NSLog(@"ress %@", response);
    } failureBlock:^(__autoreleasing id *response, ELURLResponseStatus status) {
        
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
