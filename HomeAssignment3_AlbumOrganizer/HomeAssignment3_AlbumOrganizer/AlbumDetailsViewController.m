//
//  AlbumDetailsViewController.m
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "AlbumDetailsViewController.h"

@interface AlbumDetailsViewController ()

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
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    Song *curentSong = currentAlbum.songs[indexPath.row];
    
    cell.textLabel.text = curentSong.artistName;
    cell.detailTextLabel.text = curentSong.songTitle;
    
    return cell;
}

@end
