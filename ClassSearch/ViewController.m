//
//  ViewController.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import "ViewController.h"
#import "MIClassSearchController.h"
#import "MIClassListController.h"
#import "MIClassDetailController.h"

@interface ViewController ()

@property MIClassSearchController *classSearchController;
@property MIClassListController *classListController;
@property MIClassDetailController *classDetailController;
@property (readwrite, nonatomic, strong) UINavigationController *navController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UVA Class Search";
    CGRect frameForControllers = self.view.bounds;
    CGFloat navBarHeight = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    frameForControllers.size.height -= navBarHeight;
    self.classSearchController = [[MIClassSearchController alloc] initWithMainController:self withFrame:frameForControllers];
    self.classListController = [[MIClassListController alloc] initWithMainController:self withFrame:frameForControllers];
    self.classDetailController = [[MIClassDetailController alloc] initWithMainController:self withFrame:frameForControllers];
    self.navController = self.navigationController;
    [self.navController setViewControllers:[NSArray arrayWithObject:self.classSearchController] animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showClassSearchView {
    [self.navController pushViewController:self.classSearchController animated:YES];
}

- (void)showClassListView {
    [self.navController pushViewController:self.classListController animated:YES];
}

- (void)showClassListViewWithClassList:(NSArray *)classList {
    //TODO: Logic!
    self.classListController.classList = classList;
    [self.navController pushViewController:self.classListController animated:YES];

}

- (void)showClassDetailViewForCourse:(MICourse *)course {
    //TODO: Logic!
    [self.navController pushViewController:self.classDetailController animated:YES];

}

@end
