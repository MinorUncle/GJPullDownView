//
//  ViewController.m
//  GJPullDownViewDemo
//
//  Created by tongguan on 16/1/9.
//  Copyright © 2016年 tongguan. All rights reserved.
//

#import "ViewController.h"
#import "GJPullDownView.h"
@interface ViewController ()<GJPullDownViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GJPullDownView* view = [[GJPullDownView alloc]initWithItems:@[@"1",@"2",@"3"]];
    view.accessViewType = AccessViewTypeArrow;
    view.PullDownViewDelegate = self;
    view.listView.backgroundColor = [UIColor yellowColor];
    view.listViewShowType = ListViewShowModel;
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(140, 150, 200, 30);
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)GJPullDownView:(GJPullDownView *)pulldownView didChangeStatus:(BOOL)isToOpen{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
