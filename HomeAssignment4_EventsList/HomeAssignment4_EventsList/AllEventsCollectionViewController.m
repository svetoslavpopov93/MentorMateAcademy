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
    NSArray *allDays;
}

@property (strong, nonatomic) IBOutlet UICollectionView *collectonViewAllEvents;
@property (weak, nonatomic) IBOutlet CustomCollectionViewCell *customCell;
@property (nonatomic) CGFloat ratioForCellWidth;

@end

@implementation AllEventsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseHeaderIdentifier = @"eventHeader";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    dataModel = [DataModelSingleton initSharedDataModel];
    
    allDays = [[NSArray alloc] init];
    allDays = dataModel.days.allKeys;
    
    self.ratioForCellWidth = 0.31;
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

#pragma mark Collection view methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return allDays.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSMutableArray *elementsInCurrentSection = dataModel.days[allDays[section]];
    
    return elementsInCurrentSection.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    NSMutableArray *currentSectionEvents = dataModel.days[allDays[indexPath.section]];
    
    Event *selectedEvent = currentSectionEvents[indexPath.row];
    
    cell.labelEventTitle.text = selectedEvent.eventLabel;
    cell.labelRelatedPerson.text = selectedEvent.relatedPerson;
    cell.labelInfo.text = selectedEvent.eventInfo;
    cell.imageEventCover.image = selectedEvent.eventCover;
    cell.labelHours.text = [NSString stringWithFormat: @"%0.1f", selectedEvent.hours];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    EventHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                           UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeaderIdentifier forIndexPath:indexPath];
    
    headerView.labelSectionHeaderTitle.text = allDays[indexPath.section];
    
    return headerView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(collectionView.frame) * self.ratioForCellWidth, 205);
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self.collectonViewAllEvents reloadData];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *currentSection = dataModel.days[allDays[indexPath.section]];
    
    dataModel.selectedEvent = currentSection[indexPath.row];
    UIViewController *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailsVC"];
    [self.navigationController pushViewController:detailsVC animated:YES];
}

#pragma mark Button action methods

- (IBAction)buttonActionChangeColumnMode:(id)sender {
    UIBarButtonItem *barBtn = sender;
    
    if (twoElementsModeSelected) {
        self.ratioForCellWidth = 0.31;
        barBtn.title = @"3 Column Mode";
        twoElementsModeSelected = false;
    }
    else{
        self.ratioForCellWidth = 0.47;
        barBtn.title = @"2 Column Mode";
        twoElementsModeSelected = true;
    }
    
    [self.collectonViewAllEvents reloadData];
    NSLog(@"reloaded");
}

- (IBAction)buttonActionAddNewEvent:(id)sender {
    
    UIViewController *addEventVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addEventVC"];
    [self.navigationController pushViewController:addEventVC animated:YES];
    
}


@end
