//
//  MICourseHeaderCell.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/22/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import "MICourseHeaderCell.h"

@interface MICourseHeaderCell ()

@end

@implementation MICourseHeaderCell

-(void)setCourse:(MICourse *)course {
    UILabel *courseNumberLabel = [[UILabel alloc] initWithFrame:self.frame];
    [courseNumberLabel setText:[NSString stringWithFormat:@"%@ %lu", course.department, (unsigned long)course.number]];
    [courseNumberLabel sizeToFit];
    CGRect courseNumberLabelFrame = courseNumberLabel.frame;
    courseNumberLabelFrame.origin = CGPointMake(10.0f, 5.0f);
    courseNumberLabel.frame = courseNumberLabelFrame;
    [self.contentView addSubview:courseNumberLabel];
    UILabel *courseTitleLabel = [[UILabel alloc] initWithFrame:self.frame];
    [courseTitleLabel setText:course.title];
    [courseTitleLabel sizeToFit];
    CGRect courseTitleLabelFrame = courseTitleLabel.frame;
    courseTitleLabelFrame.origin = CGPointMake(CGRectGetWidth(courseNumberLabelFrame) + 10.0f, 5.0f);
    courseTitleLabel.frame = courseTitleLabelFrame;
    [self.contentView addSubview:courseTitleLabel];
    [self.contentView setBackgroundColor:[UIColor cyanColor]];
    _course = course;
}

-(void)prepareForReuse {
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}

@end
