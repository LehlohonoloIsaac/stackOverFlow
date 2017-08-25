//
//  Question.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype)initWithTitle:(NSString *)title numberOfAnswers:(NSUInteger )numberOfAnswers tags:(NSString *)tags timeAgo:(NSDate *)timeAgo isAnswerAccepted:(Boolean)isAnswerAccepted isQuestionAnswered:(Boolean)isAnswered{
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _title = title;
    _answer_count = numberOfAnswers;
    _tags = tags;
    _creation_date = timeAgo;
    _isAnswerAccepted = isAnswerAccepted;
    _is_answered = isAnswered;
    
    return self;
}

@end
