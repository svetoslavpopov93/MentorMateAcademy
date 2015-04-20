//
//  MusicStar.m
//  ClassAssignment8_MusicStars
//
//  Created by Student17 on 4/20/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "MusicStar.h"

@implementation MusicStar
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.artistName = [[NSString alloc] init];
        self.image = [[UIImage alloc] init];
    }
    return self;
}
@end
