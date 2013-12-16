//
//  MTDLTask.h
//  MyTodoList
//
//  Created by Nelson Terra on 16/12/13.
//  Copyright (c) 2013 Nelson Terra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTDLTask : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic, getter=isDone) BOOL done;

@end
