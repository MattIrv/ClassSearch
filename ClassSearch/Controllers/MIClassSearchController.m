//
//  MIClassSearchController.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MIClassSearchController.h"
#import "MIClassSearchView.h"
#import "ViewController.h"
#import "MICourse.h"
#import "MICourseSection.h"
#import "ClassSearch-Swift.h"

@interface MIClassSearchController ()

@property ViewController *mainController;

@end

@implementation MIClassSearchController

-(instancetype)initWithMainController:(ViewController *)mainController withFrame:(CGRect)frame {
    self.mainController = mainController;
    self.view = [[MIClassSearchView alloc] initWithFrame:frame andController:self];
    return self;
}

-(void)handleSearchForString:(NSString *)searchString {
    //TODO: Process the string
    NSArray *classList = [MIClassSearcher performSearchForString:searchString];
    [self.mainController showClassListViewWithClassList:classList];
}


+ (NSArray *)createSampleClassList __deprecated_msg("Use real data") {
    //TODO: Never call this
    NSMutableArray *classList = [NSMutableArray arrayWithCapacity:10];
    NSArray *course1Teachers = [NSArray arrayWithObject:@"Kevin Sullivan"];
    NSArray *course1Meetings = [NSArray arrayWithObject:@"MoWeFr 9:00 - 9:50AM"];
    NSArray *course1Locations = [NSArray arrayWithObject:@"Rice 130"];
    NSURL *course1URL = [NSURL URLWithString:@"http://google.com"];
    for(int i=0; i<10; i++) {
        MICourseSection *courseSection = [[MICourseSection alloc] initWithSectionID:12345 sectionNumber:i type:@"Lecture" credits:3 status:@"Open" enrollment:30 capacity:45 teachers:course1Teachers meetingTimes:course1Meetings locations:course1Locations website:course1URL subtitle:nil sectionDescription:nil  syllabus:nil comments:nil enrollmentRequirements:@"None" requirementDesignation:@"None" sisDescription:nil];
        MICourse *course = [[MICourse alloc] initWithDepartment:@"CS" number:(1000 + i) title:@"Introduction to Programming" courseDescription:@"" sections:[NSArray arrayWithObject:courseSection]];
        [classList addObject:course];
    }
    return classList;
}

@end