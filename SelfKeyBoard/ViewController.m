//
//  ViewController.m
//  SelfKeyBoard
//
//  Created by 连喜 邓 on 2017/7/20.
//  Copyright © 2017年 连喜 邓. All rights reserved.
//

#import "ViewController.h"
#import "PassTextFild.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PassTextFild *searchTextField =[[PassTextFild alloc]initWithFrame:CGRectMake(20,50, 280, 28)];
    searchTextField.borderStyle =UITextBorderStyleRoundedRect;
    searchTextField.placeholder =@"请输入代码或拼音首字母";
    searchTextField.font =[UIFont systemFontOfSize:13];
    searchTextField.contentVerticalAlignment =UIControlContentVerticalAlignmentCenter;
    searchTextField.autocorrectionType =UITextAutocorrectionTypeNo;
    searchTextField.returnKeyType = UIReturnKeyDone;
    searchTextField.keyboardType =UIKeyboardTypeDefault;
    searchTextField.clearButtonMode = UITextFieldViewModeAlways;
    searchTextField.text =@"";
    [self.view addSubview:searchTextField];
    [searchTextField becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
