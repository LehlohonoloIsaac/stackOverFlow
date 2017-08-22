//
//  QuestionsData.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsData.h"
#import "Question.h"

@implementation QuestionsData

-(NSArray *)fetchQuestions{
    return @[
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:4 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:1 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:0 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:0 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:8 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:30 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:2 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:1 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:1 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:0 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:2 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true]
             ];
}

-(NSArray *)fetchQuestionsFromStackOverFlowApi{
    return nil;
}

@end
