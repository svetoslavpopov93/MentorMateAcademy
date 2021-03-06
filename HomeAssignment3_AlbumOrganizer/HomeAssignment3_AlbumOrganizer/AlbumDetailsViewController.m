//
//  AlbumDetailsViewController.m
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "AlbumDetailsViewController.h"

@interface AlbumDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageVIewAlbumCover;
@property (weak, nonatomic) IBOutlet UILabel *labelAlbumTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelAlbumAuthor;
@property (weak, nonatomic) IBOutlet UILabel *labelAlbumSongsCount;
@property (weak, nonatomic) IBOutlet UITableView *tableVIewSongs;

@end

@implementation AlbumDetailsViewController{
    DataManagerSingleton *dataManager;
    Album *currentAlbum;
}
@synthesize songs;

- (void)viewDidLoad {
    [super viewDidLoad];
    dataManager = [DataManagerSingleton initSharedDataManager];
    songs = [[NSMutableArray alloc] init];
    currentAlbum = dataManager.albums[dataManager.selectedAlbumIndex];
    songs = currentAlbum.songs;
    
    self.imageVIewAlbumCover.image = currentAlbum.albumCover;
    self.labelAlbumTitle.text = currentAlbum.albumTitle;
    self.labelAlbumAuthor.text = currentAlbum.albumArtist;
    self.labelAlbumSongsCount.text = [NSString stringWithFormat:@"%ld",currentAlbum.songs.count];
    self.tableVIewSongs.allowsSelection = NO;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableVIewSongs reloadData]; // to reload selected cell
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return currentAlbum.songs.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    
    Song *curentSong = currentAlbum.songs[indexPath.row];
    
    cell.textLabel.text = curentSong.artistName;
    cell.detailTextLabel.text = curentSong.songTitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    Song *songFromIndex = self.songs[fromIndexPath.row];
    Song *songToIndex = self.songs[toIndexPath.row];
    
    self.songs[toIndexPath.row] = songFromIndex;
    self.songs[fromIndexPath.row] = songToIndex;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [self.tableVIewSongs setEditing:editing animated:animated];
    
    [super setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.songs removeObjectAtIndex: indexPath.row];
        self.labelAlbumSongsCount.text = [NSString stringWithFormat: @"%ld", self.songs.count];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (IBAction)buttonActionAddSongs:(id)sender {
    UIViewController *addNewSongVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewSongVC"];
    [self.navigationController pushViewController:addNewSongVC animated:YES];
}

@end
