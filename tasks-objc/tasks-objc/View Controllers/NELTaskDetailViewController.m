//
//  NELTaskDetailViewController.m
//  tasks-objc
//
//  Created by Nelson Gonzalez on 3/27/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELTaskDetailViewController.h"
#import "NELTaskController.h"
#import "NELTask.h"

@interface NELTaskDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;

@end

@implementation NELTaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateViews];
}

- (void)updateViews
{
    if (!self.isViewLoaded || !self.task) { return;}
    
    self.title = self.task.name;
    self.nameTextField.text = self.task.name;
    self.notesTextView.text = self.task.notes;
    self.dueDatePicker.date = self.task.dueDate;
}

- (IBAction)save:(id)sender {
    
    NSString *name = self.nameTextField.text;
    NSString *notes = self.notesTextView.text;
    NSDate *dueDate = self.dueDatePicker.date;
    
    if (!self.task) {
        //we are trying to save a new task
        [self.taskController createTaskWithName:name notes:notes dueDate:dueDate];
    } else {
        //we want top update the existing task
        
        [self.taskController updateTask:self.task withName:name notes:notes dueDate:dueDate];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

//setter for task
//You are responsible for setting the instance varibale value. (i.e _task)
- (void)setTask:(NELTask *)task
{
    //Anything in here before _task = task is the "willSet"
    if (task != _task) { //make sure the task we are trying to set is different, if they are the same there is no point in wasting time setting the same value.
    _task = task;
    //Anything here after _task = task is the "didSet"
    [self updateViews];
    }
}


@end
