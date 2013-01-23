//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Eric Kim on 11/30/12.
//  Copyright (c) 2012 Eric Kim. All rights reserved.
//

#import "TimeViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation TimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //self = [super initWithNibName:nil bundle:nil];
    NSBundle *appBundle = [NSBundle mainBundle];
    self = [super initWithNibName:@"TimeViewController" bundle:appBundle];
    
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        tbi.title = @"Time";
        tbi.image = [UIImage imageNamed:@"Time.png"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    NSLog(@"TimeViewController loaded its view");
}

- (IBAction)showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    timeLabel.text = [formatter stringFromDate:now];
    
    //[self spinTimeLabel];
    [self bounceTimeLabel];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%@ finished: %d", anim, flag);
}

- (void)bounceTimeLabel
{
    // Create an animation
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    // Setup values to pass through
    CATransform3D forward = CATransform3DMakeScale(1.3, 1.3, 1);
    CATransform3D back = CATransform3DMakeScale(.7, .7, 1);
    CATransform3D forward2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D back2 = CATransform3DMakeScale(.9, .9, 1);
    
    [bounce setValues:[NSArray arrayWithObjects:
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:forward],
                       [NSValue valueWithCATransform3D:back],
                       [NSValue valueWithCATransform3D:forward2],
                       [NSValue valueWithCATransform3D:back2],
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       nil]];
    
    [bounce setDuration:0.6];
    
    [timeLabel.layer addAnimation:bounce forKey:@"bounceAnimation"];
    
}

- (void)spinTimeLabel
{
    // Create an animation object
    CABasicAnimation *spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [spin setDelegate:self];
    [spin setToValue:[NSNumber numberWithFloat:2.0 * M_PI]];
    [spin setDuration:1.0];
    
    // Set the timing function to ease in/out
    CAMediaTimingFunction *tf = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [spin setTimingFunction:tf];
    
    // Kick off the animation by adding it to the layer
    [timeLabel.layer addAnimation:spin forKey:@"spinAnimation"];
}

/*
- (void)viewDidUnload
{
    [super viewDidUnload];
    
    //NSLog(@"Unloading TimeViewController's subviews");
    //timeLabel = nil;
    
    NSLog(@"timeLabel = %@", timeLabel);
}
 */ //not needed after making timeLabel a weak reference

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"TimeViewController will appear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"TimeViewController will disappear");
    [super viewWillDisappear:animated];
}

@end
