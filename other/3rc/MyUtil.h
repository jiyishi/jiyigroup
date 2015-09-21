//
//  MyUtil.h
//  TestMutlMedia
//
//  Created by qianfeng on 15/6/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyUtil : NSObject

+(UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action;

+(UIButton *)createBtnFrame:(CGRect)frame image:(NSString *)image selectImage:(NSString *)selectImageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;

+(UITextField *)createTextField:(CGRect)frame placeHolder:(NSString *)placeHolder;

+(UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font;

+ (UIButton *)createButtonWithTitle:(NSString *)title backImgName:(NSString *)imgName frame:(CGRect)frame titleColor:(UIColor *)color;

+(NSString *)getTimeStringWithInteger:(NSInteger)timeNum;

+(NSAttributedString *)getFormatStringWithSupString:(NSString *)supString;

@end
