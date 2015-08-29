//
//  ViewController.h
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MICourse.h"

@interface ViewController : UIViewController
-(void)showClassSearchView;
-(void)showClassListView;
-(void)showClassListViewWithClassList:(NSArray *)classList;
-(void)showClassDetailViewForCourse:(MICourse *)course;
@end

