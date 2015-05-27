//
//  FeedsTableViewController.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/26/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "FeedsTableViewController.h"
#import "CoreDataManager.h"

@interface FeedsTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation FeedsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.fetchedResultsController.delegate = self;
    [[DataManager sharedDataManager] setDelegate:self];
    [[DataManager sharedDataManager] fetchFlickrFeed];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        // Update to handle the error appropriately.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    
    
    }

-(void)refresh{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    id sectionInfo =
    [[self.fetchedResultsController sections] objectAtIndex:section];
    
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FlickrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flickrCell" forIndexPath:indexPath];
    
    Entry *info = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //TODO: Set Entry!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return cell;
}

#pragma mark FetchedResultsControllerDelegate

-(NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSManagedObjectContext *context = [[CoreDataManager sharedManager] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entry"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setFetchBatchSize:20];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}

#pragma mark DataManagerDelegate

-(void)dataDidFinishFetching{
    
    [self.tableView reloadData];
}

@end
