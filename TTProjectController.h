//
//  TTProjectController.h
//  Time-Tracker
//
//  Created by Duc Ho on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"
#import "Stack.h"

@interface TTProjectController : NSObject


@property (nonatomic, strong, readonly) NSArray *projets;


+ (TTProjectController *)sharedInstance;

-(void)addProject:(Project *)projects;
-(void)removeProject:(Project *)project;
-(void)setProjets:(NSArray *)projet;
-(void)synchronize;


@end
