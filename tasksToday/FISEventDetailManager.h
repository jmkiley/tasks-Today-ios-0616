//
//  FISEventDetailManager.h
//  tasksToday
//
//  Created by Jordan Kiley on 6/21/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISViewController.h"
@interface FISEventDetailManager : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *allTheEvents;
@property (strong, nonatomic) NSMutableArray *allTheEventsText ;


@end
