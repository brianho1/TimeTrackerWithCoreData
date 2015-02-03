//
//  TTViewControllerDataSource.h
//  Time-Tracker
//
//  Created by Duc Ho on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Stack.h"


@interface TTViewControllerDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

- (void)registerTableView:(UITableView *)tableView;

-(void)configureFechedResultsController;



@end
