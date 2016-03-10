//
//  ZQCollectionViewCell.m
//  TestSubUICollectionViewFlowLayout
//
//  Created by zzqiltw on 15/9/5.
//  Copyright (c) 2015年 zzqiltw. All rights reserved.
//

#import "ZQCollectionViewCell.h"

// 颜色
#define ZQColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ZQRandomColor ZQColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ZQCollectionViewCell()
@property (nonatomic, strong) UILabel *label;
@end

@implementation ZQCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = ZQRandomColor;
        
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return self;
}

- (void)setTextForLabel:(NSString *)text
{
//    self.label.text = text;
//    [self.label sizeToFit];
}

@end
