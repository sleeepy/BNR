//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Eric Kim on 11/30/12.
//  Copyright (c) 2012 Eric Kim. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"


@implementation HypnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        tbi.title = @"Hypnosis";
        tbi.image = [UIImage imageNamed:@"Hypno.png"];
    }
    
    return self;
}

- (void)loadView
{
    // Create view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    // Set as "the" view
    [self setView:v];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view");
}

@end
