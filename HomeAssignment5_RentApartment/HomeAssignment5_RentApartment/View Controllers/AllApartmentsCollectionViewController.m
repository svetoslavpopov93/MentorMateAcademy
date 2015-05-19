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

@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;

@end

@implementation AllApartmentsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.clearsSelectionOnViewWillAppear = NO	;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(userDidClickAddNewOfferButton)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    [[self fetchedResultsController] performFetch:nil];
    
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
<<<<<<< HEAD

-(void)userDidClickAddNewOfferButton{
    UIViewController *addNewOfferVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addNewOfferVC"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addNewOfferVC];
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

=======

-(void)userDidClickAddNewOfferButton{
    UIViewController *addNewOfferVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addNewOfferVC"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addNewOfferVC];
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

>>>>>>> 61a92742d35055ff482e27738e293446bd3fd9f0
#pragma mark Core Data interactions

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSManagedObjectContext *context = [self.appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Apartment"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    id cellInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    long numberOfCells = [cellInfo numberOfObjects];
    return numberOfCells;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ApartmentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"apartmentCell" forIndexPath:indexPath];
    
    // Configure the cell
    Apartment *info = [_fetchedResultsController objectAtIndexPath:indexPath];
    
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
    NSLog(@"Clicked!");
}
<<<<<<< HEAD
=======

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
}
>>>>>>> 61a92742d35055ff482e27738e293446bd3fd9f0

@end
