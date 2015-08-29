//
//  MIClassListController.h
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface MIClassListController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (readwrite, nonatomic, strong) NSArray *classList;

- (MIClassListController *)initWithMainController:(ViewController *)mainController withFrame:(CGRect)frame;

@end