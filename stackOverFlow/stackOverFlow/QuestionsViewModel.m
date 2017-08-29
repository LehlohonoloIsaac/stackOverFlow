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
    return [NSString stringWithFormat:@"%@", question.creation_date];
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
    return [self isAnswerAccepted:indexPath]? UIColor.greenColor : [UIColor.lightGrayColor colorWithAlphaComponent:0.4];
}

-(NSDate *)getCurrentTime{
    NSDate *now = [[NSDate alloc]init];
    return now;
}

-(NSDate *)getTimeAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return question.creation_date;
}

@end
