//
//  MICourse.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MICourse : NSObject

@property NSString *department;
@property NSUInteger number;
@property NSString *title;
@property NSString *courseDescription;
@property NSArray *sections;

-(instancetype)initWithDepartment:(NSString *)department number:(NSUInteger)number title:(NSString *)title courseDescription:(NSString *)courseDescription sections:(NSArray *)sections;

@end
