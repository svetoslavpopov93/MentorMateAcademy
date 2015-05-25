//
//  ViewController.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"entry"]) {
        Entry *newEntry = [[Entry alloc] init];
        newEntry.title = [attributeDict objectForKey: @"title"];
        newEntry.link = [attributeDict objectForKey:@"link"];
        NSLog(@"");
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
}

@end
