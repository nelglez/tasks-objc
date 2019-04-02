//
//  NELTask.h
//  tasks-objc
//
//  Created by Nelson Gonzalez on 3/27/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NELTask : NSObject


-(instancetype)initWithName:(NSString *)name notes:(NSString *)notes dueDate:(NSDate *)dueDate;



//Atomicity - Atomic - Something being unable to be broken down into something smaller. Guaranteed to get a real value from it. Its default. Ensures you get a real value but its slower. thread safe but still potential for it to not being thread safe. You get value but not sure if its old or new one.
//Nonatomic - you can get junk/garbage. You could get corrupted memory but its faster.
//--------------
//Access -
//Readonly - Doest create (synthesize) a setter for the property. Never be able to chage after its initialize, everything can read but not set. Nothing can set the value (outside of the initializer) including the (owner) class itself.
//ReadWrite - Able to read and write the value. Its the default.

//Mutability - tomorrow
//Storage - next week

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *notes;
@property (nonatomic) NSDate *dueDate;

@end

NS_ASSUME_NONNULL_END
