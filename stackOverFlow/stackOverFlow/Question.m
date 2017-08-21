//
//  Question.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype)initWithQuestion:(NSString *)question numberOfAnswers:(NSUInteger)numberOfAnswers tags:(NSString *)tags timeAgo:(NSString *)timeAgo{
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _question = question;
    _numberOfAnswers = numberOfAnswers;
    _tags = tags;
    _timeAgo = timeAgo;
    
    return self;
}

@end
