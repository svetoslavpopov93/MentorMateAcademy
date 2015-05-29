//
//  ViewController.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[DataManager sharedDataManager] fetchFlickrFeed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
