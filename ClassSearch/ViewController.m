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
@property UIView *contentsView;
@property UINavigationController *navController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UVA Class Search";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self];
    UINavigationBar *navBar = navController.navigationBar;
    navBar.barTintColor = [UIColor brownColor];
    CGFloat statusBarFrameHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGRect navBarFrame = navBar.frame;
    navBarFrame.origin.y += statusBarFrameHeight;
    navBar.frame = navBarFrame;
    CGRect frame = self.view.frame;
    CGFloat windowWidth = frame.size.width;
    CGFloat contentsViewTop = CGRectGetMaxY(navBar.frame);
    UIView *contentsView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, contentsViewTop, windowWidth, frame.size.height - contentsViewTop)];
    self.navController = navController;
    self.contentsView = contentsView;
    [self.view addSubview:navBar];
    [self.view addSubview:contentsView];
    CGRect boundsForViews = contentsView.bounds;
    self.classSearchController = [[MIClassSearchController alloc] initWithMainController:self withFrame:boundsForViews];
    self.classListController = [[MIClassListController alloc] initWithMainController:self withFrame:boundsForViews];
    self.classDetailController = [[MIClassDetailController alloc] initWithMainController:self withFrame:boundsForViews];
    [self showClassSearchView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showClassSearchView {
    [self setViewToOnly:self.classSearchController.view];
}

- (void)showClassListView {
    [self setViewToOnly:self.classListController.view];
}

- (void)showClassListViewWithClassList:(NSArray *)classList {
    //TODO: Logic!
    self.classListController.classList = classList;
    [self setViewToOnly:self.classListController.view];
}

- (void)showClassDetailViewForCourse:(MICourse *)course {
    //TODO: Logic!
    [self setViewToOnly:self.classDetailController.view];
}

- (void)setViewToOnly:(UIView *)view {
    [self.contentsView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    CGFloat maxHeight = CGRectGetHeight(self.contentsView.bounds);
    if (CGRectGetHeight(view.bounds) > maxHeight) {
        CGRect viewFrame = view.frame;
        viewFrame.size.height = maxHeight;
        view.frame = viewFrame;
    }
    [self.contentsView addSubview:view];
}

@end
