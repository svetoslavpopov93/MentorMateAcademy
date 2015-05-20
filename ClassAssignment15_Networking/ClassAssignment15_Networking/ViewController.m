//
//  ViewController.m
//  ClassAssignment15_Networking
//
//  Created by Student17 on 5/20/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelCountry;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
@property (weak, nonatomic) IBOutlet UILabel *labelWeatherConditions;
@property (weak, nonatomic) IBOutlet UILabel *labelPresure;
@property (weak, nonatomic) IBOutlet UILabel *labelWindDeg;
@property (weak, nonatomic) IBOutlet UILabel *labelWindSpeed;
@property (weak, nonatomic) IBOutlet UILabel *labelHumidity;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url = @"http://api.openweathermap.org/data/2.5/weather?q=Sofia,bg";
    NSURLSessionConfiguration *sessionConfig =
    [NSURLSessionConfiguration defaultSessionConfiguration];
    [sessionConfig setHTTPAdditionalHeaders:
     @{@"Accept": @"application/json"}];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self
                                                     delegateQueue:nil];
    
    NSURLSessionDownloadTask *getImageTask =
    [session dataTaskWithURL:[NSURL URLWithString:url]
               completionHandler:^(NSData *data,
                                   NSURLResponse *response,
                                   NSError *error) {
                   
                   NSError *jsonError;
                   NSJSONSerialization *responseContent = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
                   
                   NSDictionary *main = [responseContent valueForKey:@"main"];
                   
                   
                   dispatch_async(dispatch_get_main_queue(), ^{
                       self.labelCity.text = [responseContent valueForKey:@"name"];
                       
                   });
               }];
    // 4
    [getImageTask resume];
    
    [self getDataFrom:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) getDataFrom:(NSString *)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
        return nil;
    }
    
    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}
@end
