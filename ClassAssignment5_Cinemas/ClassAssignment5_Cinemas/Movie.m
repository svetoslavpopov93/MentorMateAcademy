//
//  Movie.m
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/8/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "Movie.h"


@implementation Movie
-(id)init{
    self = [super init];
    
    if (self) {
        self.name = [[NSString alloc] init];
    }
    
    return self;
}

-(id)initWithName: (NSString *)name Length:(float)length AndPrice:(float)price{
    self = [self init];
    
    if(self){
        self.name = name;
        self.length = length;
        self.price = price;
    }
    
    return self;
}
@end
