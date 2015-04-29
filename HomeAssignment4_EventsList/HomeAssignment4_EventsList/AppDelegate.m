//
//  AppDelegate.m
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/23/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    DataModelSingleton *dataModel  = [DataModelSingleton initSharedDataModel];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *savedData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if ([savedData objectForKey:@"days"] != nil) {
            
            dataModel.days = [[NSMutableDictionary alloc] init];
            dataModel.days = [savedData objectForKey:@"days"];
        }
    }
    
    // Uncomment the next line of code to enter example users on the app's launch.
    // IMPORTANT: After the application is started once, it will save its data to a local file. After the first launching of the application it must be commented again. Otherwise it will add additional elements
    //[dataModel fillExampleEvents];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
    [self saveData];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self saveData];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveData];
}

- (void) saveData {
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] init];
    DataModelSingleton *dataManager = [DataModelSingleton initSharedDataModel];
    
    if (dataManager.events != nil) {
        [dataDict setObject:dataManager.days forKey:@"days"];
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    [NSKeyedArchiver archiveRootObject:dataDict toFile:filePath];
}

@end
