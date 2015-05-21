//
//  SearchPopoverViewController.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/21/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "SearchPopoverViewController.h"

@interface SearchPopoverViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldCity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCityQuarter;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPriceFrom;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPriceTo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitle;

@end

@implementation SearchPopoverViewController
@synthesize predicateString = _predicateString;

- (void)viewDidLoad {
    [super viewDidLoad];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)userDidClickSearchButton:(id)sender {
    NSMutableArray *subPredicates = [[NSMutableArray alloc] init];
        if ([self inputDidPassValidationCheckForEmptyString: self.textFieldTitle.text]){
            NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"apartment.title == %@", self.textFieldTitle.text]];
            [subPredicates addObject:predicate];
        }
    
        if ([self inputDidPassValidationCheckForEmptyString:self.textFieldCity.text]) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"apartment.city == %@", self.textFieldCity.text]];
            [subPredicates addObject:predicate];
        }
    
        if ([self inputDidPassValidationCheckForEmptyString:self.textFieldCityQuarter.text]) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"apartment.cityQuarter == %@", self.textFieldCityQuarter.text]];
            [subPredicates addObject:predicate];
        }
    
        if ([self inputDidPassValidationCheckForEmptyString:self.textFieldPriceFrom.text]) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"apartment.price > %@", self.textFieldPriceFrom.text]];
            [subPredicates addObject:predicate];
        }
    
        if ([self inputDidPassValidationCheckForEmptyString:self.textFieldPriceTo.text]) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@" AND price < %@", self.textFieldPriceTo.text]];
            [subPredicates addObject:predicate];
        }
    
    if (subPredicates != nil) {
        NSPredicate *andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:subPredicates];
    
        [[StateManager sharedStateManager] fetchObjectsWithPredicate:andPredicate];
    }
    else{
        NSLog(@"No predicates selected!");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Input management

// Check if the string is empty or only with white spaces
-(BOOL)inputDidPassValidationCheckForEmptyString: (NSString*)inputString{
    NSString *trimmed = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([trimmed isEqualToString:@""]) {
        return NO;
    }
    else{
        return YES;
    }
}

@end
