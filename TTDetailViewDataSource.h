//
//  TTDetailViewDataSource.h
//  Time-Tracker
//
//  Created by Duc Ho on 1/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"
#import <UIKit/UIKit.h>


@interface TTDetailViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) Project * project;
-(void)configureFechedResultsController;
- (void)registerTableView:(UITableView *)tableView;



@end
