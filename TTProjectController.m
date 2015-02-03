//
//  TTProjectController.m
//  Time-Tracker
//
//  Created by Duc Ho on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTProjectController.h"

static NSString *const projectListKey = @"ProjectList";

@interface TTProjectController()

@property (strong, nonatomic) NSArray * projets;

@end

@implementation TTProjectController


+ (TTProjectController *)sharedInstance {
    static TTProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TTProjectController alloc] init];
        
//        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

-(void)setProjets:(NSArray *)projets {
    _projets = projets;
    [self synchronize];
}

-(void)addProject:(Project *)project {    // adding a new project to the array here
    
    if (!project) {
        return;
    }
//    
//    NSMutableArray *p = [[NSMutableArray alloc] initWithArray:self.projets];
//    [p addObject:project];
//    
//    self.projets = p;
//    
    Project *newProject = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    newProject = project;
    [self synchronize];

}

-(void)removeProject:(Project *)project {
    if (!project) {
        return;
    }
    
    [[Stack sharedInstance].managedObjectContext deleteObject:project];
    [self synchronize];

}

//-(void)loadFromDefaults {
//    NSArray *projectDict = [[NSUserDefaults standardUserDefaults] objectForKey:projectListKey];
//
//    NSMutableArray *projects = [NSMutableArray new];
//    
//    for (NSDictionary *project in projectDict) {
//        [projects addObject:[[Project alloc] initWithDictionary:project]];
//    }
//    
//    _projets = projects;
//}

-(void)synchronize {
//    NSLog(@"how many times does this get called on launch");
//    NSMutableArray *a = [NSMutableArray array];
//    
//    for (Project *project in self.projets) {
//        [a addObject:[project projectDictionary]];
//    }
//    [[NSUserDefaults standardUserDefaults] setObject:a forKey:projectListKey];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[Stack sharedInstance].managedObjectContext save:NULL];

}

@end

