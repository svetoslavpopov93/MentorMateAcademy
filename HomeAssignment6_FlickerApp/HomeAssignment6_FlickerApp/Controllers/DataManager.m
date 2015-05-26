//
//  DataManager.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "DataManager.h"
static DataManager *sharedDataManager;



@implementation DataManager{
    NSManagedObject *currentEntry;
    NSString *currentVariable;
    BOOL isForParsingStaged;
    BOOL isAuthorParsingStaged;
    
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

+ (id)sharedDataManager {
    
    @synchronized(self) {
        if (sharedDataManager == nil)
            sharedDataManager = [[self alloc] init];
    }
    return sharedDataManager;
}

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self.entries = [[NSMutableArray alloc] init];
        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        
        managedObjectContext = [delegate managedObjectContext];
    }
    
    return self;
}

#pragma mark Fetching data from the Flickr api

-(void)fetchFlickrFeed{
    isForParsingStaged = NO;
    isAuthorParsingStaged = NO;
    
    NSString *flickrURL =@"https://api.flickr.com/services/feeds/photos_public.gne";
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:flickrURL]];
    parser.delegate = self;
    [parser parse];
}

#pragma mark XMLParser delegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"entry"]) {
        currentEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:managedObjectContext];
        
        NSLog(@"");
    }
    else if(currentEntry != nil){
        if ([elementName isEqualToString:@"title"]) {
            currentVariable = @"title";
            isForParsingStaged = YES;
        }
        else if ([elementName isEqualToString:@"link"] && [[attributeDict objectForKey:@"rel"] isEqualToString:@"enclosure"]){
            currentVariable = @"link";
            isForParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"id"]){
            currentVariable = @"entryID";
            isForParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"published"]){
            currentVariable = @"publishedDate";
            isForParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"updated"]){
            currentVariable = @"updatedDate";
            isForParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"name"]){
            currentVariable = @"author";
            isAuthorParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"uri"]){
            currentVariable = @"authorURL";
            isAuthorParsingStaged = YES;
        }
//        else if([elementName isEqualToString:@"flickr:buddyicon"]){
//            currentVariable = @"authorIconURL";
//            isAuthorParsingStaged = YES;
//        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (currentEntry != nil) {
        //
        //
        // TODO: Fix parsing image, image link and dates problem when the program comes to here
        //
        //
        //
#warning Fix parsing image, image link and dates problem when the program comes to here
        if (currentVariable != nil && isForParsingStaged) {
            
            if ([currentVariable isEqualToString:@"link"]) {
                NSData *downloadData = [NSData dataWithContentsOfURL: [NSURL URLWithString:string]];
                [currentEntry setValue:string forKey:currentVariable];
                NSLog(@"%@ added!", currentVariable);
                isForParsingStaged = NO;
            }
            else if([currentVariable isEqualToString:@"publishedDate"] || [currentVariable isEqualToString:@"updatedDate"]){
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
                NSDate *currentDate = [formatter dateFromString:string];
                [currentEntry setValue:currentDate forKey:currentVariable];
                NSLog(@"%@ added!", currentVariable);
                isForParsingStaged = NO;
            }
            else if([currentVariable isEqualToString:@"authorIconURL"]){
                NSData *downloadData = [NSData dataWithContentsOfURL: [NSURL URLWithString:string]];
                [currentEntry setValue:string forKey:currentVariable];
                NSLog(@"%@ added!", currentVariable);
                isAuthorParsingStaged = NO;
            }
            else if ([currentVariable isEqualToString:@"authorURL"] || [currentVariable isEqualToString:@"author"]) {
                [currentEntry setValue:string forKey:currentVariable];
                NSLog(@"%@ added!", currentVariable);
                isAuthorParsingStaged = NO;
            }
            else{
                [currentEntry setValue:string forKey:currentVariable];
                NSLog(@"%@ added!", currentVariable);
                isForParsingStaged = NO;
            }
        }
        else if(currentVariable != nil && isAuthorParsingStaged){
            [currentEntry setValue:string forKey:currentVariable];
            NSLog(@"%@ added!", currentVariable);
            isAuthorParsingStaged = NO;
        }
    }
}



- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"entry"]) {
        
        NSOperationQueue *queue = [NSOperationQueue new];
        
        NSBlockOperation *blockOperation = [NSBlockOperation
                                            blockOperationWithBlock:^{
                                               
                                                if (![managedObjectContext save:nil]) {
                                                    NSLog(@"Saving failed!");
                                                }
                                                else{
                                                    NSLog(@"Saving successful!");
                                                }
                                            }];
        
        [queue addOperation:blockOperation];
        
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    [self downloadingDataFinished];
    
}

#pragma mark CoreData iteractions

-(void)saveCurrentEntryToCoreData{
    
}

#pragma mark DataManager delegate

-(void)downloadingDataFinished{
        [self.delegate dataDidFinishFetching];
}

@end
