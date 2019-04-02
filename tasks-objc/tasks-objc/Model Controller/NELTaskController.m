//
//  NELTaskController.m
//  tasks-objc
//
//  Created by Nelson Gonzalez on 3/27/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELTaskController.h"
#import "NELTask.h"
//extensions are annonymous categories. They serve the same purpose as extensions in swift. Generally used to extend your own classes

//Categories are generally used to extend classes you dont own generally.

//@interface NELTaskController (JSONConvertible)
//
//@end
//
//@implementation NELTaskController (JSONConvertible)
//
//
//@end


//EXTENSION

@interface NELTaskController ()
//implement in normal implementation below

//this is the "real" tasks array.
@property (nonatomic) NSMutableArray *internalTasks;

@end

@implementation NELTaskController



- (instancetype)init
{
    self = [super init];
    if (self) {
        //Create an empty mutable array
        _internalTasks = [[NSMutableArray alloc] init];
        
        //We dont need to initialize tasks (the one in the .h file)
    }
    return self;
}

- (void)createTaskWithName:(NSString *)name notes:(NSString *)notes dueDate:(NSDate *)dueDate
{
    NELTask *task = [[NELTask alloc] initWithName:name notes:notes dueDate:dueDate];
    [self.internalTasks addObject:task];
}

- (void)removeTask:(NELTask *)task
{
    [self.internalTasks removeObject:task];
}

- (void)updateTask:(NELTask *)task withName:(NSString *)name notes:(NSString *)notes dueDate:(NSDate *)dueDate
{
    task.name = name;
    task.notes = notes;
    task.dueDate = dueDate;
}


//Make the "computed property" for tasks

//Whenever anything accessess tasks, this method gets called to retreive its value.
- (NSArray *)tasks
{
    return self.internalTasks;
}


@end
