//
//  QuestionsData.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionsRepository.h"

@protocol QuestionsListDelegate <NSObject>
@required
-(void)didFetchQuestionsFromStackOverFlow:(NSMutableArray *)questions;
@end

typedef id<QuestionsListDelegate> QuestionsListDelegate;

@interface QuestionsList : NSObject<QuestionsRepository>
-(instancetype)initWithMockQuestions;
-(instancetype)initWithQuestions;
@property (nonatomic,weak) QuestionsListDelegate delegate;
-(void)fetchMockQuestions;
-(void)fetchQuestionsFromStackOverFlowApi;
@end
