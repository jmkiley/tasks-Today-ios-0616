//
//  FISViewController.m
//  tasksToday
//
//  Created by Joe Burgess on 6/19/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import <EventKit/EventKit.h>
#import "FISEventDetailManager.h"

@interface FISViewController ()

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self requestCalendarPermission];
    [self getLastYearsEvents];
    [self getNextYearsEvents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestCalendarPermission {
    EKEventStore *store = [[EKEventStore alloc] init];
    [ store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error){
        
    }];
}

- (NSArray *)getNextYearsEvents {
    EKEventStore *store = [[EKEventStore alloc] init];
    
    NSCalendar *calendar = [ NSCalendar currentCalendar];
    
    NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc]init];
    oneYearFromNowComponents.year = 1;
    NSDate *oneYearFromNow = [ calendar dateByAddingComponents:oneYearFromNowComponents toDate:[NSDate date] options:0];
    
    NSPredicate *predicate = [ store predicateForEventsWithStartDate:[NSDate date] endDate:oneYearFromNow calendars:nil];
    
    NSArray *events = [ store eventsMatchingPredicate:predicate];
    return events;
}
- (NSArray *)getLastYearsEvents  {
    EKEventStore *store = [[EKEventStore alloc] init];
    
    NSCalendar *calendar = [ NSCalendar currentCalendar];
    
    NSDateComponents *oneYearAgoComponents = [[NSDateComponents alloc]init];
    oneYearAgoComponents.year = -1;
    NSDate *oneYearAgo = [ calendar dateByAddingComponents:oneYearAgoComponents toDate:[NSDate date] options:0];
    
    NSPredicate *predicate = [ store predicateForEventsWithStartDate:oneYearAgo endDate:[NSDate date] calendars:nil];
    
    NSArray *events = [ store eventsMatchingPredicate:predicate];
    return events;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FISEventDetailManager *transferInformation = segue.destinationViewController;
    if ([segue.identifier isEqualToString: @"nextYear"]) {
        learn NSArray *events = [ self getNextYearsEvents];
        transferInformation.allTheEventsText = [ [ NSMutableArray alloc] init];
        for (EKEvent *event in events) {
            if ( [ event valueForKey:@"title"]) {
                [ transferInformation.allTheEventsText addObject:[ event valueForKey:@"title"]];
            }
        }
    } else if ([segue.identifier isEqualToString:@"lastYear"]) {
        NSArray *events = [ self getLastYearsEvents];
        transferInformation.allTheEventsText = [ [ NSMutableArray alloc] init];
        for (EKEvent *event in events) {
            if ( [ event valueForKey:@"title"]) {
            [ transferInformation.allTheEventsText addObject:[ event valueForKey:@"title"]];
            }
        }
    }
}
@end
//- (NSArray *)getNextYearsEvents {
////    [ self requestCalendarPermission];
//    NSCalendar *calendar = [ NSCalendar currentCalendar];
//    self.nextYear = [ [ NSDateComponents alloc] init];
//    self.nextYear.year = 1 ;
//
//    NSDate *aYearFromNow = [ calendar dateByAddingComponents:self.nextYear toDate:[NSDate date] options:0];
//
//    NSPredicate *filterNextYearsEvents = [ self.store predicateForEventsWithStartDate:[ NSDate date] endDate:aYearFromNow calendars:nil];
//
//    NSArray *arrayOfNextYearsEvents = [ self.store eventsMatchingPredicate:filterNextYearsEvents];
//    return arrayOfNextYearsEvents;
//}
//
//- (NSArray *)getLastYearsEvents {
////    [ self requestCalendarPermission];
//    NSCalendar *calendar = [ NSCalendar currentCalendar];
//    self.lastYear = [[ NSDateComponents alloc] init];
//    self.lastYear.year = -1;
//    NSDate *aYearAgo = [ calendar dateByAddingComponents:self.lastYear toDate:[NSDate date] options:0];
//
//    NSPredicate *filterLastYearsEvents = [ self.store predicateForEventsWithStartDate:aYearAgo endDate:[NSDate date] calendars:nil];
//
//    NSArray *arrayOfLastYearsEvents = [ self.store eventsMatchingPredicate:filterLastYearsEvents];
//    return arrayOfLastYearsEvents;
//
//}
//- (void)requestCalendarPermission {
//    self.store = [ [ EKEventStore alloc] init];
//    [ self.store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
//        if (!granted) return;
//
//    }];
//
//}


