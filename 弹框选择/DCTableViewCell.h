//
//  DCTableViewCell.h
//  TomousTool
//
//  Created by 大橙子 on 2018/6/29.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,assign)BOOL isSelected;
-(void)UpdateCellWithState:(BOOL)select;
@end
