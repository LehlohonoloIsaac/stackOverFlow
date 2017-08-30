//
//  Question.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic,retain) NSString *title;
@property (nonatomic,assign) NSUInteger answer_count;
@property (nonatomic,retain) NSArray *tags;
@property (nonatomic,retain) NSDate *creation_date;
@property (nonatomic,assign) Boolean isAnswerAccepted;
@property (nonatomic,assign) Boolean is_answered;
@property (nonatomic,assign) NSUInteger accepted_answer_id;

-(instancetype)initWithTitle:(NSString *)title numberOfAnswers:(NSUInteger )numberOfAnswers tags:(NSArray *)tags timeAgo:(NSDate *)timeAgo isAnswerAccepted:(Boolean)isAnswerAccepted isQuestionAnswered:(Boolean)isAnswered;

@end
