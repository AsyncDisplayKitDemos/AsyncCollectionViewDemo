# AsyncCollectionViewDemo
针对collectionView的例子


##效果图
![logo](http://7xsn4e.com2.z0.glb.clouddn.com/IMG_0308.jpg)




![logo](http://7xsn4e.com2.z0.glb.clouddn.com/IMG_0307.jpg)


##自定义了ItemNode
用来显示文本

```
- (ASCellNodeBlock)collectionView:(ASCollectionView *)collectionView nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath{
  NSString *text = [NSString stringWithFormat:@"[%zd.%zd] says hi", indexPath.section, indexPath.item];
    return ^{
       return  [[ItemNode alloc]initWithString:text];
    };
    

}
```




##自定义了SupplementaryNode

相当于supplementaryView 或者decordView

```
-(ASCellNode*)collectionView:(ASCollectionView *)collectionView nodeForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
   NSString *text=[kind isEqualToString:UICollectionElementKindSectionHeader]?@"Header":@"Footer";
    
    SupplementaryNode *node=[[SupplementaryNode alloc]initWithText:text];
    BOOL isHeaderSection = [kind isEqualToString:UICollectionElementKindSectionHeader];
    node.backgroundColor = isHeaderSection ? [UIColor blueColor] : [UIColor redColor];
    return node;
}
```

