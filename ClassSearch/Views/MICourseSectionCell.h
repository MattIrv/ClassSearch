//
//  MICourseSectionCell.h
//  ClassSearch
//
//  Created by Matthew Irvine on 8/22/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MICourseSection.h"

@interface MICourseSectionCell : UICollectionViewCell

@property (readwrite, nonatomic, strong) MICourseSection *section;

@end
