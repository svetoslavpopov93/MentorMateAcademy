//
//  CommentsViewController.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/19/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableViewComments;
@property (weak, nonatomic) IBOutlet UITextField *textFieldInput;
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewComments.delegate = self;
    self.tableViewComments.dataSource = self;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(userDidClickBackButton)];
    self.navigationItem.leftBarButtonItem = backButton;
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    [[self fetchedResultsController] performFetch:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark FetchedResultsControler

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSManagedObjectContext *context = [self.appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Comment"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"apartment.title == %@", [[[StateManager sharedStateManager] currentApartment] title]];
    [fetchRequest setPredicate:pred];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    NSLog(@"Change made!");
    [self.tableViewComments reloadData];
}

#pragma mark UITableView delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"someId"];
    NSError *error;
    [_fetchedResultsController performFetch:&error];
    
    Comment *info = [_fetchedResultsController objectAtIndexPath:indexPath];
    User *user = info.author;
    
    cell.detailTextLabel.text = user.nickName;
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id cellInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    long numberOfCells = [cellInfo numberOfObjects];
    
    return numberOfCells;
}


#pragma mark User iteractions

-(void)userDidClickBackButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)userDidClickCommentButton:(id)sender {
    // Do any additional setup after loading the view.
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Configuring the saving request from the input values
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    Comment *currentComment = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:context];
    [currentComment setValue:self.textFieldInput.text forKey:@"text"];
    // Setting the current date for the comment date
    NSDate *currentDate = [[NSDate alloc] initWithTimeIntervalSinceNow:15];
    [currentComment setValue:currentDate forKey:@"date"];
    [currentComment setApartment:[[StateManager sharedStateManager] currentApartment]];
    [currentComment setAuthor:[[StateManager sharedStateManager] currentUser]];
    
    // After the context saving the returned data is checked and if the saving fails an alert is shown.
    // If the saving is successfull, the application is returned to the login screen
    
    NSError *error;
    if (![context save:&error]) {

        NSLog(@"Saving failed!");
    }
    
    else{
        NSLog(@"Saving successfull!");
    }
}

#pragma mark Input validation
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
