//
//  DataManagerSingleton.h
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface DataManagerSingleton : NSObject

@property (nonatomic, strong) NSMutableArray* albums;
@property (nonatomic) int selectedAlbumIndex;

+(id)initSharedDataManager;
-(void)addNewAlbumWithTitle: (NSString*)title Artist: (NSString*)artist;
-(void)addNewAlbum:(Album*)album;
-(void)printAlbums;

@end
