//
//  TTCustomEntryViewController.m
//  Time-Tracker
//
//  Created by Duc Ho on 1/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTCustomEntryViewController.h"
#import "Entry.h"
#import "TTProjectController.h"

@interface TTCustomEntryViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *inPicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *outPicker;

@end

@implementation TTCustomEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)save:(id)sender {
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    entry.timeIn = self.inPicker.date;
    entry.timeOut= self.inPicker.date;
    
//    [self.project addEntriesObject:entry];

    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
