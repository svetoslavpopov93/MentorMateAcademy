//
//  AlbumsTableViewController.m
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "AlbumsTableViewController.h"

@interface AlbumsTableViewController (){
    Album *currentAlbum;
    DataManagerSingleton *dataManager;
}

@end

@implementation AlbumsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"albumCellModel" bundle:nil]
         forCellReuseIdentifier: @"customCellID"];
    dataManager = [DataManagerSingleton initSharedDataManager];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData]; // to reload selected cell
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return dataManager.albums.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    customCell *cell = (customCell*)[tableView dequeueReusableCellWithIdentifier:@"customCellID"];
    
    currentAlbum = dataManager.albums[indexPath.row];
    
    cell.labelAlbumTitle.text = currentAlbum.albumTitle;
    cell.labelAlbumArtist.text = currentAlbum.albumArtist;
    cell.songsCount.text = [NSString stringWithFormat: @"%ld",currentAlbum.songs.count ];
    cell.albumCover.image = currentAlbum.albumCover;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    dataManager.selectedAlbumIndex = (int)indexPath.row;
    
    UIViewController *detailsController = [self.storyboard instantiateViewControllerWithIdentifier:@"AlbumDetailsVC"];
    
    [self.navigationController pushViewController:detailsController animated:YES];
}

- (IBAction)buttonActionAddNewAlbum:(id)sender {
    UIViewController *addAlbumViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"addNewAlbumVC"];
    
    [self.navigationController pushViewController:addAlbumViewController animated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dataManager.albums removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    Album *currentAlb = dataManager.albums[fromIndexPath.row];
    Album *toCurentAlb = dataManager.albums[toIndexPath.row];
    dataManager.albums[toIndexPath.row] = currentAlb;
    dataManager.albums[fromIndexPath.row] = toCurentAlb;
}

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}
@end
