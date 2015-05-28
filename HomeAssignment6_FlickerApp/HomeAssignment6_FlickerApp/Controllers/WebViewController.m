//
//  WebViewController.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/28/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView=[[UIWebView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    [self.view addSubview:webView];
   
    NSURL *urlforWebView = self.currentURL;
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:urlforWebView];
    [webView loadRequest:urlRequest];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
