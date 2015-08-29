//
//  MIClassSearchView.m
//  ClassSearch
//
//  Created by Matthew Irvine on 8/21/15.
//  Copyright © 2015 Matthew Irvine. All rights reserved.
//

#import "MIClassSearchView.h"

static const CGFloat SEARCHBAR_WIDTH = 300.0f;
static const CGFloat SEARCHBAR_HEIGHT = 60.0f;
static const CGFloat SEARCHBUTTON_WIDTH = 200.0f;
static const CGFloat SEARCHBUTTON_HEIGHT = 80.0f;

@interface MIClassSearchView ()

@property UISearchBar *searchBar;
@property UIButton *searchButton;
@property MIClassSearchController *searchController;

@end

@implementation MIClassSearchView

-(instancetype)initWithFrame:(CGRect)frame andController:(MIClassSearchController *)searchController {
    self = [super initWithFrame:frame];
    self.searchController = searchController;
    UIColor *backgroundColor = [UIColor colorWithRed:.9f green:.9f blue:1.0f alpha:1.0f];
    [self setBackgroundColor:backgroundColor];
    self.searchBar = [[UISearchBar alloc] init];
    CGFloat searchBarX = CGRectGetMidX(self.bounds) - SEARCHBAR_WIDTH / 2.0f;
    CGFloat searchBarY = CGRectGetMaxY(self.bounds) / 3.0f - SEARCHBAR_HEIGHT / 2.0f;
    self.searchBar.frame = CGRectMake(searchBarX, searchBarY, SEARCHBAR_WIDTH, SEARCHBAR_HEIGHT);
    [self.searchBar setTintColor:[UIColor orangeColor]];
    [self.searchBar setBarTintColor:backgroundColor];
    [self.searchBar setSearchBarStyle:UISearchBarStyleProminent];
    [self.searchBar setPlaceholder:@"CS 2330"];
    [self.searchBar setDelegate:self];
    [self addSubview:self.searchBar];
    self.searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGFloat searchButtonX = CGRectGetMidX(self.bounds) - SEARCHBUTTON_WIDTH / 2.0f;
    CGFloat searchButtonY = CGRectGetMaxY(self.bounds) / 2.0f - SEARCHBUTTON_HEIGHT / 2.0f;
    self.searchButton.frame = CGRectMake(searchButtonX, searchButtonY, SEARCHBUTTON_WIDTH, SEARCHBUTTON_HEIGHT);
    [self.searchButton setBackgroundColor:[UIColor orangeColor]];
    [self.searchButton setTintColor:[UIColor whiteColor]];
    [self.searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [self addSubview:self.searchButton];
    UIGestureRecognizer *searchButtonGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSearchAction)];
    [self.searchButton addGestureRecognizer:searchButtonGestureRecognizer];
    return self;
}

-(void)handleSearchAction {
    [self.searchController handleSearchForString:self.searchBar.text];
}

#pragma mark - UISearchBarDelegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self handleSearchAction];
}

@end