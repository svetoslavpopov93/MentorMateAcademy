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
@property (strong, nonatomic) IBOutlet UICollectionView *collectonViewAllEvents;
@property (weak, nonatomic) IBOutlet CustomCollectionViewCell *customCell;
@property (nonatomic) CGFloat ratioForCellWidth;

@end

@implementation AllEventsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.ratioForCellWidth = 0.31;
    dataModel = [DataModelSingleton initSharedDataModel];
    twoElementsModeSelected = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setToolbarHidden:NO animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setToolbarHidden:YES animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return dataModel.events.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    
    if (twoElementsModeSelected) {
        //cell.frame.size.width = 170;
        //cell.layer.frame = CGRectMake(10, 10, 170, 200); //CGSizeMake(110, 200);
    }
    else{
        
    }
        Event *selectedEvent = dataModel.events[indexPath.row];
        
        cell.labelEventTitle.text = selectedEvent.eventLabel;
        cell.labelRelatedPerson.text = selectedEvent.relatedPerson;
        cell.labelInfo.text = selectedEvent.eventInfo;
        cell.imageEventCover.image = selectedEvent.eventCover;
        cell.labelHours.text = [NSString stringWithFormat: @"%0.1f", selectedEvent.hours];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(collectionView.frame) * self.ratioForCellWidth, 175);
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    // Do view manipulation here.
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self.collectonViewAllEvents reloadData];
}

//- (void)updateCollectionViewLayoutWithSize:(CGSize)size {
//    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
//    
//    layout.itemSize = (size.width < size.height) ? CGSizeMake(180, 160) : CGSizeMake(320, 180);
//    [layout invalidateLayout];
//}
#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}


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
    
    CustomCollectionViewCell *currentCell = (CustomCollectionViewCell*)sender;
    NSLog(@"%@", currentCell.labelEventTitle.text);
	return YES;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    CustomCollectionViewCell *currentCell = (CustomCollectionViewCell*)sender;
    NSLog(@"%@", currentCell.labelEventTitle.text);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    dataModel.selectedEvent = dataModel.events[indexPath.row];
    UIViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailsVC"];
    [self.navigationController pushViewController:detailsVC animated:YES];
}

#pragma mark Bottom and Navigation toolbars

- (IBAction)buttonActionChangeColumnMode:(id)sender {
    
    if (twoElementsModeSelected) {
        self.ratioForCellWidth = 0.31;
        twoElementsModeSelected = false;
    }
    else{
        self.ratioForCellWidth = 0.47;
        twoElementsModeSelected = true;
    }
    
    [self.collectonViewAllEvents reloadData];
    NSLog(@"reloaded");
}

- (IBAction)buttonActionAddNewEvent:(id)sender {
    NSLog(@"Add event button clicked!");
}


@end
