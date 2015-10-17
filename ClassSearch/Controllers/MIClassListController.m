//
//  MIClassListController.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import "MIClassListController.h"
#import "MIClassListCollectionView.h"
#import "MICourseHeaderCell.h"
#import "MICourseSection.h"
#import "MICourseSectionCell.h"
#import "ViewController.h"

static NSString *SECTION_CELL_REUSE_ID = @"Cell";
static NSString *HEADER_CELL_REUSE_ID = @"HeaderCell";

@interface MIClassListController ()

@property ViewController *mainController;
@property MIClassListCollectionView *collectionView;

@end

@implementation MIClassListController

-(instancetype)initWithMainController:(ViewController *)mainController withFrame:(CGRect)frame {
    _mainController = mainController;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.headerReferenceSize = CGSizeMake(frame.size.width, 100.0f);
    MIClassListCollectionView *collectionView = [[MIClassListCollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    [collectionView registerClass:[MICourseSectionCell class] forCellWithReuseIdentifier:SECTION_CELL_REUSE_ID];
    [collectionView registerClass:[MICourseHeaderCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEADER_CELL_REUSE_ID];
    [collectionView setDelegate:self];
    [collectionView setDataSource:self];
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    
    _collectionView = collectionView;
    self.view = collectionView;
    return self;
}

-(void)setClassList:(NSArray *)classList {
    self.collectionView.classList = classList;
}

-(NSArray *)classList {
    return self.collectionView.classList;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger courseIndex = indexPath.section;
    NSInteger sectionIndex = indexPath.item;
    MICourse *course = [self.classList objectAtIndex:courseIndex];
    MICourseSection *section = [course.sections objectAtIndex:sectionIndex];
    MICourseSectionCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:SECTION_CELL_REUSE_ID forIndexPath:indexPath];
    cell.section = section;
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind != UICollectionElementKindSectionHeader) {
        return nil;
    }
    NSInteger courseIndex = indexPath.section;
    MICourse *course = [self.classList objectAtIndex:courseIndex];
    MICourseHeaderCell *cell = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HEADER_CELL_REUSE_ID forIndexPath:indexPath];
    cell.course = course;
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    MICourse *course = [self.classList objectAtIndex:section];
    return course.sections.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.classList.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)layout referenceSizeForHeaderInSection:(NSInteger)section {
    // This is hacky but I blame Apple. Create the same cell and see how big it is
    MICourseHeaderCell *cell = [[MICourseHeaderCell alloc] init];
    CGRect frame = self.collectionView.frame;
    cell.frame = frame;
    [cell setCourse:[self.classList objectAtIndex:section]];
    CGFloat height = cell.frame.size.height;
    CGFloat width = frame.size.width;
    return CGSizeMake(width, height);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    MICourseSectionCell *cell = [[MICourseSectionCell alloc] init];
    CGRect frame = self.collectionView.frame;
    cell.frame = frame;
    NSInteger courseIndex = indexPath.section;
    NSInteger sectionIndex = indexPath.item;
    MICourse *course = [self.classList objectAtIndex:courseIndex];
    MICourseSection *section = [course.sections objectAtIndex:sectionIndex];
    [cell setSection:section];
    CGFloat height = cell.frame.size.height;
    CGFloat width = frame.size.width;
    return CGSizeMake(width, height);
}

@end