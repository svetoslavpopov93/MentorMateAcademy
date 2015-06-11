//
//  CustomView.m
//  ClassAssignment18_Scrabble
//
//  Created by Student17 on 6/2/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(detectPan:)];
        self.gestureRecognizers = @[panRecognizer];
        
        // randomize view color
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        
        self.backgroundColor = color;
    }
    return self;
}

- (void) detectPan:(UIPanGestureRecognizer *) uiPanGestureRecognizer
{
    CGPoint translation = [uiPanGestureRecognizer translationInView:self.superview];
    self.center = CGPointMake(lastLocation.x + translation.x,
                              lastLocation.y + translation.y);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Promote the touched view
    [self.superview bringSubviewToFront:self];
    
    // Remember original location
    lastLocation = self.center;
}
@end
