//
//  MIClassSearchController.h
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface MIClassSearchController : UIViewController
- (MIClassSearchController *)initWithMainController:(ViewController *)mainController withFrame:(CGRect)frame;
- (void)handleSearchForString:(NSString *)searchString;
@end
