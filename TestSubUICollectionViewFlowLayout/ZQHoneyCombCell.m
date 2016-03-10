//
//  ZQHoneyCombCell.m
//  TestSubUICollectionViewFlowLayout
//
//  Created by zzqiltw on 15/9/5.
//  Copyright (c) 2015年 zzqiltw. All rights reserved.
//

#import "ZQHoneyCombCell.h"
#define SIZE 60
// 颜色
#define ZQColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ZQRandomColor ZQColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@implementation ZQHoneyCombCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = ZQRandomColor;
        CGFloat longSide = SIZE * 0.5 * cosf(M_PI * 30 / 180);
        CGFloat shortSide = SIZE * 0.5 * sinf(M_PI * 30 / 180);
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, longSide)];
        [path addLineToPoint:CGPointMake(shortSide, 0)];
        [path addLineToPoint:CGPointMake(shortSide + SIZE * 0.5, 0)];
        [path addLineToPoint:CGPointMake(SIZE, longSide)];
        [path addLineToPoint:CGPointMake(shortSide + SIZE * 0.5, longSide * 2)];
        [path addLineToPoint:CGPointMake(shortSide, longSide * 2)];
        [path closePath];
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = [path CGPath];
        
        self.layer.mask = maskLayer;
    }
    return self;
}

@end
