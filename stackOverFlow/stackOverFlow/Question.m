//
//  Question.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype)initWithQuestion:(NSString *)question numberOfAnswers:(NSString *)numberOfAnswers tags:(NSString *)tags timeAgo:(NSString *)timeAgo{
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _question = [question copy];
    _numberOfAnswers = [numberOfAnswers copy];
    _tags = [tags copy];
    _timeAgo = [timeAgo copy];
    
    return self;
}

@end
