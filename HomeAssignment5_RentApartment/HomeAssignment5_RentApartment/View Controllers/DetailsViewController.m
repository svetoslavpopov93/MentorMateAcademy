//
//  DetailsViewController.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/14/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewImage;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
@property (weak, nonatomic) IBOutlet UILabel *labelCityQuarter;
@property (weak, nonatomic) IBOutlet UILabel *labelOwner;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UITextView *textViewDetails;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize all navigation buttons
    UIBarButtonItem *leftButtonBack = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(userDidSelectBackButton)];
    self.navigationItem.leftBarButtonItem = leftButtonBack;
    
    UIBarButtonItem *rightButtonComments = [[UIBarButtonItem alloc] initWithTitle:@"Comments" style:UIBarButtonItemStylePlain target:self action:@selector(userDidSelectCommentsButton)];
    self.navigationItem.rightBarButtonItem = rightButtonComments;
    
    Apartment *current = [[StateManager sharedStateManager] currentApartment];
    self.imageViewImage.image = [UIImage imageWithData:current.image];
    self.labelTitle.text = current.title;
    self.labelCity.text = current.city;
    self.labelCityQuarter.text = current.cityQuarter;
    self.labelOwner.text = current.owner.nickName;
    self.labelPrice.text = [NSString stringWithFormat:@"%0.2f", [current.price floatValue]];
    self.textViewDetails.text = current.details;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark User iteractions

-(void)userDidSelectBackButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)userDidSelectCommentsButton{
    
    UIViewController *commentsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"commentsVC"];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:commentsVC];
    [self.navigationController presentViewController:nc animated:YES completion:nil];
}

@end
