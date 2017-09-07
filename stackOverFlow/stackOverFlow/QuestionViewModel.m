//
//  QuestionViewModel.m
//  stackOverFlow
//
//  Created by DVT on 2017/09/07.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionViewModel.h"

@implementation QuestionViewModel
-(instancetype)initWithQuestion:(Question *)question{
    self = [super init];
    if (!self) {
        return nil;
    }
    _question = question;
    return self;
}

-(NSString*)timeElapsed{
    long hoursPosted = [self convertTimeToHours:_question.creation_date];
    long now = [self convertTimeToHours:[NSDate date]];
    long hoursAgo = labs(now-hoursPosted);
    return hoursAgo==1 ? [NSString stringWithFormat:@"%ld %@",hoursAgo,@"hour ago"]: [NSString stringWithFormat:@"%ld %@",hoursAgo,@"hours ago"];
}

-(long)convertTimeToHours:(NSDate *)date{
    NSString *creationDate = [NSString stringWithFormat:@"%@",date];
    long creationDateUnixTimestamp = (unsigned long)creationDate;
    return creationDateUnixTimestamp/(1000*60*60);
}

-(BOOL)isQuestionAccepted{
    return _question.accepted_answer_id != 0? true: false;
}

-(UIColor *)backgroundColorForAnswerHolder{
    return [self isQuestionAccepted]? UIColor.greenColor : [UIColor.lightGrayColor colorWithAlphaComponent:0.4];
}

-(NSString *)answerLabel{
    return _question.answer_count == 1 ? @"Answer" : @"Answers";
}

-(NSString *)displayQuestionTitle{
    return _question.title;
}

-(NSUInteger)answerCount{
    return _question.answer_count;
}

-(NSArray*)tags{
    return _question.tags;
}

@end
