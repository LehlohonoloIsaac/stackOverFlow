//
//  QuestionsViewModel.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QuestionsList.h"
#import "Question.h"

@interface QuestionsListViewModel : NSObject

-(instancetype)initWithQuestionsList:(QuestionsList *)questionsList;

-(NSUInteger)numberOfQuestions;
-(Question *)questionAtIndexPath:(NSIndexPath *)indexPath;

@end
