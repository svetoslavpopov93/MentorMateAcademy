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

@implementation FeedsTableViewController{
    NSIndexPath *cellPath;
    NSURL *currentURL;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.fetchedResultsController.delegate = self;
    [[DataManager sharedDataManager] setDelegate:self];
    [[DataManager sharedDataManager] fetchFlickrFeed];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Fetching data on first load of the application failed. Error %@, %@", error, [error userInfo]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)viewDidAppear:(BOOL)animated{
//    self.navigationController.navigationBarHidden = YES;
//}
//
//-(void)viewDidDisappear:(BOOL)animated{
//    self.navigationController.navigationBarHidden = NO;
//}

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
    
    // Initializing the entry before passing it to the cell
    CellEntry *cellEntry = [[CellEntry alloc] init];
    cellEntry.author = info.author;
    cellEntry.authorIconURL = (NSString*)info.authorIconURL;
    cellEntry.authorURL = info.authorURL;
    cellEntry.entryID = info.entryID;
    cellEntry.link = info.link;
    cellEntry.mainImageURL = (NSString*)info.mainImageURL;
    cellEntry.publishedDate = info.publishedDate;
    cellEntry.updatedDate = info.updatedDate;
    cellEntry.title = info.title;
    
    // Passing the data to the cell
    cell.cellEntry = cellEntry;
    
    return cell;
}

/**
 *  Checks if the user has approached the end of the table and loads more feed
 *
 *  @param tableView current table view
 *  @param cell      cell of the current table view
 *  @param indexPath index path of the current cell
 */
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(([tableView numberOfRowsInSection: 0] - 2) == indexPath.row){
        
        [[DataManager sharedDataManager] fetchFlickrFeed];
    }
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
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"publishedDate" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [fetchRequest setEntity:entity];
    
    [fetchRequest setFetchBatchSize:20];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    NSLog(@"Content changed!");
    [self.tableView reloadData];
}

// The action is triggered when the user taps on the url
- (IBAction)urlButtonTapped:(UIButton *)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender.superview.superview];
    cellPath = indexPath;
    
    Entry *info = [self.fetchedResultsController objectAtIndexPath:cellPath];
    currentURL = [NSURL URLWithString:[info authorURL]];
    
    [self performSegueWithIdentifier:@"urlSegue" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    WebViewController *vc = [segue destinationViewController];
    [vc setCurrentURL:currentURL];
}

-(void)userDidTapOnImageUrl:(NSURL *)url{
    currentURL = url;
    
    [self performSegueWithIdentifier:@"urlSegue" sender:self];
}

#pragma mark DataManagerDelegate
-(void)userDidTapOnImageWithURL:(NSURL *)url{
    currentURL = url;
    
    [self performSegueWithIdentifier:@"urlSegue" sender:self];
}
@end
