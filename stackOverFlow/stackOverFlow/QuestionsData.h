//
//  QuestionsData.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuestionDataDelegate <NSObject>

@required
-(void)didFetchQuestionsFromStackOverFlow:(NSMutableArray *)questions;
@end

@interface QuestionsData : NSObject
@property (nonatomic,weak) id <QuestionDataDelegate> delegate;
-(NSArray *)fetchQuestions;
-(void)fetchQuestionsFromStackOverFlowApi;
-(NSMutableArray *)getQuestions;

@end
