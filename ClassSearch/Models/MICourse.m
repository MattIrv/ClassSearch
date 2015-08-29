//
//  MICourse.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import "MICourse.h"

@interface MICourse ()

@end

@implementation MICourse

-(instancetype)initWithDepartment:(NSString *)department number:(NSUInteger)number title:(NSString *)title courseDescription:(NSString *)courseDescription sections:(NSArray *)sections {
    self.department = department;
    self.number = number;
    self.title = title;
    self.courseDescription = courseDescription;
    self.sections = sections;
    return self;
}

@end
