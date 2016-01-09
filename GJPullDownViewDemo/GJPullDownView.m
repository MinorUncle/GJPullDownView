//
//  GJPullDownView.m
//  GJPullDownViewDemo
//
//  Created by tongguan on 16/1/9.
//  Copyright © 2016年 tongguan. All rights reserved.
//

#import "GJPullDownView.h"

#define FONT_SIZE 12
@interface GJPullDownView ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton* sectionBtn;
    CGFloat _cellHeight;
}
@end
@implementation GJPullDownView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        sectionBtn =  [[ UIButton alloc]init];
        [sectionBtn setBackgroundColor:[UIColor greenColor]];
        [sectionBtn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        [sectionBtn setTitle:_itemsName[0] forState:UIControlStateNormal];
        self.bounces = NO;
        self.delegate = self;
        self.dataSource =self;
    }
    return self;
}
- (instancetype)initWithItems:(NSArray*)items
{
    self = [super init];
    if (self) {
       
        self.itemsName = items;
    };
    return self;
}
-(void)setItemsName:(NSArray<NSString *> *)itemsName{
    _itemsName = itemsName;
    [sectionBtn setTitle:_itemsName[0] forState:UIControlStateNormal];
    [self reloadData];
}
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _cellHeight = frame.size.height;
    [self initAccessViewFrame];
    
}
-(void)setAccessView:(UIView *)accessView{
    _accessView = accessView;
    [_accessView setContentMode:UIViewContentModeCenter];
    [sectionBtn addSubview:accessView];
    [self initAccessViewFrame];
}
-(void)initAccessViewFrame{
    CGRect rect = _accessView.bounds;
    rect.origin.y = (self.frame.size.height - rect.size.height) * 0.5;
    rect.origin.x = self.frame.size.width - rect.size.width - rect.origin.y;

    _accessView.frame = rect;
}
-(void)selectBtn:(UIButton*)btn{
    btn.selected = !btn.selected;
    if (btn.isSelected) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = self.frame;
            rect.size.height = (_itemsName.count + 1) * _cellHeight;
            [super setFrame:rect];
            self.accessView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = self.frame;
            rect.size.height = _cellHeight;
            [super setFrame:rect];
            self.accessView.transform = CGAffineTransformMakeRotation(0);
        }];
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"GJPullDownViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GJPullDownViewCell"];
        [cell.textLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
        cell.backgroundColor = [UIColor yellowColor];
    }
    cell.textLabel.text = _itemsName[indexPath.row];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _itemsName.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return sectionBtn;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.PullDownViewDelegate GJPullDownView:self selectIndex:indexPath.row];
    [sectionBtn setTitle:_itemsName[indexPath.row] forState:UIControlStateNormal];
    [self selectBtn:sectionBtn];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return _cellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellHeight;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
