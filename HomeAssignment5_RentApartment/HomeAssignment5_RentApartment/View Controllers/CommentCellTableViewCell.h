//
//  CommentCellTableViewCell.h
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/20/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelAuthor;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UITextView *textFieldText;

@end
