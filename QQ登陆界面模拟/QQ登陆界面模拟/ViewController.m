//
//  ViewController.m
//  QQ登陆界面模拟
//
//  Created by 郑春喜 on 15/5/24.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(UILabel *) addlabel:(NSString *) labelText:(int) ordinate{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setNumberOfLines:0];
    label.frame = CGRectMake(20, ordinate, 120, 160);
    label.textColor = [UIColor blueColor];
    label.font = [UIFont fontWithName:@"Arial" size:18];
    label.text = labelText;
    return label;
}

-(void) qqtext{
//    UITextAlignment = [[UITextAlignment alloc] init;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *qq = [self addlabel:@"Q Q : ":20];
    UILabel *passwd = [self addlabel:@"密码 : ":50];
    
    [self.view addSubview:passwd];
    [self.view addSubview:qq];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
