//
//  NELTaskController.h
//  tasks-objc
//
//  Created by Nelson Gonzalez on 3/27/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NELTask;

NS_ASSUME_NONNULL_BEGIN

@interface NELTaskController : NSObject


//Create a task

- (void)createTaskWithName:(NSString *)name notes: (NSString *)notes dueDate:(NSDate *)dueDate;

- (void)updateTask:(NELTask *)task withName:(NSString *)name notes: (NSString *)notes dueDate:(NSDate *)dueDate;

//Remove a task
- (void)removeTask:(NELTask *)task;





//An array of tasks
//How do we enforce MVC by only letting the task controller change this array of task?
//If the property is read only, we cant change it, so how do we add or remove tasks?

//the "public" tasks array. A mirror image of the internalTasks.
@property (nonatomic, readonly) NSArray *tasks;

@end

NS_ASSUME_NONNULL_END
