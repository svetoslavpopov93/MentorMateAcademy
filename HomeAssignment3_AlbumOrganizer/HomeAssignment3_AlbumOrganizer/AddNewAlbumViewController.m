//
//  AddNewAlbumViewController.m
//  HomeAssignment3_AlbumOrganizer
//
//  Created by svetoslavpopov on 4/20/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "AddNewAlbumViewController.h"

@interface AddNewAlbumViewController (){
    Album *currentNewAlbum;
}

@property (weak, nonatomic) IBOutlet UITextField *textFieldAlbumTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAlbumArtist;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSongArtist;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSongTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLength;
@property (weak, nonatomic) IBOutlet UILabel *labelCurrentSongCount;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddSong;

@end

@implementation AddNewAlbumViewController{
    DataManagerSingleton *dataManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataManager = [DataManagerSingleton initSharedDataManager];
    currentNewAlbum = [[Album alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonActionAddAlbum:(id)sender {
    
}
- (IBAction)buttonActionAdd:(id)sender {
    if ([(UIButton*)sender isEqual: self.buttonAddSong]) {
//        NSString *currentLengthAsString = [NSString stringWithFormat: @"%0.2f", self.textFieldLength.text.floatValue];
        
        Song *currentNewSong = [[Song alloc] initWithArtistName:self.textFieldSongArtist.text AndSongTitle:self.textFieldSongTitle.text];
        [currentNewAlbum addNewSong:currentNewSong];
        self.labelCurrentSongCount.text = [NSString stringWithFormat: @"%ld", currentNewAlbum.songs.count];
    }
    else{
        currentNewAlbum.albumTitle = self.textFieldAlbumTitle.text;
        currentNewAlbum.albumArtist = self.textFieldAlbumArtist.text;
        
        [dataManager addNewAlbum:currentNewAlbum];
        
        UITableViewController *albumsTableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"albumsTVC"];
        [self.navigationController pushViewController:albumsTableVC animated:YES];
    }
}

@end
