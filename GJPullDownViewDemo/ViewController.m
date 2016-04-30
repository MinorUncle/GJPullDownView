//
//  ViewController.m
//  GJPullDownViewDemo
//
//  Created by tongguan on 16/1/9.
//  Copyright © 2016年 tongguan. All rights reserved.
//

#import "ViewController.h"
#import "GJPullDownView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GJPullDownView* view = [[GJPullDownView alloc]initWithItems:@[@"1",@"2",@"3"]];
    UIImage* image =[UIImage imageNamed:@"1"];
    view.accessView = [[UIImageView alloc]initWithImage:image];
    view.changeBlock = ^(GJPullDownView* pullView, BOOL isOpen){
        if (isOpen) {
            pullView.accessView.transform = CGAffineTransformMakeRotation(M_PI);
        }else{
            pullView.accessView.transform = CGAffineTransformMakeRotation(0);
        }
    };
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(20, 20, 200, 30);
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
