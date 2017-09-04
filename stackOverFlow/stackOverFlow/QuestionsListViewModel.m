//
//  QuestionsViewModel.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsListViewModel.h"
#import "Question.h"
#import <UIKit/UIKit.h>

@interface QuestionsListViewModel()

@property (nonatomic,strong,readonly) QuestionsList *questionsList;
@property (nonatomic, strong) NSMutableArray *questions;

@end

@implementation QuestionsListViewModel

-(instancetype)initWithQuestionsList:(QuestionsList *)questionsList{
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _questionsList = questionsList;
    _questions = [questionsList fetchQuestions];
    return self;
}

-(NSUInteger)numberOfQuestions{
    return self.questions.count;
}

-(Question *)questionAtIndexPath:(NSIndexPath *)indexPath {
    return _questions[indexPath.row];
}

-(NSArray *)tagsAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return question.tags;
}

-(NSString *)timeAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    long hoursPosted = [self convertTimeToHours:question.creation_date];
    long now = [self convertTimeToHours:[NSDate date]];
    long hoursAgo = labs(now-hoursPosted);
    return hoursAgo==1 ? [NSString stringWithFormat:@"%ld %@",hoursAgo,@"hour ago"]: [NSString stringWithFormat:@"%ld %@",hoursAgo,@"hours ago"];
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
