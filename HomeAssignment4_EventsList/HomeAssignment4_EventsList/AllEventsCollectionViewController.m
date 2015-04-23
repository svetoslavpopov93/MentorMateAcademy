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
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    dataModel = [DataModelSingleton initSharedDataModel];
    twoElementsModeSelected = true;
    
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"MM/dd/yyyy";
    NSDate *d = [mmddccyy dateFromString:@"11/08/2004"];
    
    [dataModel.events addObject:[[Event alloc] initWithEventLabel:@"Test3" relatedPerson:@"Test3" hours:3 eventInfo:@"vvvvvvvvvvv" eventDate:d]];
    [dataModel.events addObject:[[Event alloc] initWithEventLabel:@"Test4" relatedPerson:@"Test4" hours:6 eventInfo:@"ddddddddddd" eventDate:d]];
    [dataModel.events addObject:[[Event alloc] initWithEventLabel:@"Test5" relatedPerson:@"Test5" hours:1 eventInfo:@"ssssssssssss" eventDate:d]];
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    int count = (int)dataModel.events.count;
    
    if(twoElementsModeSelected){
        if (count % 2 == 0) {
            return count / 2;
        }
        else{
            return (count / 2) + 1;
        }
    }
    else{
        if (count % 3 == 0) {
            return count / 3;
        }
        else{
            return (count / 3) + 1;
        }
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (twoElementsModeSelected) {
        return 2;
    }
    else{
        return 3;
    }
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

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
