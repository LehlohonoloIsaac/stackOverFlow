//
//  QuestionViewModel.h
//  stackOverFlow
//
//  Created by DVT on 2017/09/07.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
#import "Question.h"

@interface QuestionViewModel : NSObject
@property (nonatomic,strong) Question* question;
-(instancetype)initWithQuestion:(Question*)question;
-(NSString*)timeElapsed;
-(BOOL)isQuestionAccepted;
-(UIColor *)backgroundColorForAnswerHolder;
-(NSString *)answerLabel;
-(NSString *)displayQuestionTitle;
-(NSUInteger)answerCount;
-(NSArray*)tags;
@end
