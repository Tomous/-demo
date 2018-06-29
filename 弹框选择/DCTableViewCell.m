//
//  DCTableViewCell.m
//  TomousTool
//
//  Created by 大橙子 on 2018/6/29.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "DCTableViewCell.h"
@interface DCTableViewCell()
@property (nonatomic, strong)UIButton *SelectIconBtn;

@end
@implementation DCTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *CellID = @"Cell";
    DCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[DCTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.SelectIconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.SelectIconBtn setImage:[UIImage imageNamed:@"对号-normal"] forState:UIControlStateNormal];
        [self.SelectIconBtn setImage:[UIImage imageNamed:@"对号-selected"] forState:UIControlStateSelected];
        self.SelectIconBtn.userInteractionEnabled = NO;
        [self addSubview:self.SelectIconBtn];
        
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_contentLabel];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.SelectIconBtn.frame = CGRectMake(10, (self.frame.size.height - 13)/2, 13, 13);
    _contentLabel.frame = CGRectMake(CGRectGetMaxX(self.SelectIconBtn.frame), 0, self.frame.size.width - 20 - self.SelectIconBtn.frame.size.width, self.frame.size.height);
}
-(void)UpdateCellWithState:(BOOL)select
{
    self.SelectIconBtn.selected = select;
    _isSelected = select;
    if (_isSelected) {
        self.backgroundColor = [UIColor greenColor];
    }else
    {
        self.backgroundColor = [UIColor whiteColor];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
