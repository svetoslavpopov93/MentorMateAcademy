//
//  EventHeaderReusableView.h
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/29/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventHeaderReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *labelSectionHeaderTitle;
@property(strong, nonatomic) NSString *headerText;
@end
