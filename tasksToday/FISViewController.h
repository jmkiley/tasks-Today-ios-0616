//
//  FISViewController.h
//  tasksToday
//
//  Created by Joe Burgess on 6/19/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import "FISEventDetailManager.h"

@interface FISViewController : UIViewController

@property (nonatomic, strong) NSDateComponents *lastYear ;
@property (nonatomic, strong) NSDateComponents *nextYear;
@property (nonatomic, strong) EKEventStore *store ;
@property (nonatomic) BOOL
accessGranted ;

@property (strong, nonatomic) IBOutlet UIButton *nextYearButton;
@property (strong, nonatomic) IBOutlet UIButton *lastYearButton;

- (NSArray *)getNextYearsEvents;
- (NSArray *)getLastYearsEvents;
- (void)requestCalendarPermission;

//- (void)requestAccessToEvents;

@end
