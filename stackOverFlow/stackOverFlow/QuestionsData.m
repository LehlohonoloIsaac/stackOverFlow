//
//  QuestionsData.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsData.h"
#import "Question.h"

@implementation QuestionsData

-(NSArray *)fetchQuestions{
    return @[
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:4 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:1 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:0 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:0 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:8 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:30 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:2 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:1 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:1 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:0 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:false],
             [[Question alloc] initWithQuestion:@"What is objective-C" numberOfAnswers:2 tags:@"ios objective-C" timeAgo:@"3 years" isAnswerAccepted:true]
             ];
}

-(void)fetchQuestionsFromStackOverFlowApi{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://api.stackexchange.com/2.2/questions?pagesize=50&order=asc&sort=creation&tagged=ios&site=stackoverflow&filter=!bA1d_O)D.qiH*B"]];
    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *jsonError;
            NSArray *jsonResults = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            NSLog(@"%@", jsonResults);
        });
    }];
    [task resume];
}

-(NSURLSession *)getURLSession{
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        session = [NSURLSession sessionWithConfiguration:configuration];
    });
    return session;
}

@end
