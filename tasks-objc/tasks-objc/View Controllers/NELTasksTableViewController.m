//
//  NELTasksTableViewController.m
//  tasks-objc
//
//  Created by Nelson Gonzalez on 3/27/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELTasksTableViewController.h"
#import "NELTaskController.h"
#import "NELTask.h"
#import "NELTaskDetailViewController.h"

@interface NELTasksTableViewController ()

@property (nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation NELTasksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: YES];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.taskController.tasks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    
    NELTask *task = self.taskController.tasks[indexPath.row];
    
    cell.textLabel.text = task.name;
    cell.detailTextLabel.text = [self.dateFormatter stringFromDate:task.dueDate];
   
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NELTask *task = self.taskController.tasks[indexPath.row];
        
        [self.taskController removeTask:task];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([segue.identifier isEqualToString:@"ShowTaskDetail"]) {
        //Passing the task and task controller
        NELTaskDetailViewController *destinationVC = segue.destinationViewController;
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        destinationVC.taskController = self.taskController;
        destinationVC.task = self.taskController.tasks[indexPath.row];
    } else if ([segue.identifier isEqualToString:@"ShowCreateTask"]) {
        
        //Create a task only need task controller.
        NELTaskDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.taskController = self.taskController;
    }
}


//MARK: - Properties
//Create a get and set for the task controller so you dont have to create an initializer.
@synthesize taskController = _taskController;

//the getter for taskController
- (NELTaskController *)taskController
{
    if (!_taskController) {
        _taskController = [[NELTaskController alloc] init];
    }
    return _taskController;
}

@synthesize dateFormatter = _dateFormatter;

- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.timeStyle = NSDateFormatterShortStyle;
        _dateFormatter.dateStyle = NSDateFormatterShortStyle;
    }
    return _dateFormatter;
}

@end
