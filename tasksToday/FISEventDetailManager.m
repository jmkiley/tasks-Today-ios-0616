//
//  FISEventDetailManager.m
//  tasksToday
//
//  Created by Jordan Kiley on 6/21/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISEventDetailManager.h"

@implementation FISEventDetailManager

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allTheEvents.text = [self.allTheEventsText componentsJoinedByString:@"\n"];
//    self.allTheEvents.text = ;
}
@end
