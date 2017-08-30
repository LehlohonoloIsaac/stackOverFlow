//
//  QuestionsViewModel.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsViewModel.h"
#import "Question.h"
#import <UIKit/UIKit.h>

@interface QuestionsViewModel()

@property (nonatomic,strong,readonly) QuestionsData *questionsData;
@property (nonatomic, strong) NSMutableArray *questions;

@end

@implementation QuestionsViewModel

-(instancetype)initWithQuestions:(QuestionsData *)questionsData{
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _questionsData = questionsData;
    [questionsData fetchQuestionsFromStackOverFlowApi];
    _questions = [questionsData getQuestions];
    return self;
}

-(NSUInteger)numberOfQuestions{
    return self.questions.count;
}

-(Question *)questionAtIndexPath:(NSIndexPath *)indexPath {
    return _questions[indexPath.row];
}

-(NSString *)tagsAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    NSString *tags = [question.tags componentsJoinedByString:@"   "];
    return tags;
}

-(NSString *)timeAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    long hoursPosted = [self convertTimeToHours:question.creation_date];
    long now = [self convertTimeToHours:[NSDate date]];
    NSLog(@"%@ %ld",@"Hours question was posted: ",hoursPosted);
    NSLog(@"%@ %ld",@"now: ",now);
    long hoursAgo = now-hoursPosted;
    return [NSString stringWithFormat:@"%ld %@",hoursAgo,@"hours ago"];
}

-(NSUInteger)numberOfAnswersAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return question.answer_count;
}

-(NSString *)displayQuestionAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return question.title;
}

-(Boolean)isAnswerAccepted:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return question.isAnswerAccepted;
}

-(NSString *)setAnswerLabelAtIndexPath:(NSIndexPath *)indexPath{
    return [self numberOfAnswersAtIndexPath:indexPath] == 1 ? @"Answer" : @"Answers";
}

-(UIColor *)setBackgroundColorForAnswerHolderAtIndexPath:(NSIndexPath *)indexPath{
    return [self questionHasAcceptedAnswerAtIndexPath:indexPath]? UIColor.greenColor : [UIColor.lightGrayColor colorWithAlphaComponent:0.4];
}

-(NSDate *)getCurrentTime{
    NSDate *now = [[NSDate alloc]init];
    return now;
}

-(NSDate *)getTimeAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return question.creation_date;
}

-(long)convertTimeToHours:(NSDate *)date{
    NSString *creationDate = [NSString stringWithFormat:@"%@",date];
    long creationDateUnixTimestamp = (unsigned long)creationDate;
    return creationDateUnixTimestamp/(1000*60*60);
}

-(BOOL)questionHasAcceptedAnswerAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return question.accepted_answer_id != 0? true: false;
}

@end
