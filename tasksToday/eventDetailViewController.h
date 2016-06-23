//
//  eventDetailViewController.h
//  tasksToday
//
//  Created by Jordan Kiley on 6/21/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@interface eventDetailViewController : UIViewController

@property (strong, nonatomic) EKEventStore *eventStore ;
@end
