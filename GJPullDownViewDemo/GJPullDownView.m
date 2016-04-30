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
    CGFloat _cellHeight;
    UIButton* _sectionBtn;
}
@end
@implementation GJPullDownView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _sectionBtn =  [[ UIButton alloc]initWithFrame:self.bounds];
        [_sectionBtn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        _currentIndex = 0;
        _sectionLable = [[UILabel alloc]init];
        _sectionLable.textAlignment = NSTextAlignmentCenter;

        [_sectionBtn addSubview:_sectionLable];
        CGRect rect = _sectionBtn.bounds;
        rect.origin.y = CGRectGetMaxY(frame);
        rect.size.height = 0.0;
        _listView = [[UITableView alloc]initWithFrame:rect];
        _listView.backgroundColor = [UIColor whiteColor];
        _listView.bounces = NO;
        _listView.delegate = self;
        _listView.dataSource =self;
        [self addSubview:_sectionBtn];
        [self.superview addSubview:_listView];
        
        _listTextFont = [UIFont systemFontOfSize:FONT_SIZE];
    }
    return self;
}
- (instancetype)initWithItems:(NSArray*)items
{
    self = [super init];
    if (self) {
        
        self.itemNames = items;
    };
    return self;
}
-(void)setItemNames:(NSArray<NSString *> *)itemsName{
    _itemNames = itemsName;
    _sectionLable.text = _itemNames[0];
    [_listView reloadData];
}
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _sectionBtn.frame = self.bounds;
    _cellHeight = frame.size.height;
    CGRect rect = frame;
    rect.origin.y = CGRectGetMaxY(frame);
    rect.size.height = 0;
    _listView.frame = rect;
    _listView.rowHeight = _cellHeight;
    
    [self updateAccessViewFrame];
}
-(void)setAccessView:(UIView *)accessView{
    _accessView = accessView;
    [_accessView setContentMode:UIViewContentModeScaleAspectFit];
    [_sectionBtn addSubview:accessView];
    [self updateAccessViewFrame];
}
-(void)updateAccessViewFrame{
    if (!self.accessView) {
        _sectionLable.frame = _sectionBtn.bounds;

    }else{
        CGRect rect = _accessView.bounds;
        //    rect.size = CGSizeMake(rect.size.height*0.6, rect.size.height*0.6);
        rect.origin.y = (self.frame.size.height - rect.size.height) * 0.5;
        rect.origin.x = self.frame.size.width - rect.size.width - rect.origin.y;
        _accessView.frame = rect;
        
        rect.origin = CGPointZero;
        rect.size = CGSizeMake(_sectionBtn.bounds.size.width - rect.size.width, _sectionBtn.bounds.size.height);
        _sectionLable.frame = rect;
    }

}
-(void)selectBtn:(UIButton*)btn{
    btn.selected = !btn.selected;
    if(self.changeBlock != nil){
        self.changeBlock(self, btn.selected);
    }
    if (btn.isSelected) {
        [self.superview addSubview:_listView];
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = self.frame;
            if (_showMaxCellCount >0) {
                rect.size.height = (_itemNames.count < _showMaxCellCount? _itemNames.count:_showMaxCellCount) * _cellHeight;
            }else{
                rect.size.height = _itemNames.count * _cellHeight;
            }
            rect.origin.y = CGRectGetMaxY(self.frame);
            _listView.frame = rect;
        }];
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = _listView.frame;
            rect.size.height = 0.0;
            _listView.frame = rect;
        }completion:^(BOOL finished) {
            [_listView removeFromSuperview];
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
        [cell.textLabel setFont:_listTextFont];
        cell.textLabel.textAlignment = self.listAlignment;
    }
    cell.textLabel.text = _itemNames[indexPath.row];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _itemNames.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.PullDownViewDelegate GJPullDownView:self selectIndex:indexPath.row];
    _sectionLable.text =_itemNames[indexPath.row];
    _currentIndex = indexPath.row;
    [self selectBtn:_sectionBtn];
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
