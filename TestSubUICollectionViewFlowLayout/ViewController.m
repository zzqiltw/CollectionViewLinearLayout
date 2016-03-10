//
//  ViewController.m
//  TestSubUICollectionViewFlowLayout
//
//  Created by zzqiltw on 15/9/5.
//  Copyright (c) 2015年 zzqiltw. All rights reserved.
//

#import "ViewController.h"
#import "ZQCollectionViewCell.h"
#import "ZQLinearLayout.h"
#import "ZQCircleLayout.h"
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewLayout *currentLayout;
@property (nonatomic, assign) NSInteger total;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.total = 11;
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.total;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZQCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.total --;
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        ZQCircleLayout *layout = [[ZQCircleLayout alloc] init];
        self.currentLayout = layout;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 240) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ZQCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    
    return _collectionView;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.currentLayout isKindOfClass:[ZQCircleLayout class]]) {
        self.currentLayout = [[ZQLinearLayout alloc] init];
    } else {
        self.currentLayout = [[ZQCircleLayout alloc] init];
    }
    [self.collectionView setCollectionViewLayout:self.currentLayout animated:YES];
    
}
@end
