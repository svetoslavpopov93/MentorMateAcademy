//
//  AllEventsCollectionViewController.m
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/23/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "AllEventsCollectionViewController.h"

@interface AllEventsCollectionViewController (){
    DataModelSingleton *dataModel;
    BOOL twoElementsModeSelected;
}

@end

@implementation AllEventsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    dataModel = [DataModelSingleton initSharedDataModel];
    twoElementsModeSelected = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return dataModel.events.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    long currentIndex = 0;
    if (twoElementsModeSelected) {
        currentIndex = (indexPath.section * 2) + indexPath.row;
    }
    else{
        currentIndex = (indexPath.section * 3) + indexPath.row;
    }
    if(currentIndex < dataModel.events.count){
        Event *selectedEvent = dataModel.events[currentIndex];
        
        cell.labelEventTitle.text = selectedEvent.eventLabel;
        cell.labelRelatedPerson.text = selectedEvent.relatedPerson;
        cell.labelInfo.text = selectedEvent.eventInfo;
        cell.imageEventCover.image = selectedEvent.eventCover;
        cell.labelHours.text = [NSString stringWithFormat: @"%0.1f", selectedEvent.hours];
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}



// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}
*/

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}


@end
