//
//  ApartmentCollectionViewCell.h
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/15/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApartmentCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewImage;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelApartmentType;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
@property (weak, nonatomic) IBOutlet UILabel *labelCityQuarter;
@property (weak, nonatomic) IBOutlet UILabel *labelDetails;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;

@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *apartmentType;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *cityQuarter;
@property (strong, nonatomic) NSString *details;
@property (strong, nonatomic) NSString *price;

@end
