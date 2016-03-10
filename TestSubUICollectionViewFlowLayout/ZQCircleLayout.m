
//
//  ZQCircleLayout.m
//  TestSubUICollectionViewFlowLayout
//
//  Created by zzqiltw on 15/9/5.
//  Copyright (c) 2015年 zzqiltw. All rights reserved.
//

#import "ZQCircleLayout.h"
#define ITEM_SIZE 60
#define CIRCLE_RADIUS 80
@implementation ZQCircleLayout

- (void)prepareLayout
{
    [super prepareLayout];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray *attributesArray = [NSMutableArray array];
    for (NSInteger i = 0; i < count; ++i) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [attributesArray addObject:attributes];
    }
    return attributesArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    CGPoint currentCenter = CGPointMake(self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5, self.collectionView.bounds.size.height * 0.5);
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    
    CGFloat angelDelta = M_PI * 2 / count;
    CGFloat angel = M_PI_2 - angelDelta * indexPath.row;
    attributes.center = CGPointMake(currentCenter.x + CIRCLE_RADIUS * cosf(angel), currentCenter.y + CIRCLE_RADIUS * sinf(angel));
    return attributes;

}


@end
