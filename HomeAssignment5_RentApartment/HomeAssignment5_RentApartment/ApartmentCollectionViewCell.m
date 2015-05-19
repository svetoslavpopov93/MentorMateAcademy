//
//  ApartmentCollectionViewCell.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/15/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "ApartmentCollectionViewCell.h"

@implementation ApartmentCollectionViewCell

@synthesize imageViewImage = _imageViewImage;
@synthesize labelTitle =_labelTitle;
@synthesize labelApartmentType = _labelApartmentType;
@synthesize labelCity = _labelCity;
@synthesize labelCityQuarter = _labelCityQuarter;
@synthesize labelDetails = _labelDetails;
@synthesize labelPrice = _labelPrice;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.image = [[UIImageView alloc] init];
        self.title = [[NSString alloc] init];
        self.title = [[NSString alloc] init];
        self.price = [[NSString alloc] init];
        self.details = [[NSString alloc] init];
        self.cityQuarter = [[NSString alloc] init];
        self.city = [[NSString alloc] init];
        self.apartmentType = [[NSString alloc] init];
        
        
        
        
        
        self.imageViewImage = self.image;
        self.labelTitle.text = self.title;
        self.labelPrice.text = self.price;
        self.labelDetails.text = self.details;
        self.labelCityQuarter.text = self.cityQuarter;
        self.labelCity.text = self.city;
        self.labelApartmentType.text = self.apartmentType;
        
    }
    return self;
}



@end
