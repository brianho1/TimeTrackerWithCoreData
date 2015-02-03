//
//  TTListViewController.m
//  Time-Tracker
//
//  Created by Duc Ho on 1/24/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTListViewController.h"
#import "TTViewControllerDataSource.h"
#import "TTDetailViewController.h"
#import "TTProjectController.h"

@interface TTListViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *projectTableView;
@property (strong, nonatomic) TTViewControllerDataSource *dataSource;
@end

@implementation TTListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.dataSource = [TTViewControllerDataSource new];
        [self.dataSource configureFechedResultsController];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *addProjectButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewProject)];
    self.navigationItem.rightBarButtonItem = addProjectButton;

    
    UITableView *projectTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    self.projectTableView = projectTableView;
    
    [self.view addSubview:self.projectTableView];
    
    self.projectTableView.delegate = self;
    self.projectTableView.dataSource = self.dataSource;
    [self.dataSource registerTableView:self.projectTableView];
 //   [self.dataSource configureFechedResultsController];


    //create a bar button on the view controller
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.projectTableView reloadData];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    TTDetailViewController *projectView = [TTDetailViewController new];
    // make sure to link project here
    projectView.project = self.dataSource.fetchedResultsController.fetchedObjects[indexPath.row];
    [self.navigationController pushViewController:projectView animated:YES];
}

-(void)addNewProject {
    // this runs when the bar button is click and push the subview to create a new project
    
//    Project *project = [Project new];
    Project *project = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];

//        [[TTProjectController sharedInstance] addProject:project];

    TTDetailViewController *dvc = [TTDetailViewController new];
    dvc.project = project;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
