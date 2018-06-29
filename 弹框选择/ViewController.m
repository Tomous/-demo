//
//  ViewController.m
//  弹框选择
//
//  Created by 大橙子 on 2018/6/29.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "ViewController.h"
#import "DCChooseView.h"
@interface ViewController ()
{
    NSArray *_nameArray;
}
@property (nonatomic,strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _nameArray = [NSArray arrayWithObjects:@"北京",@"上海",@"广州",@"深圳",@"重庆",@"武汉",@"天津",nil];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    label.backgroundColor = [UIColor redColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDidClcik)];
    [label addGestureRecognizer:tap];
    label.userInteractionEnabled = YES;
    self.label = label;
    [self.view addSubview:label];
}
-(void)tapDidClcik
{
    NSLog(@"%s",__func__);

    DCChooseView *chooseView = [[DCChooseView alloc]initWithTitle:@"请选择城市" data:_nameArray withLabel:self.label];
    chooseView.block = ^(NSString *content) {
        NSLog(@"content--%@",content);
        self.label.text = content;
    };
    [self.view addSubview:chooseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
