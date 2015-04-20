//
//  ArtistDetailsViewController.h
//  ClassAssignment8_MusicStars
//
//  Created by Student17 on 4/20/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ViewController.h"
#import "MusicStar.h"

@interface ArtistDetailsViewController : ViewController

@property (strong, nonatomic) NSString *artistName;
@property (strong, nonatomic) UIImage *image;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewCover;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@property (strong, nonatomic) MusicStar *currentArtist;

@end
