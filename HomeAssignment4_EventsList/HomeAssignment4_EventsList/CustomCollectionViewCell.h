//
//  CustomCollectionViewCell.h
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/23/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelEventTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageEventCover;
@property (weak, nonatomic) IBOutlet UILabel *labelRelatedPerson;
@property (weak, nonatomic) IBOutlet UILabel *labelHours;
@property (weak, nonatomic) IBOutlet UILabel *labelInfo;

@end
