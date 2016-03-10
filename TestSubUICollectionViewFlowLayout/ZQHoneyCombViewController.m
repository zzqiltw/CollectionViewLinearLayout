

//
//  ZQHoneyCombViewController.m
//  TestSubUICollectionViewFlowLayout
//
//  Created by zzqiltw on 15/9/5.
//  Copyright (c) 2015年 zzqiltw. All rights reserved.
//

#import "ZQHoneyCombViewController.h"
#import "ZQHoneyCombCell.h"
#import "ZQHoneyCombLayout.h"
@interface ZQHoneyCombViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZQHoneyCombViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 60;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZQHoneyCombCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        ZQHoneyCombLayout *layout = [[ZQHoneyCombLayout alloc] init];
        layout.margin = 20;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ZQHoneyCombCell class] forCellWithReuseIdentifier:@"cell"];
        
        _collectionView.layer.borderWidth = 1;
    }
    
    return _collectionView;
}

@end
