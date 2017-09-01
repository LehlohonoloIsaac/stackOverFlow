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
-(NSString *)tagsAtIndexPath:(NSIndexPath *)indexPath;
-(NSString *)timeAtIndexPath:(NSIndexPath *)indexPath;
-(NSUInteger)numberOfAnswersAtIndexPath:(NSIndexPath *)indexPath;
-(NSString *)displayQuestionAtIndexPath:(NSIndexPath *)indexPath;
-(Boolean)isAnswerAccepted:(NSIndexPath *)indexPath;
-(NSString *)setAnswerLabelAtIndexPath:(NSIndexPath *)indexPath;
-(UIColor *)setBackgroundColorForAnswerHolderAtIndexPath:(NSIndexPath *)indexPath;
-(NSDate *)getCurrentTime;
-(NSDate *)getTimeAtIndexPath:(NSIndexPath *)indexPath;
-(BOOL)questionHasAcceptedAnswerAtIndexPath:(NSIndexPath *)indexPath;

@end
