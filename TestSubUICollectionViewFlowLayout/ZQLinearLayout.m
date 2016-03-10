//
//  ZQLinearLayout.m
//  TestSubUICollectionViewFlowLayout
//
//  Created by zzqiltw on 15/9/5.
//  Copyright (c) 2015年 zzqiltw. All rights reserved.
//

#import "ZQLinearLayout.h"

#define ITEM_SIZE 60
#define SCALE_FACTOR 0.7
#define SCALE_BIG_DISTANCE 150

@implementation ZQLinearLayout

- (void)prepareLayout
{
    [super prepareLayout];
    // 每个item的size
    self.itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    // 最小间距
    self.minimumLineSpacing = 50;
    // 横向滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 内间距
    self.sectionInset = UIEdgeInsetsMake(90, (self.collectionView.bounds.size.width - ITEM_SIZE) * 0.5, 40, 150);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    // 当前屏幕的rect
    CGRect visiableRect = {proposedContentOffset, self.collectionView.bounds.size};
    CGFloat currentCenterX = proposedContentOffset.x + self.collectionView.bounds.size.width * 0.5;
    // 调用super实现可以获取到当前rect中所有item的布局属性
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:visiableRect];
    CGFloat adjustDistance = MAXFLOAT;
    // 计算距离中心点最近的item,来算偏移量
    for (UICollectionViewLayoutAttributes *attributes in attributesArray) {
        if (CGRectIntersectsRect(attributes.frame, visiableRect)) {// 在屏幕内
            CGFloat x = attributes.center.x;
            if (ABS(x - currentCenterX) < ABS(adjustDistance)) {
                adjustDistance = x - currentCenterX;
            }
        }
    }
    
    return CGPointMake(proposedContentOffset.x + adjustDistance, proposedContentOffset.y);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    CGRect visiableRect = {self.collectionView.contentOffset, self.collectionView.bounds.size};
    CGFloat currentCenterX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5;
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:visiableRect];
    for (UICollectionViewLayoutAttributes *attributes in attributesArray) {
        if (CGRectIntersectsRect(attributes.frame, visiableRect)) {// 在屏幕内
            CGFloat itemCenterX = attributes.center.x;
            // 设定一个放大的系数，公式大家可以自己来定，效果接近就可以
            CGFloat scale = 1 + SCALE_FACTOR * (1 - (ABS(itemCenterX - currentCenterX) / SCALE_BIG_DISTANCE));
            attributes.transform3D = CATransform3DMakeScale(scale, scale, 0.0);
        }
    }
    return attributesArray;
}

@end
