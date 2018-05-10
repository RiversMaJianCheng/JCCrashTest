//
//  ViewController.m
//  JCCrashDemo
//
//  Created by 建承 马  on 2018/5/2.
//  Copyright © 2018年 建承 马 . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
typedef struct JCTest
{
    int a;
    int b;
}JCTest;

@implementation ViewController
- (IBAction)sigCrash:(UIButton *)sender {
    
        JCTest *jTest = {1,2};
        free(jTest);
}
- (IBAction)ocCrash:(UIButton *)sender {
        NSArray *array = @[@"xiaomage",@"damage"];
        NSString *string = array[2];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.信号量

}


@end
