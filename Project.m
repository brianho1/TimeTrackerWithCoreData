//
//  Project.m
//  time-tracker-withCoredata
//
//  Created by Duc Ho on 2/1/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import "Project.h"
#import "Entry.h"
#import "Stack.h"

@implementation Project

@dynamic title;
@dynamic entries;


//- (void)addEntriesObject:(Entry *)value {
//    if (!value) {
//        return;
//    }
//    Entry *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
//    
//    newEntry = value;
//    [self synchronize];
//
//}
//- (void)removeEntriesObject:(Entry *)value {
//    [[Stack sharedInstance].managedObjectContext deleteObject:value];
//    
//    [self synchronize];
//
//}
//
//-(void)synchronize {
//    
//    [[Stack sharedInstance].managedObjectContext save:NULL];
//    
//}




@end
