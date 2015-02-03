//
//  TTDetailViewController.m
//  Time-Tracker
//
//  Created by Duc Ho on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTDetailViewController.h"
#import "TTCustomEntryViewController.h"
#import "TTDetailViewDataSource.h"
#import "TTProjectController.h"
#import "Stack.h"

@interface TTDetailViewController () <UITextFieldDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *projectTextField;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *timeTableView;


@property (strong, nonatomic) TTDetailViewDataSource *datasource;

@end

@implementation TTDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.datasource = [TTDetailViewDataSource new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.projectTextField.text = self.project.title;
    self.projectTextField.delegate = self;
    
    self.timeTableView.dataSource = self.datasource;
    [self.datasource registerTableView:self.timeTableView];
    self.datasource.project = self.project;
    [self.datasource configureFechedResultsController];

    
}

-(void)viewWillDisappear:(BOOL)animated {
    
//    [[TTProjectController sharedInstance] synchronize];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.timeTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.project.title = textField.text;
    [[TTProjectController sharedInstance] synchronize];
    return YES;
}

- (IBAction)addButton:(id)sender {
    
    TTCustomEntryViewController *customView = [TTCustomEntryViewController new];
    customView.project = self.project;
    [self presentViewController:customView animated:YES completion:nil];
    
    
}



- (IBAction)clockIn:(id)sender {
}

- (IBAction)clockOut:(id)sender {
}

- (IBAction)report:(id)sender {
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
