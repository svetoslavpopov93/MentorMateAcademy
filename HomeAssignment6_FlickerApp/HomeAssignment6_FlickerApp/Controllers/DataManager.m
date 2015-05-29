//
//  DataManager.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "DataManager.h"

#import "CoreDataManager.h"

static DataManager *sharedDataManager;
static NSOperationQueue *sharedQueue;

@implementation DataManager{
    NSMutableArray *downloadedEntries;
    NSMutableDictionary *currentEntry;
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
        downloadedEntries = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma mark SharedOperationQueue
/**
 *  Shares one operation queue in the entire application, so the app will not create new Queue every time when is needed
 *
 *  @return NSOperationQueue
 */
+(NSOperationQueue*)sharedOperationQueue{
    @synchronized(self){
        if (sharedQueue == nil) {
            sharedQueue = [NSOperationQueue new];
        }
    }
    return sharedQueue;
}

#pragma mark Fetching data from the Flickr api
/**
 *  Performs request to the flickr api. The data is downloaded in XML format and it is pushed to the XML parser.
 */
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
        currentEntry = [[NSMutableDictionary alloc] init];
    }
    else if(currentEntry != nil){
        if ([elementName isEqualToString:@"title"]) {
            currentVariable = @"title";
            isForParsingStaged = YES;
        }
        else if ([elementName isEqualToString:@"link"] && [[attributeDict objectForKey:@"rel"] isEqualToString:@"alternate"]){
            [currentEntry setValue:[attributeDict objectForKey:@"href"] forKey:@"link"];
        }
        else if ([elementName isEqualToString:@"link"] && [[attributeDict objectForKey:@"rel"] isEqualToString:@"enclosure"]){
            [currentEntry setValue:[attributeDict objectForKey:@"href"] forKey:@"mainImageURL"];
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
        else if([elementName isEqualToString:@"flickr:buddyicon"]){
            currentVariable = @"authorIconURL";
            isAuthorParsingStaged = YES;
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (currentEntry != nil) {
        /**
         *  Checks the child tags of Entry
         */
        if (currentVariable != nil && isForParsingStaged) {
            if([currentVariable isEqualToString:@"publishedDate"] || [currentVariable isEqualToString:@"updatedDate"]){
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
                NSDate *currentDate = [formatter dateFromString:string];
                [currentEntry setValue:currentDate forKey:currentVariable];
                NSLog(@"%@ added!", currentVariable);
                isForParsingStaged = NO;
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
        /**
         *  Checks the child tags of Entry's author
         *
         *  @param isAuthorParsingStaged manages the
         *
         *  @return <#return value description#>
         */
        else if(currentVariable != nil && isAuthorParsingStaged){
            if([currentVariable isEqualToString:@"authorIconURL"]){
                [currentEntry setValue:string forKey:@"authorIconURL"];
                NSLog(@"%@ added!", currentVariable);
                
                isAuthorParsingStaged = NO;
            }
            else{
            [currentEntry setValue:string forKey:currentVariable];
                NSLog(@"%@ added!", currentVariable);
                isAuthorParsingStaged = NO;
            }
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"entry"]) {
        
        [downloadedEntries addObject:currentEntry];
        currentEntry = nil;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    self.entries = downloadedEntries;
    [self downloadingDataFinished];
    
}

#pragma mark DataManager delegate

-(void)downloadingDataFinished{
    [[CoreDataManager sharedManager] insertEntries:self.entries];
    //[self.delegate dataDidFinishFetching];
}

-(void)imageClicked: (NSURL*)url{
    [self.delegate userDidTapOnImageWithURL:url];
}

@end
