//
//  MICourseSummaryCell.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/22/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import "MICourseSectionCell.h"

@interface MICourseSectionCell ()

@property UILabel *label;

@end

@implementation MICourseSectionCell

-(void)setSection:(MICourseSection *)section {
    UILabel *label = [[UILabel alloc] init];
    [label setText:[NSString stringWithFormat:@"%@ %lu\n%@\n%@\n%@\n%lu / %lu", section.type, (unsigned long)section.sectionNumber, section.teachers, section.locations, section.meetingTimes, (unsigned long)section.enrollment, (unsigned long)section.capacity]];
    [label sizeToFit];
    self.label = label;
    [self addSubview:label];
}

-(void)prepareForReuse {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}

@end
