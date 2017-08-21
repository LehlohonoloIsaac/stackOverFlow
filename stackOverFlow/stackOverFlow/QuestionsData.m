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
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:@"4" tags:@"ios objective-C" timeAgo:@"3 years"],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:@"4" tags:@"ios objective-C" timeAgo:@"3 years"],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:@"4" tags:@"ios objective-C" timeAgo:@"3 years"]
             ];
}

-(NSArray *)fetchQuestionsFromStackOverFlowApi{
    return nil;
}

@end
