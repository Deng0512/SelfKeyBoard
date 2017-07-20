//
//  PassTextFild.m
//  VisionField
//
//  Created by 邓 连喜 on 14-8-22.
//  Copyright (c) 2014年 邓 连喜. All rights reserved.
//

#import "PassTextFild.h"

#define FIT_X          [UIScreen mainScreen].bounds.size.width/320.000
#define iPhone4        ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

@implementation PassTextFild
@synthesize otherKeyBoardView=_otherKeyBoardView;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadBegin];
    }
    return self;
}

-(void)loadBegin
{
    keyBoardView =[[UIView alloc]initWithFrame:CGRectMake(0, 480-220, 320, 240)];
    if (iPhone4) {
        keyBoardView.frame =CGRectMake(0, 480-220, 320, 240);
    }else{
        keyBoardView.frame =CGRectMake(0, 568*FIT_X-240*FIT_X, 320*FIT_X, 240*FIT_X);
    }
    keyBoardView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgs.png"]];
    
    for (int i=0; i<10; i++)
    {
        UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"anniu1.png"] forState:UIControlStateNormal];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"anniu1_select.png"] forState:UIControlStateHighlighted];
        pressButton.tag =i+1;
        pressButton.frame =[self frameForSettingButtonUnderImage:i];
        [pressButton addTarget:self action:@selector(goPress:) forControlEvents:UIControlEventTouchUpInside];
        [keyBoardView addSubview:pressButton];
        
        UILabel *descripSecLabel =[[UILabel alloc] init];
        descripSecLabel.frame =pressButton.frame;
        descripSecLabel.backgroundColor =[UIColor clearColor];
        descripSecLabel.textAlignment =NSTextAlignmentCenter;
        descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
        descripSecLabel.text =[NSString stringWithFormat:@"%d",i+1];
        if (i==9) {
            descripSecLabel.text =@"0";
        }
        [keyBoardView addSubview:descripSecLabel];
        
    }
    //减
    UIButton *pressButtondelete =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtondelete.frame =CGRectMake(257*FIT_X, 5*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtondelete setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtondelete setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    [pressButtondelete addTarget:self action:@selector(deleteTextField) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtondelete];
    
    UIImageView *backGrodImage =[[UIImageView alloc]initWithFrame:CGRectMake(270*FIT_X, 18*FIT_X, 32*FIT_X, 28*FIT_X)];
    backGrodImage.image =[UIImage imageNamed:@"tu2 (3).png"];
    [keyBoardView addSubview:backGrodImage];
    
    //清空
    UIButton *pressButtonClearAll =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonClearAll.frame =CGRectMake(257*FIT_X, 65*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtonClearAll setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtonClearAll setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    [pressButtonClearAll addTarget:self action:@selector(clearAllTextField) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonClearAll];
    
    UILabel *pressButtonClearAllLabel =[[UILabel alloc] init];
    pressButtonClearAllLabel.frame =pressButtonClearAll.frame;
    pressButtonClearAllLabel.backgroundColor =[UIColor clearColor];
    pressButtonClearAllLabel.textColor =[UIColor whiteColor];
    pressButtonClearAllLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonClearAllLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonClearAllLabel.text =@"清空";
    [keyBoardView addSubview:pressButtonClearAllLabel];
    
    //隐藏
    UIButton *pressButtonReturn =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonReturn.frame =CGRectMake(257*FIT_X, 125*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtonReturn setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtonReturn setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    [pressButtonReturn addTarget:self action:@selector(goReturn) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonReturn];
    
    UILabel *pressButtonReturnLabel =[[UILabel alloc] init];
    pressButtonReturnLabel.frame =pressButtonReturn.frame;
    pressButtonReturnLabel.backgroundColor =[UIColor clearColor];
    pressButtonReturnLabel.textColor =[UIColor whiteColor];
    pressButtonReturnLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonReturnLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonReturnLabel.text =@"隐藏";
    [keyBoardView addSubview:pressButtonReturnLabel];
    
    //搜索
    UIButton *pressButtonSearch =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonSearch.frame =CGRectMake(257*FIT_X, 185*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtonSearch setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtonSearch setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    [pressButtonSearch addTarget:self action:@selector(searchAllTextField) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonSearch];
    
    UILabel *pressButtonSearchLabel =[[UILabel alloc] init];
    pressButtonSearchLabel.frame =pressButtonSearch.frame;
    pressButtonSearchLabel.backgroundColor =[UIColor clearColor];
    pressButtonSearchLabel.textColor =[UIColor whiteColor];
    pressButtonSearchLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonSearchLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonSearchLabel.text =@"搜索";
    [keyBoardView addSubview:pressButtonSearchLabel];
    
    //002
    UIButton *pressButtonZeroTwo =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonZeroTwo.frame =CGRectMake(194*FIT_X, 185*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtonZeroTwo setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtonZeroTwo setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    pressButtonZeroTwo.tag =24;
    [pressButtonZeroTwo addTarget:self action:@selector(goPressOtherButtons:) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonZeroTwo];
    
    UILabel *pressButtonZeroTwoLabel =[[UILabel alloc] init];
    pressButtonZeroTwoLabel.frame =pressButtonZeroTwo.frame;
    pressButtonZeroTwoLabel.backgroundColor =[UIColor clearColor];
    pressButtonZeroTwoLabel.textColor =[UIColor whiteColor];
    pressButtonZeroTwoLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonZeroTwoLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonZeroTwoLabel.text =@"002";
    [keyBoardView addSubview:pressButtonZeroTwoLabel];
    
    //300
    UIButton *pressButtonThreeZero =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonThreeZero.frame =CGRectMake(68*FIT_X, 185*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtonThreeZero setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtonThreeZero setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    pressButtonThreeZero.tag =23;
    [pressButtonThreeZero addTarget:self action:@selector(goPressOtherButtons:) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonThreeZero];
    
    UILabel *pressButtonThreeZeroLabel =[[UILabel alloc] init];
    pressButtonThreeZeroLabel.frame =pressButtonThreeZero.frame;
    pressButtonThreeZeroLabel.backgroundColor =[UIColor clearColor];
    pressButtonThreeZeroLabel.textColor =[UIColor whiteColor];
    pressButtonThreeZeroLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonThreeZeroLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonThreeZeroLabel.text =@"300";
    [keyBoardView addSubview:pressButtonThreeZeroLabel];
    
    //ABC
    UIButton *pressButtonABC =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonABC.frame =CGRectMake(5*FIT_X, 185*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtonABC setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtonABC setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    [pressButtonABC addTarget:self action:@selector(changeAbcKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonABC];
    
    UILabel *pressButtonABCLabel =[[UILabel alloc] init];
    pressButtonABCLabel.frame =pressButtonABC.frame;
    pressButtonABCLabel.backgroundColor =[UIColor clearColor];
    pressButtonABCLabel.textColor =[UIColor whiteColor];
    pressButtonABCLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonABCLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonABCLabel.text =@"ABC";
    [keyBoardView addSubview:pressButtonABCLabel];
    
    //600
    UIButton *pressButtonSixZero=[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonSixZero.frame =CGRectMake(5*FIT_X, 5*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtonSixZero setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtonSixZero setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    pressButtonSixZero.tag =20;
    [pressButtonSixZero addTarget:self action:@selector(goPressOtherButtons:) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonSixZero];
    
    UILabel *pressButtonSixZeroLabel =[[UILabel alloc] init];
    pressButtonSixZeroLabel.frame =pressButtonSixZero.frame;
    pressButtonSixZeroLabel.backgroundColor =[UIColor clearColor];
    pressButtonSixZeroLabel.textColor =[UIColor whiteColor];
    pressButtonSixZeroLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonSixZeroLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonSixZeroLabel.text =@"600";
    [keyBoardView addSubview:pressButtonSixZeroLabel];
    
    //601
    UIButton *pressButtonSixOne =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonSixOne.frame =CGRectMake(5*FIT_X, 65*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtonSixOne setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtonSixOne setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    pressButtonSixOne.tag =21;
    [pressButtonSixOne addTarget:self action:@selector(goPressOtherButtons:) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonSixOne];
    
    UILabel *pressButtonSixOneLabel =[[UILabel alloc] init];
    pressButtonSixOneLabel.frame =pressButtonSixOne.frame;
    pressButtonSixOneLabel.backgroundColor =[UIColor clearColor];
    pressButtonSixOneLabel.textColor =[UIColor whiteColor];
    pressButtonSixOneLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonSixOneLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonSixOneLabel.text =@"601";
    [keyBoardView addSubview:pressButtonSixOneLabel];
    
    //000
    UIButton *pressButtonZeroZero =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonZeroZero.frame =CGRectMake(5*FIT_X, 125*FIT_X, 58*FIT_X, 55*FIT_X);
    [pressButtonZeroZero setBackgroundImage:[UIImage imageNamed:@"anniu2.png"] forState:UIControlStateNormal];
    [pressButtonZeroZero setBackgroundImage:[UIImage imageNamed:@"anniu2_select.png"] forState:UIControlStateHighlighted];
    pressButtonZeroZero.tag =22;
    [pressButtonZeroZero addTarget:self action:@selector(goPressOtherButtons:) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonZeroZero];
    
    UILabel *pressButtonZeroZeroLabel =[[UILabel alloc] init];
    pressButtonZeroZeroLabel.frame =pressButtonZeroZero.frame;
    pressButtonZeroZeroLabel.backgroundColor =[UIColor clearColor];
    pressButtonZeroZeroLabel.textColor =[UIColor whiteColor];
    pressButtonZeroZeroLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonZeroZeroLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonZeroZeroLabel.text =@"000";
    [keyBoardView addSubview:pressButtonZeroZeroLabel];
    
    self.inputView =keyBoardView;
}

-(void)goPress:(UIButton *)btn
{
    NSInteger number = btn.tag;
    if (number==10) {
        number =0;
    }
    
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@%ld", self.text, number];
    self.text = mutableString;
    
    [self searchAllTextField];
}

-(void)goPressOtherButtons:(UIButton *)btn
{
    
    NSString *addString=@"";
    if (btn.tag==20) {
        addString =@"600";
    }
    else if (btn.tag==21)
    {
        addString =@"601";
    }
    else if (btn.tag==22)
    {
        addString =@"000";
    }
    else if (btn.tag==23)
    {
        addString =@"300";
    }
    else if (btn.tag==24)
    {
        addString =@"002";
    }
    
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@%@", self.text, addString];
    self.text = mutableString;
    
    [self searchAllTextField];
}


//删除一位
-(void)deleteTextField
{
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@", self.text];
    if ([mutableString length] > 0) {
        NSRange tmpRange;
        tmpRange.location = [mutableString length] - 1;
        tmpRange.length = 1;
        [mutableString deleteCharactersInRange:tmpRange];
    }
    self.text = mutableString;
    
    [self searchAllTextField];
}

//清除
-(void)clearAllTextField
{
    self.text =@"";
}

//搜索
-(void)searchAllTextField
{
    if ([self.text length]>0)
    {
        if (self.delegate) {
            [self.delegate passTextFieldSearch:self.text];
        }
    }
    else
    {
        [self resignFirstResponder];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请先输入需要搜索的内容"
                                                       message:@""
                                                      delegate:nil
                                             cancelButtonTitle:@"知道了"
                                             otherButtonTitles:nil];
        [alert show];
        [self performSelector:@selector(removeAlertView:) withObject:alert afterDelay:1.5f];
    }
}

//alertView 自动消失；
- (void)removeAlertView:(UIAlertView *)alertView
{
    [alertView dismissWithClickedButtonIndex:[alertView cancelButtonIndex] animated:YES];
    [alertView removeFromSuperview];
}

//隐藏
-(void)goReturn
{
    [self resignFirstResponder];
}

-(CGRect)frameForSettingButtonUnderImage:(NSInteger)index
{
    CGFloat x;
    CGFloat y;
    int indexHeight;
    int height;
    indexHeight =60*FIT_X;
    height =5*FIT_X;
    
    if(index%3==0)
    {
        x =68*FIT_X;
        y =height +index/3 *indexHeight;
    }
    else if (index%3==1)
    {
        x =131*FIT_X;
        y =height +index/3 *indexHeight;
    }
    else
    {
        x =194*FIT_X;
        y =height +index/3*indexHeight;
    }
    
    if (index==9)
    {
        return CGRectMake(131*FIT_X, 185*FIT_X, 58*FIT_X, 55*FIT_X);
    }
    return CGRectMake(x,y,58*FIT_X,55*FIT_X);
}

//切换到abc键盘
-(void)changeAbcKeyBoard
{
    if (!self.otherKeyBoardView) {
        self.otherKeyBoardView =[[UIView alloc]initWithFrame:CGRectMake(0, 568-240, 320, 220)];
        if (iPhone4) {
            self.otherKeyBoardView.frame =CGRectMake(0, 480-220, 320, 220);
        }else{
            self.otherKeyBoardView.frame =CGRectMake(0, 568*FIT_X-240*FIT_X, 320*FIT_X, 220*FIT_X);
        }
        self.otherKeyBoardView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgs.png"]];
        
        //第一排
        for (int i=0; i<10; i++)
        {
            UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
            pressButton.tag =i+100;
            pressButton.frame =CGRectMake(1+i*32*FIT_X, 5*FIT_X, 34*FIT_X, 48*FIT_X);
            [pressButton addTarget:self action:@selector(goPressSecondKeyButtons:) forControlEvents:UIControlEventTouchUpInside];
            [self.otherKeyBoardView addSubview:pressButton];
            
            UILabel *descripSecLabel =[[UILabel alloc] init];
            descripSecLabel.frame =pressButton.frame;
            descripSecLabel.backgroundColor =[UIColor clearColor];
            descripSecLabel.textAlignment =NSTextAlignmentCenter;
            descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
            switch (i)
            {
                case 0:
                    descripSecLabel.text =@"Q";
                    break;
                case 1:
                    descripSecLabel.text =@"W";
                    break;
                case 2:
                    descripSecLabel.text =@"E";
                    break;
                case 3:
                    descripSecLabel.text =@"R";
                    break;
                case 4:
                    descripSecLabel.text =@"T";
                    break;
                case 5:
                    descripSecLabel.text =@"Y";
                    break;
                case 6:
                    descripSecLabel.text =@"U";
                    break;
                case 7:
                    descripSecLabel.text =@"I";
                    break;
                case 8:
                    descripSecLabel.text =@"O";
                    break;
                case 9:
                    descripSecLabel.text =@"P";
                    break;
                default:
                    break;
            }
            [self.otherKeyBoardView addSubview:descripSecLabel];
            
        }
        
        //第二排
        for (int i=0; i<9; i++)
        {
            UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
            pressButton.tag =i+110;
            pressButton.frame =CGRectMake(16*FIT_X+i*32*FIT_X, 59*FIT_X, 34*FIT_X, 48*FIT_X);
            [pressButton addTarget:self action:@selector(goPressSecondKeyButtons:) forControlEvents:UIControlEventTouchUpInside];
            [self.otherKeyBoardView addSubview:pressButton];
            
            UILabel *descripSecLabel =[[UILabel alloc] init];
            descripSecLabel.frame =pressButton.frame;
            descripSecLabel.backgroundColor =[UIColor clearColor];
            descripSecLabel.textAlignment =NSTextAlignmentCenter;
            descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
            switch (i)
            {
                case 0:
                    descripSecLabel.text =@"A";
                    break;
                case 1:
                    descripSecLabel.text =@"S";
                    break;
                case 2:
                    descripSecLabel.text =@"D";
                    break;
                case 3:
                    descripSecLabel.text =@"F";
                    break;
                case 4:
                    descripSecLabel.text =@"G";
                    break;
                case 5:
                    descripSecLabel.text =@"H";
                    break;
                case 6:
                    descripSecLabel.text =@"J";
                    break;
                case 7:
                    descripSecLabel.text =@"K";
                    break;
                case 8:
                    descripSecLabel.text =@"L";
                    break;
                default:
                    break;
            }
            [self.otherKeyBoardView addSubview:descripSecLabel];
            
        }
        
        //第三排
        for (int i=0; i<7; i++)
        {
            UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
            pressButton.tag =i+120;
            pressButton.frame =CGRectMake(46*FIT_X+i*32*FIT_X, 113*FIT_X, 34*FIT_X, 48*FIT_X);
            [pressButton addTarget:self action:@selector(goPressSecondKeyButtons:) forControlEvents:UIControlEventTouchUpInside];
            [self.otherKeyBoardView addSubview:pressButton];
            
            UILabel *descripSecLabel =[[UILabel alloc] init];
            descripSecLabel.frame =pressButton.frame;
            descripSecLabel.backgroundColor =[UIColor clearColor];
            descripSecLabel.textAlignment =NSTextAlignmentCenter;
            descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
            switch (i)
            {
                case 0:
                    descripSecLabel.text =@"Z";
                    break;
                case 1:
                    descripSecLabel.text =@"X";
                    break;
                case 2:
                    descripSecLabel.text =@"C";
                    break;
                case 3:
                    descripSecLabel.text =@"V";
                    break;
                case 4:
                    descripSecLabel.text =@"B";
                    break;
                case 5:
                    descripSecLabel.text =@"N";
                    break;
                case 6:
                    descripSecLabel.text =@"M";
                    break;
                default:
                    break;
            }
            [self.otherKeyBoardView addSubview:descripSecLabel];
        }
        
        //减
        UIButton *pressButtondelete =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtondelete.frame =CGRectMake(272*FIT_X, 113*FIT_X, 43*FIT_X, 49*FIT_X);
        [pressButtondelete setBackgroundImage:[UIImage imageNamed:@"tu2 2.png"] forState:UIControlStateNormal];
        [pressButtondelete setBackgroundImage:[UIImage imageNamed:@"tu2 (2).png"] forState:UIControlStateHighlighted];
        [pressButtondelete addTarget:self action:@selector(deleteTextField) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtondelete];
        
        UIImageView *backGrodImage =[[UIImageView alloc]initWithFrame:CGRectMake(277*FIT_X, 123*FIT_X, 32*FIT_X, 28*FIT_X)];
        backGrodImage.image =[UIImage imageNamed:@"tu2 (3).png"];
        [self.otherKeyBoardView addSubview:backGrodImage];
        
        //大写
        pressButtonCapital =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtonCapital.frame =CGRectMake(1, 113*FIT_X, 43*FIT_X, 49*FIT_X);
        [pressButtonCapital setBackgroundImage:[UIImage imageNamed:@"tu2 2.png"] forState:UIControlStateNormal];
        [pressButtonCapital setBackgroundImage:[UIImage imageNamed:@"tu2 (2).png"] forState:UIControlStateHighlighted];
        [pressButtonCapital setBackgroundImage:[UIImage imageNamed:@"tu2 (2).png"] forState:UIControlStateSelected];
        [pressButtonCapital addTarget:self action:@selector(pressCapitalAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtonCapital];
        
        bacDaXieImage =[[UIImageView alloc]initWithFrame:CGRectMake(7*FIT_X, 123*FIT_X, 31*FIT_X, 27*FIT_X)];
        bacDaXieImage.image =[UIImage imageNamed:@"da_.png"];
        [self.otherKeyBoardView addSubview:bacDaXieImage];
        
        //123
        UIButton *pressButtonReturn =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtonReturn.frame =CGRectMake(0, 167*FIT_X, 80*FIT_X, 49*FIT_X);
        [pressButtonReturn setBackgroundImage:[UIImage imageNamed:@"tu3-4"] forState:UIControlStateNormal];
        [pressButtonReturn setBackgroundImage:[UIImage imageNamed:@"tu3-04 (2).png"] forState:UIControlStateHighlighted];
        [pressButtonReturn addTarget:self action:@selector(changeNumberKeyBoard) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtonReturn];
        
        UILabel *pressButtonReturnLabel =[[UILabel alloc] init];
        pressButtonReturnLabel.frame =pressButtonReturn.frame;
        pressButtonReturnLabel.backgroundColor =[UIColor clearColor];
        pressButtonReturnLabel.textColor =[UIColor whiteColor];
        pressButtonReturnLabel.textAlignment =NSTextAlignmentCenter;
        pressButtonReturnLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
        pressButtonReturnLabel.text =@"1 2 3";
        [self.otherKeyBoardView addSubview:pressButtonReturnLabel];
        
        //空格
        UIButton *pressButtonZeroTwo =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtonZeroTwo.frame =CGRectMake(80*FIT_X, 167*FIT_X, 160*FIT_X, 49*FIT_X);
        [pressButtonZeroTwo setBackgroundImage:[UIImage imageNamed:@"tu4 (2).png"] forState:UIControlStateNormal];
        [pressButtonZeroTwo setBackgroundImage:[UIImage imageNamed:@"tu4 2.png"] forState:UIControlStateHighlighted];
        pressButtonZeroTwo.tag =24;
        [pressButtonZeroTwo addTarget:self action:@selector(addNullAction) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtonZeroTwo];
        
        UILabel *pressButtonZeroTwoLabel =[[UILabel alloc] init];
        pressButtonZeroTwoLabel.frame =pressButtonZeroTwo.frame;
        pressButtonZeroTwoLabel.backgroundColor =[UIColor clearColor];
        pressButtonZeroTwoLabel.textAlignment =NSTextAlignmentCenter;
        pressButtonZeroTwoLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
        pressButtonZeroTwoLabel.text =@"空格";
        [self.otherKeyBoardView addSubview:pressButtonZeroTwoLabel];
        
        //搜索
        UIButton *pressButtonSearch =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtonSearch.frame =CGRectMake(240*FIT_X, 167*FIT_X, 80*FIT_X, 49*FIT_X);
        [pressButtonSearch setBackgroundImage:[UIImage imageNamed:@"tu3-4"] forState:UIControlStateNormal];
        [pressButtonSearch setBackgroundImage:[UIImage imageNamed:@"tu3-04 (2).png"] forState:UIControlStateHighlighted];
        [pressButtonSearch addTarget:self action:@selector(searchAllTextField) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtonSearch];
        
        UILabel *pressButtonSearchLabel =[[UILabel alloc] init];
        pressButtonSearchLabel.frame =pressButtonSearch.frame;
        pressButtonSearchLabel.backgroundColor =[UIColor clearColor];
        pressButtonSearchLabel.textColor =[UIColor whiteColor];
        pressButtonSearchLabel.textAlignment =NSTextAlignmentCenter;
        pressButtonSearchLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
        pressButtonSearchLabel.text =@"搜索";
        [self.otherKeyBoardView addSubview:pressButtonSearchLabel];
    }
    self.inputView =self.otherKeyBoardView;
    [self reloadInputViews];
}

-(void)goPressSecondKeyButtons:(UIButton *)btn
{
    
    NSString *addString=@"";
    switch (btn.tag)
    {
        case 100:
            addString =@"q";
            break;
        case 101:
            addString =@"w";
            break;
        case 102:
            addString =@"e";
            break;
        case 103:
            addString =@"r";
            break;
        case 104:
            addString =@"t";
            break;
        case 105:
            addString =@"y";
            break;
        case 106:
            addString =@"u";
            break;
        case 107:
            addString =@"i";
            break;
        case 108:
            addString =@"o";
            break;
        case 109:
            addString =@"p";
            break;
        case 110:
            addString =@"a";
            break;
        case 111:
            addString =@"s";
            break;
        case 112:
            addString =@"d";
            break;
        case 113:
            addString =@"f";
            break;
        case 114:
            addString =@"g";
            break;
        case 115:
            addString =@"h";
            break;
        case 116:
            addString =@"j";
            break;
        case 117:
            addString =@"k";
            break;
        case 118:
            addString =@"l";
            break;
        case 120:
            addString =@"z";
            break;
        case 121:
            addString =@"x";
            break;
        case 122:
            addString =@"c";
            break;
        case 123:
            addString =@"v";
            break;
        case 124:
            addString =@"b";
            break;
        case 125:
            addString =@"n";
            break;
        case 126:
            addString =@"m";
            break;
        default:
            break;
    }
    
    if (pressButtonCapital.selected)
    {
        addString =[addString uppercaseString];
    }
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@%@", self.text, addString];
    self.text = mutableString;
    [self searchAllTextField];
}

//切换到123键盘
-(void)changeNumberKeyBoard
{
    self.inputView =keyBoardView;
    [self reloadInputViews];
}

//空格
-(void)addNullAction
{
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@ ", self.text];
    self.text = mutableString;
    
    [self searchAllTextField];
}

//大小写切换
-(void)pressCapitalAction:(UIButton *)button
{
    if (button.selected)
    {
        button.selected =NO;
        bacDaXieImage.image =[UIImage imageNamed:@"da_.png"];
    }
    else
    {
        button.selected =YES;
        bacDaXieImage.image =[UIImage imageNamed:@"da.png"];
    }
}
@end
