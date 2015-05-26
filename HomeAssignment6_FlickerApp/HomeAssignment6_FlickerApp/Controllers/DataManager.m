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
    Entry *currentEntry;
    NSString *currentVariable;
    BOOL isForParsingStaged;
    Author *currentAuthor;
    BOOL isAuthorParsingStaged;
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
    }
    
    return self;
}

-(void)fetchFlickrFeed{
    isForParsingStaged = NO;
    isAuthorParsingStaged = NO;
    
    NSString *flickrURL =@"https://api.flickr.com/services/feeds/photos_public.gne";
    
    NSURLSessionConfiguration *sessionConfoguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfoguration delegate:nil delegateQueue:nil];
    
    NSURLSessionDataTask *xmlTask = [session dataTaskWithURL:[NSURL URLWithString:flickrURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"Done!");
        
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        parser.delegate = self;
        [parser parse];
    }];
    
    [xmlTask resume];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"entry"]) {
        currentEntry = [[Entry alloc] init];
        
        NSLog(@"");
    }
    else if(currentEntry != nil){
        if ([elementName isEqualToString:@"title"]) {
            currentVariable = @"titleString";
            isForParsingStaged = YES;
        }
        else if ([elementName isEqualToString:@"link"]){
            currentEntry.linkString = [attributeDict objectForKey:@"href"];
        }
        else if([elementName isEqualToString:@"id"]){
            currentVariable = @"entryIDString";
            isForParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"published"]){
            currentVariable = @"publishedString";
            isForParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"updated"]){
            currentVariable = @"updatedString";
            isForParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"name"]){
            currentVariable = @"authorString";
            isAuthorParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"uri"]){
            currentVariable = @"authorURLString";
            isAuthorParsingStaged = YES;
        }
        else if([elementName isEqualToString:@"flickr:buddyicon"]){
            currentVariable = @"iconURLString";
            isAuthorParsingStaged = YES;
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (currentEntry != nil) {
        if (currentVariable != nil && isForParsingStaged) {
            [currentEntry setValue:string forKey:currentVariable];
            NSLog(@"%@ added!", currentVariable);
            isForParsingStaged = NO;
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
        [currentEntry initWithStrings];
        [self.entries addObject:currentEntry];
    }
    
    NSLog(@"");
}

@end
