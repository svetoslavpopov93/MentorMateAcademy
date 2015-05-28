
//
//  FlickrTableViewCell.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/26/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "FlickrTableViewCell.h"

@interface FlickrTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIButton *authorButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewMainImage;
@property (nonatomic) NSURL *url;
@property (nonatomic, strong) NSURL *imagePostURL;
@property (nonatomic, weak) UIWebView *webView;

@end

@implementation FlickrTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)prepareForReuse{
    [super prepareForReuse];
    
    self.labelTitle.text = @"";
    self.authorButton.titleLabel.text = @"";
    self.imageViewMainImage.image = nil;
}

- (void)setCellEntry:(CellEntry *)cellEntry {
    _cellEntry = cellEntry;
    self.labelTitle.text = self.cellEntry.title;
    [self setUrl:[NSURL URLWithString:self.cellEntry.mainImage]];
    
    // Set the gesture recognition for the image to enable tap on it
    self.imageViewMainImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped)];
    [self.self.imageViewMainImage addGestureRecognizer:tap];
    self.imagePostURL = [NSURL URLWithString:cellEntry.link];
    
    // Set button title and size
    [self.authorButton setTitle: self.cellEntry.author forState: UIControlStateNormal];
    [self.authorButton sizeToFit];
}

-(void)imageTapped{
    [[DataManager sharedDataManager] imageClicked:self.imagePostURL];
}

- (void)fetchImageFromUrl:(NSURL *)url {
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session =  [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil delegateQueue:nil];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                self.imageViewMainImage.image = [UIImage imageWithData:data];
                                            });
                                        }];
    
    [task resume];
}

- (void)setUrl:(NSURL *)url {
    _url = url;
    
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(fetchImageFromUrl:) object:url];
    
    NSOperationQueue *queue = [DataManager sharedOperationQueue];
    
    [queue addOperation:operation];
}

@end
