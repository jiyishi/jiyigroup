//
//  CloseCell.m
//  jiyiwangluo
//
//  Created by Zen Shen on 15/9/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ClothesCell.h"
#import "SearchViewController.h"

@implementation ClothesCell
{
    UIButton* _loveButton;
    BOOL _clickColor;
    UIImageView* _backImageView;
    UILabel* _clothNameLabel;
    UILabel* _designerNameLabel;
    
}
- (void)awakeFromNib {

    _clickColor = YES;
    
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    _backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, JYWidth, 150)];
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"2.png"]];
    [self addSubview:_backImageView];
    
    _loveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loveButton.frame = CGRectMake(JYWidth-40, 10, 30, 30);
    [_loveButton setBackgroundImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
    [_loveButton addTarget:self action:@selector(loveClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loveButton];
    
    UIView* bgView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_backImageView.frame)-50, JYWidth, 50)];
    bgView.backgroundColor = [UIColor grayColor];
    bgView.alpha = 0.4;
    [self addSubview:bgView];
    
    _clothNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 2, JYWidth, 23)];
    _clothNameLabel.text = @"简介";
    _clothNameLabel.font = JYFont(13.0f);
    _clothNameLabel.textColor = [UIColor redColor];
    [bgView addSubview:_clothNameLabel];
    
    _designerNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_clothNameLabel.frame.origin.x, CGRectGetMaxY(_clothNameLabel.frame), JYWidth, 23)];
    _designerNameLabel.text = @"提莫";
    _designerNameLabel.font = JYFont(13.0f);
    _designerNameLabel.textColor = [UIColor redColor];
    [bgView addSubview:_designerNameLabel];
    
}

#pragma mark -- 点击心形事件

-(void)loveClick{
    
    if (_clickColor == NO) {
        [_loveButton setImage:[UIImage imageNamed:@"heart1.png"] forState:UIControlStateNormal];
        _clickColor = YES;
    }else{
        [_loveButton setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
        _clickColor = NO;
    }
    
}

-(void)conFig:(ClothesModel *)model{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
