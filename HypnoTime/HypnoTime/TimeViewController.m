//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Eric Kim on 11/30/12.
//  Copyright (c) 2012 Eric Kim. All rights reserved.
//

#import "TimeViewController.h"

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
