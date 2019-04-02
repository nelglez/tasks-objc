//
//  NELTask.m
//  tasks-objc
//
//  Created by Nelson Gonzalez on 3/27/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELTask.h"

@implementation NELTask

-(instancetype)initWithName:(NSString *)name notes:(NSString *)notes dueDate:(NSDate *)dueDate
{
    self = [super init];
    if (self) {
        _name = name;
        _notes = notes;
        _dueDate = dueDate;
    }
    return self;
}

@end
