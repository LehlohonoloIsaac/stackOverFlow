//
//  QuestionsData.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionsData : NSObject

-(NSArray *)fetchQuestions;
-(void)fetchQuestionsFromStackOverFlowApi;

@end
