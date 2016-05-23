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
@optional
-(NSInteger)GJPullDownView:(GJPullDownView*)pulldownView selectIndex:(NSInteger)index;
-(BOOL)GJPullDownView:(GJPullDownView*)pulldownView shouldWillChangeStatus:(BOOL)isToOpen;
-(void)GJPullDownView:(GJPullDownView*)pulldownView didChangeStatus:(BOOL)isToOpen;

@end

@interface GJPullDownView : UIView
@property(nonatomic,retain)NSArray<NSString*>* itemNames;
@property(nonatomic,strong,setter=setItemTags:)NSArray<NSNumber*>* itemTags;

@property(nonatomic,weak)id<GJPullDownViewDelegate>PullDownViewDelegate;

@property(nonatomic,retain)UIView* accessView;

@property(nonatomic,retain,readonly)UITableView* listView;
@property(nonatomic,assign)NSTextAlignment listAlignment;

@property(nonatomic,retain,readonly)UILabel* sectionLable;
@property(nonatomic,assign)NSInteger showMaxCellCount;

@property(nonatomic,assign)NSInteger currentTag;

@property(nonatomic,retain)UIFont* listTextFont;

@property(nonatomic,retain)UIFont* listTextColor;


@property(nonatomic,assign,setter=open:)BOOL isOpen;



- (instancetype)initWithItems:(NSArray*)items;
@end
