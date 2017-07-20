//
//  PassTextFild.h
//  VisionField
//
//  Created by 邓 连喜 on 14-8-22.
//  Copyright (c) 2014年 邓 连喜. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PassTextFieldViewDelegate <NSObject>
-(void)passTextFieldSearch:(NSString *)searchString;
@end

@interface PassTextFild : UITextField
{
    UIView *keyBoardView;
    UIButton *pressButtonCapital;
    UIImageView *bacDaXieImage;
}
@property(nonatomic,strong)UIView *otherKeyBoardView;
@property(nonatomic,weak)id<PassTextFieldViewDelegate>delegate;
@end
