//
//  AddNewSongViewController.m
//  HomeAssignment3_AlbumOrganizer
//
//  Created by svetoslavpopov on 4/22/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "AddNewSongViewController.h"

@interface AddNewSongViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldSontArtist;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSongName;

@end

@implementation AddNewSongViewController{
    DataManagerSingleton *dataManager;
    Album *current;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataManager = [DataManagerSingleton initSharedDataManager];
    current = dataManager.albums[dataManager.selectedAlbumIndex];
    
    self.textFieldSontArtist.text = current.albumArtist;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonActionAddSong:(id)sender {
    Song *currentNewSong = [[Song alloc] initWithArtistName:self.textFieldSontArtist.text AndSongTitle:self.textFieldSongName.text];
    
    [current.songs addObject:currentNewSong];
    dataManager.albums[dataManager.selectedAlbumIndex] = current;
    
    UIViewController *albumDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AlbumDetailsVC"];
    
    [self.navigationController pushViewController:albumDetailsVC animated:YES];
}

@end
