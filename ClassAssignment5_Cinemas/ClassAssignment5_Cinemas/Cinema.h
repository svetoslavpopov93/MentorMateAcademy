//
//  Cinema.h
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/8/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface Cinema : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *workTime;
@property(nonatomic, strong) NSMutableArray *moviesList;

-(id)init;
-(id)initWithName: (NSString*)name AndWorkTime: (NSString*)workTime;

-(void)willAddNewMovie: (Movie*)movie;

@end
