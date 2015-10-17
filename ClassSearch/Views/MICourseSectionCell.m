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
    UILabel *label = [[UILabel alloc] initWithFrame:self.frame];
    CGRect labelFrame = label.frame;
    labelFrame.origin = CGPointMake(10.0f, 5.0f);
    label.frame = labelFrame;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    NSMutableString *teachers = [NSMutableString string];
    [section.teachers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [teachers appendString:(NSString *)obj];
        [teachers appendString:@"\n"];
    }];
    NSMutableString *meetingsAndTimes = [NSMutableString string];
    [section.locations enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *locationForMeeting = (NSString *)obj;
        NSString *timeForMeeting = (NSString *)[section.meetingTimes objectAtIndex:idx];
        [meetingsAndTimes appendString:timeForMeeting];
        [meetingsAndTimes appendString:@": "];
        [meetingsAndTimes appendString:locationForMeeting];
        [meetingsAndTimes appendString:@"\n"];
    }];
    NSString *creditString = section.credits > 1 ? @"Credits" : @"Credit";
    [label setText:[NSString stringWithFormat:@"%@ %lu: %lu %@ - %@\n%@%@%lu / %lu", section.type, (unsigned long)section.sectionNumber, (unsigned long)section.credits, creditString, section.status, teachers, meetingsAndTimes, (unsigned long)section.enrollment, (unsigned long)section.capacity]];
    [label sizeToFit];
    _label = label;
    [self.contentView addSubview:label];
    CGRect frame = self.frame;
    frame.size.height = CGRectGetMaxY(label.frame) + 5.0f;
    self.frame = frame;
}

-(void)prepareForReuse {
    [self.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}

@end
