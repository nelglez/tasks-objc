//
//  NELTaskDetailViewController.h
//  tasks-objc
//
//  Created by Nelson Gonzalez on 3/27/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NELTaskController;
@class NELTask;

@interface NELTaskDetailViewController : UIViewController

//Both properties are going to get their values from the segueway
@property (nonatomic) NELTaskController *taskController;
@property (nonatomic) NELTask *task;
@end

NS_ASSUME_NONNULL_END
