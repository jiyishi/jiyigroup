//
//  MyUtil.m
//  TestMutlMedia
//
//  Created by qianfeng on 15/6/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MyUtil.h"

@implementation MyUtil

+(UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+(UITextField *)createTextField:(CGRect)frame placeHolder:(NSString *)placeHolder
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = placeHolder;
    return textField;
}

+(UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (title) {
        label.text = title;
    }
    if (font) {
        label.font = font;
    }
    return label;
    
}

+ (UIButton *)createButtonWithTitle:(NSString *)title backImgName:(NSString *)imgName frame:(CGRect)frame titleColor:(UIColor *)color
{
    // 创建左边按钮
    UIButton *leftBtn = [ UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitleColor:color forState:UIControlStateNormal];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    leftBtn.frame = frame;
    
    return leftBtn;
}

+(UIButton *)createBtnFrame:(CGRect)frame image:(NSString *)image selectImage:(NSString *)selectImageName highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    if (image) {
        [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (selectImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    }
    if (highlightImage) {
        [btn setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    }
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}


+(NSString *)getTimeStringWithInteger:(NSInteger)timeNum
{
    //时间
    NSString*time = [NSString stringWithFormat:@"%ld",timeNum];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)[time intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

+(NSAttributedString *)getFormatStringWithSupString:(NSString *)supString
{
    //dwfe<font color="red">R</font>fewf
    NSString *subString1 = @"<font color=\"red\">";
    NSString *subString2 = @"</font>";
    
    MyUtil *myUtil = [[MyUtil alloc]init];
    NSArray *subStrArr1 = [myUtil subStringCount:supString findStr:subString1];
    NSArray *subStrArr2 = [myUtil subStringCount:supString findStr:subString2];
    NSMutableAttributedString *supStr = [[NSMutableAttributedString alloc]initWithString:supString];
    for (NSInteger i = subStrArr1.count-1; i>=0; i -= 2) {
        NSRange subRange1 = NSMakeRange([subStrArr1[i-1]integerValue], [subStrArr1[i]integerValue]);
        NSRange subRange2 = NSMakeRange([subStrArr2[i-1]integerValue], [subStrArr2[i]integerValue]);
        
        NSUInteger getSubStrleng = subRange2.location-subRange1.location-subRange1.length;
        
        [supStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(subRange1.location+subRange1.length, getSubStrleng)];
        [supStr replaceCharactersInRange:subRange2 withString:@""];
        [supStr replaceCharactersInRange:subRange1 withString:@""];
    }
    
    return supStr;
}

-(NSArray *)subStringCount:(NSString*)srcStr findStr:(NSString*)findStr
{
    NSString *dstStr = srcStr;
    NSInteger lastLength = 0;
    NSMutableArray *rangeArr = [NSMutableArray arrayWithCapacity:0];
    while (1) {
        NSRange range = [dstStr rangeOfString:findStr];
        if (range.location ==NSNotFound) {
            break;
        }
        dstStr = [dstStr substringFromIndex:range.location+range.length];
        
        [rangeArr addObject:[NSString stringWithFormat:@"%ld",range.location+lastLength]];
        [rangeArr addObject:[NSString stringWithFormat:@"%ld",range.length]];
        lastLength += range.location+range.length;
    }
    return rangeArr;
}


@end
