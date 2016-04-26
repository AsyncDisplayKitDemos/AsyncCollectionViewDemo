//
//  ItemNode.m
//  AsyncCollectionViewDemo
//
//  Created by Andrew on 16/4/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

#import "ItemNode.h"

@implementation ItemNode
-(instancetype)initWithString:(NSString *)string{
    self=[super init];
    if(self){
        self.text=string;
        [self updateBackgroundColor];
    }
    return self;
}

- (void)updateBackgroundColor
{
    if (self.highlighted) {
        self.backgroundColor = [UIColor grayColor];
    } else if (self.selected) {
        self.backgroundColor = [UIColor darkGrayColor];
    } else {
        self.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self updateBackgroundColor];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self updateBackgroundColor];
}

@end
