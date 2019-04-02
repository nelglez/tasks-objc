//
//  NELTasksTableViewController.h
//  tasks-objc
//
//  Created by Nelson Gonzalez on 3/27/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NELTaskController;
@interface NELTasksTableViewController : UITableViewController


@property (nonatomic) NELTaskController *taskController;


@end

NS_ASSUME_NONNULL_END
