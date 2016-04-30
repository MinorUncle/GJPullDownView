//
//  GJPullDownView.h
//  GJPullDownViewDemo
//
//  Created by tongguan on 16/1/9.
//  Copyright © 2016年 tongguan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GJPullDownView;
@protocol GJPullDownViewDelegate <NSObject>
-(NSInteger)GJPullDownView:(GJPullDownView*)pulldownView selectIndex:(NSInteger)index;

@end

@interface GJPullDownView : UIView
@property(nonatomic,retain)NSArray<NSString*>* itemNames;

@property(nonatomic,weak)id<GJPullDownViewDelegate>PullDownViewDelegate;

@property(nonatomic,retain)UIView* accessView;

@property(nonatomic,retain,readonly)UITableView* listView;
@property(nonatomic,assign)NSTextAlignment listAlignment;

@property(nonatomic,retain,readonly)UILabel* sectionLable;
@property(nonatomic,assign)NSInteger showMaxCellCount;

@property(nonatomic,assign)NSInteger currentIndex;

@property(nonatomic,retain)UIFont* listTextFont;

@property(nonatomic,retain)UIFont* listTextColor;


//打开和关闭时调用
@property(nonatomic,copy)void(^changeBlock)(GJPullDownView* pullDownView ,BOOL isToOpen);
//@property(nonatomic,assign)



- (instancetype)initWithItems:(NSArray*)items;
@end
