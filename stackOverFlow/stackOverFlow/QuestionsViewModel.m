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
@property (nonatomic, strong) NSArray *questions;

@end

@implementation QuestionsViewModel

-(instancetype)initWithQuestions:(QuestionsData *)questionsData{
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _questionsData = questionsData;
    _questions = [questionsData fetchQuestions];
  
    return self;
}

-(NSUInteger)numberOfQuestionsInSection:(NSInteger)section{
    return self.questions.count;
}

-(Question *)questionAtIndexPath:(NSIndexPath *)indexPath {
    return _questions[indexPath.row];
}

-(NSString *)tagsAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return [NSString stringWithFormat:@"%@", question.tags];
}

-(NSString *)timeAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return [NSString stringWithFormat:@"%@", question.timeAgo];
}

-(NSString *)numberOfAnswersAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return [NSString stringWithFormat:@"%@", question.numberOfAnswers];
}

-(NSString *)displayQuestionAtIndexPath:(NSIndexPath *)indexPath{
    Question *question = (Question *)[self questionAtIndexPath:indexPath];
    return question.question;
}


@end
