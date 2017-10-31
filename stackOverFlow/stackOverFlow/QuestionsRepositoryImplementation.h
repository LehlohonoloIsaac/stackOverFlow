//
//  QuestionsData.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionsRepository.h"

@protocol QuestionsRepositoryDelegate <NSObject>
@required
-(void)didFetchQuestionsFromStackOverFlow:(NSMutableArray *)questions;
@end

typedef id<QuestionsRepositoryDelegate> QuestionsRepositoryDelegate;

@interface QuestionsRepositoryImplementation : NSObject<QuestionsRepository>
-(instancetype)initWithMockQuestions;
-(instancetype)initWithQuestions;
@property (nonatomic,weak) QuestionsRepositoryDelegate delegate;
-(void)fetchMockQuestions;
-(void)fetchQuestionsFromStackOverFlowApi;
@end
