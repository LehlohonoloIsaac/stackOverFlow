//
//  Question.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic,copy,readonly) NSString *question;
@property (nonatomic,copy,readonly) NSString *numberOfAnswers;
@property (nonatomic,copy,readonly) NSString *tags;
@property (nonatomic,copy,readonly) NSString *timeAgo;

-(instancetype)initWithQuestion:(NSString *)question numberOfAnswers:(NSString *)numberOfAnswers tags:(NSString *)tags timeAgo:(NSString *)timeAgo;

@end
