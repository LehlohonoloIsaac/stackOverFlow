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

-(Question *)questionAtPosition:(NSInteger)position {
    return _questions[position];
}



@end
