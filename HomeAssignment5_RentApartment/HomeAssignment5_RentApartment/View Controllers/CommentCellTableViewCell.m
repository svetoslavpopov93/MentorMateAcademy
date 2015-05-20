//
//  CommentCellTableViewCell.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/20/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "CommentCellTableViewCell.h"

@implementation CommentCellTableViewCell

@synthesize labelAuthor = _labelAuthor;
@synthesize labelDate = _labelDate;
@synthesize textFieldText = _textFieldText;

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
