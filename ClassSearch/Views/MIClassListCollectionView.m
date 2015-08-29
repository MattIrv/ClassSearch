//
//  MIClassListCollectionView.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/22/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import "MIClassListCollectionView.h"
#import "MICourse.h"
#import "MICourseSection.h"
#import "MICourseSectionCell.h"

@interface MIClassListCollectionView ()

@end

@implementation MIClassListCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    return self;
}

- (void)setClassList:(NSArray *)classList {
    _classList = classList;
    [self reloadData];
}

@end
