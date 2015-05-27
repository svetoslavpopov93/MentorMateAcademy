
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
@property (weak, nonatomic) IBOutlet UILabel *labelAuthor;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewMainImage;

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
    self.labelAuthor.text = @"";
    self.imageViewMainImage.image = nil;
}

- (void)setCellEntry:(CellEntry *)cellEntry {
    _cellEntry = cellEntry;
    self.labelTitle.text = self.cellEntry.title;
    self.labelAuthor.text = self.cellEntry.author;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.cellEntry.mainImage]];
        self.imageViewMainImage.image = [UIImage imageWithData:data];
        NSLog(@"Data is set!");
    });

}

@end
