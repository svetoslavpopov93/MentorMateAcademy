//
//  ViewController.m
//  ClassAssignment18_Scrabble
//
//  Created by Student17 on 6/2/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *playground;
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;

@end

@implementation ViewController{
    NSMutableArray *arr;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addBoxes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addBoxes{
    int currentIndex = 10;
   
    
    NSNumber *elementIndex = [NSNumber numberWithInt:currentIndex];
    [arr addObject: elementIndex];
    
    CustomView *wordA = [[CustomView alloc] initWithFrame: CGRectMake ( 10, 10, 50, 50)];
    wordA.backgroundColor = [UIColor blueColor];
    [arr addObject:wordA];
    
    [self.playground addSubview:wordA];
}

-(void)moveElement{
    
}

- (IBAction)reset:(id)sender {
    for (long i = 0; i < self.playground.subviews.count; i++) {
        [[self.playground.subviews objectAtIndex:i] setFrame:CGRectMake((int)[arr objectAtIndex:i], 10, 50, 50)];
    }
}

//UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//[button addTarget:self action:@selector(imageTouch:withEvent:) forControlEvents:UIControlEventTouchDown];
//[button addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
//[button setImage:[UIImage imageNamed:@"vehicle.png"] forState:UIControlStateNormal];
//[self.view addSubview:button];


//
//UITapGestureRecognizer *singleFingerTap =
//[[UITapGestureRecognizer alloc] initWithTarget:self
//                                        action:@selector(handleSingleTap:)];
//[self.view addGestureRecognizer:singleFingerTap];
//[singleFingerTap release];
//
////The event handling method
//- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
//    CGPoint location = [recognizer locationInView:[recognizer.view superview]];


@end
