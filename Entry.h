//
//  Entry.h
//  time-tracker-withCoredata
//
//  Created by Duc Ho on 2/1/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Project;

@interface Entry : NSManagedObject

@property (nonatomic, retain) NSDate * timeIn;
@property (nonatomic, retain) NSDate * timeOut;
@property (nonatomic, retain) Project *project;

@end
