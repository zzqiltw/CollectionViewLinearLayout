

//
//  ZQHoneyCombLayout.m
//  TestSubUICollectionViewFlowLayout
//
//  Created by zzqiltw on 15/9/5.
//  Copyright (c) 2015年 zzqiltw. All rights reserved.
//

#import "ZQHoneyCombLayout.h"
#define SIZE 60
#define COL 4

@implementation ZQHoneyCombLayout

//- (CGSize)collectionViewContentSize
//{
//    CGFloat height = (SIZE + self.margin) * ([self.collectionView numberOfItemsInSection:0] / COL + 1);
//    return CGSizeMake(0, height);
//}

- (CGSize)collectionViewContentSize
{
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(0, (count / COL)* count);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    UICollectionView *collection = self.collectionView;
    
    float x = (SIZE + self.margin) * (indexPath.item % COL + 1) * 0.75 + 40;
    float y = (SIZE + self.margin) * (indexPath.item / COL + 0.5) * cos(M_PI * 30.0f / 180.0f) + 20;
    if (indexPath.item % 2 == 1) {
        y += (SIZE + self.margin) * 0.5 * cosf(M_PI * 30.0f / 180.0f);
    }
    
    attributes.center = CGPointMake(x + collection.contentOffset.x, y + collection.contentOffset.y);
    attributes.size = CGSizeMake(SIZE, SIZE * cos(M_PI * 30.0f / 180.0f));
    
    return attributes;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    if ([arr count] > 0) {
        return arr;
    }
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i = 0 ; i < [self.collectionView numberOfItemsInSection:0 ]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

@end
