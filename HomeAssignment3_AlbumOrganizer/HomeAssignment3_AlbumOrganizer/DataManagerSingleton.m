//
//  DataManagerSingleton.m
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "DataManagerSingleton.h"

static DataManagerSingleton* sharedDataManager;

@implementation DataManagerSingleton

+(id)initSharedDataManager{
    @synchronized(self){
        if (sharedDataManager == nil) {
            sharedDataManager = [[self alloc ]init];
        }
        
        return sharedDataManager;
    }
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.albums = [[NSMutableArray alloc] init];
//        [self addNewAlbumWithTitle:@"Seek and Destroy" Artist:@"Metallica"];
//        [self addNewAlbumWithTitle:@"Master of puppets" Artist:@"Metallica"];
//        [self addNewAlbumWithTitle:@"Over the hills and far away" Artist:@"Nightwish"];
    }
    
    return self;
}

-(void)addNewAlbumWithTitle: (NSString*)title Artist: (NSString*)artist{
    
    Album *newAlbum = [[Album alloc] initWithTitle:title Artist:artist];
    
    [self.albums addObject:newAlbum];
    
}

-(void)addNewAlbum:(Album*)album{
    [self.albums addObject:album];
}

-(void)printAlbums{
    for (Album *alb in self.albums) {
        NSLog(@"%@", alb.albumTitle);
    }
}

@end
