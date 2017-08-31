//
//  QuestionsData.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuestionsListDelegate <NSObject>

@required
-(void)didFetchQuestionsFromStackOverFlow:(NSMutableArray *)questions;
@end

typedef id<QuestionsListDelegate> QuestionsListDelegate;

@interface QuestionsList : NSObject
@property (nonatomic,weak) QuestionsListDelegate delegate;
-(NSArray *)fetchQuestions;
-(void)fetchQuestionsFromStackOverFlowApi;
-(NSMutableArray *)getQuestions;

@end