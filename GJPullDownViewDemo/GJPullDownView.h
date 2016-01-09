//
//  GJPullDownView.h
//  GJPullDownViewDemo
//
//  Created by tongguan on 16/1/9.
//  Copyright © 2016年 tongguan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GJPullDownView;
@protocol GJPullDownViewDelegate
-(NSInteger)GJPullDownView:(GJPullDownView*)pulldownView selectIndex:(NSInteger)index;
@end

@interface GJPullDownView : UITableView
@property(nonatomic)NSArray<NSString*>* itemsName;
@property(nonatomic,weak)id<GJPullDownViewDelegate>PullDownViewDelegate;
@property(nonatomic)UIView* accessView;

- (instancetype)initWithItems:(NSArray*)items;
@end
