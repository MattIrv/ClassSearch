//
//  MICourseSection.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/22/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import "MICourseSection.h"

@implementation MICourseSection

-initWithSectionID:(NSUInteger)sectionID sectionNumber:(NSUInteger)sectionNumber type:(NSString *)type credits:(NSUInteger)credits status:(NSString *)status enrollment:(NSUInteger)enrollment capacity:(NSUInteger)capacity teachers:(NSArray *)teachers meetingTimes:(NSArray *)meetingTimes locations:(NSArray *)locations website:(NSURL *)website subtitle:(NSString *)subtitle sectionDescription:(NSString *)sectionDescription syllabus:(NSURL *)syllabus comments:(NSString *)comments enrollmentRequirements:(NSString *)enrollmentRequirements requirementDesignation:(NSString *)requirementDesignation sisDescription:(NSString *)sisDescription {
    self.sectionID = sectionID;
    self.sectionNumber = sectionNumber;
    self.type = type;
    self.credits = credits;
    self.status = status;
    self.enrollment = enrollment;
    self.capacity = capacity;
    self.teachers = teachers;
    self.meetingTimes = meetingTimes;
    self.locations = locations;
    self.website = website;
    self.subtitle = subtitle;
    self.sectionDescription = sectionDescription;
    self.syllabus = syllabus;
    self.comments = comments;
    self.enrollmentRequirements = enrollmentRequirements;
    self.requirementDesignation = requirementDesignation;
    self.sisDescription = sisDescription;
    return self;
}

@end
