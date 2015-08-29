//
//  ClassSearchView.h
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MIClassSearchController.h"

@interface MIClassSearchView : UIView <UISearchBarDelegate>

-(instancetype)initWithFrame:(CGRect)frame andController:(MIClassSearchController *)searchController;

@end