//
//  MIClassDetailController.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MIClassDetailController.h"
#import "ViewController.h"

@interface MIClassDetailController ()

@property ViewController *mainController;

@end

@implementation MIClassDetailController

-(instancetype)initWithMainController:(ViewController *)mainController withFrame:(CGRect)frame {
    self.mainController = mainController;
    return self;
}

-(void)showView {
    
}

@end