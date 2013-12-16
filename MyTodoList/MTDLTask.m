//
//  MTDLTask.m
//  MyTodoList
//
//  Created by Nelson Terra on 16/12/13.
//  Copyright (c) 2013 Nelson Terra. All rights reserved.
//

#import "MTDLTask.h"

@implementation MTDLTask

-(instancetype)initWithName: (NSString *) name_
{

    self = [super init];
    
    if(self){
        self.name = name_;
    }
    
    return self;
    
}

@end
