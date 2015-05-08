//
//  ConnectionManager.h
//  CategoriesDelegatesAndProtocolsTests
//
//  Created by svetoslavpopov on 5/4/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConnectionManagerDelegate <NSObject>

@required
-(void)didConnectToNetwork:(NSString *)connectionName;
@end

@interface ConnectionManager : NSObject

-(void)startConnection;
-(void)stopConnection;
-(void)performConnection:(NSString *)connectionName;

@property (nonatomic, getter=isRunning) BOOL running;
@property (nonatomic, retain) id<ConnectionManagerDelegate> delegate;
@property (nonatomic, strong) NSMutableString *connectionName;

@end
