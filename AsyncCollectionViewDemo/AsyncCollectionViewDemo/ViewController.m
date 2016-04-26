//
//  ViewController.m
//  AsyncCollectionViewDemo
//
//  Created by Andrew on 16/4/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "SupplementaryNode.h"
#import "ItemNode.h"
@interface ViewController ()<ASCollectionViewDataSource, ASCollectionViewDelegateFlowLayout>
@property (nonatomic,strong)ASCollectionView *collectionView;
@property (nonatomic,strong)NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.headerReferenceSize = CGSizeMake(50.0, 50.0);
    layout.footerReferenceSize = CGSizeMake(50.0, 50.0);
    
    self.collectionView=[[ASCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.asyncDataSource = self;
    self.collectionView.asyncDelegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    

    [self.collectionView registerSupplementaryNodeOfKind:UICollectionElementKindSectionHeader];
    [self.collectionView registerSupplementaryNodeOfKind:UICollectionElementKindSectionFooter];
    [self.view addSubview:self.collectionView];
    
}


#pragma mark
#pragma mark ASCollectionView dataSource
- (ASCellNodeBlock)collectionView:(ASCollectionView *)collectionView nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath{
  NSString *text = [NSString stringWithFormat:@"[%zd.%zd] says hi", indexPath.section, indexPath.item];
    return ^{
       return  [[ItemNode alloc]initWithString:text];
    };
    

}

-(ASCellNode*)collectionView:(ASCollectionView *)collectionView nodeForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
   NSString *text=[kind isEqualToString:UICollectionElementKindSectionHeader]?@"Header":@"Footer";
    
    SupplementaryNode *node=[[SupplementaryNode alloc]initWithText:text];
    BOOL isHeaderSection = [kind isEqualToString:UICollectionElementKindSectionHeader];
    node.backgroundColor = isHeaderSection ? [UIColor blueColor] : [UIColor redColor];
    return node;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 100;
}


-(void)dealloc{
    self.collectionView.asyncDataSource=nil;
    self.collectionView.asyncDelegate=nil;
     NSLog(@"ViewController is deallocing");
}



@end
