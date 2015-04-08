//
//  Movie.h
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/8/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Movie : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) float length;
@property (nonatomic) float price;

-(id)init;
-(id)initWithName: (NSString *)name Length:(float)length AndPrice:(float)price;

@end
