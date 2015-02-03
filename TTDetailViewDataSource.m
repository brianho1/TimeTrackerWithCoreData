//
//  TTDetailViewDataSource.m
//  Time-Tracker
//
//  Created by Duc Ho on 1/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTDetailViewDataSource.h"
#import "TTProjectController.h"
#import "Entry.h"

@interface TTDetailViewDataSource() <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) UITableView* tableView;

@end

@implementation TTDetailViewDataSource 

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView = tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultsController.fetchedObjects.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }

//    NSManagedObjectContext *context = self.project.managedObjectContext;

    Entry *entry = self.fetchedResultsController.fetchedObjects[indexPath.row];

    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", entry.timeIn, entry.timeOut];
//    entry = self.project.entries[indexPath.row];
//    NSLog(@"%@",entry.timeIn);
//    cell.textLabel.text = [NSString stringWithFormat:@"%d - %d", 1, 1];

    return cell;

}

-(void)configureFechedResultsController {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"timeIn" ascending:NO]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"project == %@",self.project]];
    //    NSArray * entries = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[Stack sharedInstance].managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    self.fetchedResultsController.delegate = self;
    [self.fetchedResultsController performFetch:nil];
}


#pragma mark - fetched results conrtoller delegate


- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        default:
            break;
    }
}


@end
