//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Eric Kim on 11/30/12.
//  Copyright (c) 2012 Eric Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController {
    __weak IBOutlet UILabel *timeLabel;
}

- (IBAction)showCurrentTime:(id)sender;
- (void)spinTimeLabel;
- (void)bounceTimeLabel;

@end
