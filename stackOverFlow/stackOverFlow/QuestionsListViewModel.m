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

@property (nonatomic,strong,readonly) QuestionsRepositoryImplementation *questionsRepositoryImplementation;
@property (nonatomic, strong) NSMutableArray *questions;

@end

@implementation QuestionsListViewModel

-(instancetype)initWithQuestionsList:(QuestionsRepositoryImplementation *)questionsRepositoryImplementation{
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    _questionsRepositoryImplementation = questionsRepositoryImplementation;
    _questions = [questionsRepositoryImplementation fetchQuestions];
    return self;
}

-(NSUInteger)numberOfQuestions{
    return self.questions.count;
}

-(Question *)questionAtIndexPath:(NSIndexPath *)indexPath {
    return _questions[indexPath.row];
}



@end
