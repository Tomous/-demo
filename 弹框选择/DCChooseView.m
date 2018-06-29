//
//  DCChooseView.m
//  弹框选择
//
//  Created by 大橙子 on 2018/6/29.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "DCChooseView.h"
#import "DCTableViewCell.h"
#define cellHeight 30
@interface DCChooseView()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *backgroundView;
    NSIndexPath * currentSelectIndex;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSArray *data;
@property (nonatomic,strong) UILabel *label;
@end
@implementation DCChooseView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}
-(instancetype)initWithTitle:(NSString *)title data:(NSArray *)data withLabel:(UILabel *)label
{
    if (self = [super init]) {
        self.title = title;
        self.data = data;
        self.label = label;
    
        backgroundView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        backgroundView.backgroundColor = [UIColor lightGrayColor];
        backgroundView.alpha = 0.3;
        UITapGestureRecognizer *tapBackgroundView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBackgroundView)];
        [backgroundView addGestureRecognizer:tapBackgroundView];
        backgroundView.userInteractionEnabled = YES;
        [[UIApplication sharedApplication].keyWindow addSubview:backgroundView];
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(self.label.frame.origin.x, CGRectGetMaxY(self.label.frame), self.label.frame.size.width, self.data.count *cellHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        [[UIApplication sharedApplication].keyWindow addSubview:self.tableView];
    }
    return self;
}

-(void)tapBackgroundView
{
    [backgroundView removeFromSuperview];
    [self.tableView removeFromSuperview];
}

#pragma ------  UITableView  ------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.title;
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return cellHeight + 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCTableViewCell *cell = [DCTableViewCell cellWithTableView:tableView];
    cell.contentLabel.text = self.data[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (currentSelectIndex != nil && currentSelectIndex != indexPath) {
        DCTableViewCell *cell = [tableView cellForRowAtIndexPath:currentSelectIndex];
        [cell UpdateCellWithState:NO];
    }
    DCTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell UpdateCellWithState:!cell.isSelected];
    currentSelectIndex = indexPath;
    if (cell.isSelected) {
        if (_block) {
            _block(cell.contentLabel.text);
        }
    }else
    {
        if (_block) {
            _block(@"");
        }
    }
}
@end
