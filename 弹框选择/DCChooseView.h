//
//  DCChooseView.h
//  弹框选择
//
//  Created by 大橙子 on 2018/6/29.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^chooseBlock)(NSString *content);
@interface DCChooseView : UIView

@property (nonatomic,copy) chooseBlock block;
-(instancetype)initWithTitle:(NSString *)title data:(NSArray *)data withLabel:(UILabel *)label;
@end
