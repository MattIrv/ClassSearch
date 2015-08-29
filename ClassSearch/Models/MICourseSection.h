//
//  MICourseSection.h
//  ClassSearch
//
//  Created by Matthew Irvine on 8/22/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MICourseSection : NSObject

// Main screen properties
@property NSUInteger sectionID;
@property NSUInteger sectionNumber;
@property NSString *type;
@property NSUInteger credits;
@property NSString *status;
@property NSUInteger enrollment;
@property NSUInteger capacity;
@property NSArray *teachers;
@property NSArray *meetingTimes;
@property NSArray *locations;

// Subsequent properties should be grabbed from the detail view
@property NSURL *website;
@property NSString *subtitle;
@property NSString *sectionDescription;
@property NSURL *syllabus;
@property NSString *comments;
@property NSString *enrollmentRequirements;
@property NSString *requirementDesignation;
@property NSString *sisDescription;

-initWithSectionID:(NSUInteger)sectionID sectionNumber:(NSUInteger)sectionNumber type:(NSString *)type credits:(NSUInteger)credits status:(NSString *)status enrollment:(NSUInteger)enrollment capacity:(NSUInteger)capacity teachers:(NSArray *)teachers meetingTimes:(NSArray *)meetingTimes locations:(NSArray *)locations website:(NSURL *)website subtitle:(NSString *)subtitle sectionDescription:(NSString *)sectionDescription syllabus:(NSURL *)syllabus comments:(NSString *)comments enrollmentRequirements:(NSString *)enrollmentRequirements requirementDesignation:(NSString *)requirementDesignation sisDescription:(NSString *)sisDescription;

@end
