//
//  AllApartmentsCollectionViewController.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/14/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "AllApartmentsCollectionViewController.h"

@interface AllApartmentsCollectionViewController () <NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;

@end

@implementation AllApartmentsCollectionViewController{
    StateManager *stateMan;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting the add button at the navigation toolbar
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(userDidClickAddNewOfferButton)];
    self.navigationItem.rightBarButtonItem = addButton;
    [self.navigationController setToolbarHidden:NO];
    
    // Declaring the appDelegate as a separate variable for easier later use
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Declaring the StateManager singleton as a separate variable for easier later use
    stateMan = [StateManager sharedStateManager];
    stateMan.delegate = self;
    [stateMan.fetchedResultsController performFetch:nil];

    self.clearsSelectionOnViewWillAppear = NO;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

#pragma mark Navigation actions
-(void)userDidClickAddNewOfferButton{
    UIViewController *addNewOfferVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addNewOfferVC"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addNewOfferVC];
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    id cellInfo = [[stateMan.fetchedResultsController sections] objectAtIndex:section];
    long numberOfCells = [cellInfo numberOfObjects];
    return numberOfCells;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ApartmentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"apartmentCell" forIndexPath:indexPath];
    
    // Configure the cell
    Apartment *info = [stateMan.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.imageViewImage.image = [UIImage imageWithData:info.image];
    cell.labelApartmentType.text = info.apartmentType;
    cell.labelCity.text = info.city;
    cell.labelCityQuarter.text = info.cityQuarter;
    cell.labelDetails.text = info.details;
    cell.labelPrice.text = [NSString stringWithFormat:@"$%02.f",[info.price floatValue]];
    cell.labelTitle.text = info.title;

    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Apartment *current = [_fetchedResultsController objectAtIndexPath:indexPath];
    [[StateManager sharedStateManager] setCurrentApartment:current];
    
    UIViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailsVC"];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:detailsVC];
    [self.navigationController presentViewController:nc animated:YES completion:nil];
}

-(void)searchButtonClicked{
    [self dataDidChanged];
}

-(void)dataDidChanged{
    [self.collectionView reloadData];
}

@end
