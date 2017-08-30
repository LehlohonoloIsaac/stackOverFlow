//
//  QuestionsData.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/18.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsData.h"
#import "Question.h"

@implementation QuestionsData{
    NSMutableArray *questions;
}

-(NSArray *)fetchQuestions{
    return @[
             [[Question alloc] initWithTitle:@"What is the difference between a struct and a class in Objective-C?" numberOfAnswers:4 tags:@[@"ios",@"objective-c",@"struct",@"class"] timeAgo:[[NSDate alloc]init] isAnswerAccepted:true isQuestionAnswered:true],
             [[Question alloc] initWithTitle:@"What is objective-C" numberOfAnswers:0 tags:@[@"ios",@"objective-c"] timeAgo:[[NSDate alloc]init] isAnswerAccepted:false isQuestionAnswered:false],
             [[Question alloc] initWithTitle:@"I have created an NSArray that contains 20 NSString values, How do I append another Array into this one?" numberOfAnswers:50 tags:@[@"ios",@"objective-c",@"NSArray",@"swift",@"programming",@"data types",@"dynamic arrays"]  timeAgo:[[NSDate alloc]init] isAnswerAccepted:false isQuestionAnswered:true],
             [[Question alloc] initWithTitle:@"What is objective-C" numberOfAnswers:1 tags:@[@"ios",@"objective-c"]  timeAgo:[[NSDate alloc]init] isAnswerAccepted:true isQuestionAnswered:true],
             [[Question alloc] initWithTitle:@"What is objective-C" numberOfAnswers:0 tags:@[@"ios",@"objective-c"]  timeAgo:[[NSDate alloc]init] isAnswerAccepted:false isQuestionAnswered:false],
             [[Question alloc] initWithTitle:@"What is objective-C" numberOfAnswers:30 tags:@[@"ios",@"objective-c"]  timeAgo:[[NSDate alloc]init] isAnswerAccepted:true isQuestionAnswered:true],
             [[Question alloc] initWithTitle:@"What is objective-C" numberOfAnswers:130 tags:@[@"ios",@"objective-c"]  timeAgo:[[NSDate alloc]init] isAnswerAccepted:true isQuestionAnswered:true],
             [[Question alloc] initWithTitle:@"What is objective-C" numberOfAnswers:1 tags:@[@"ios",@"objective-c"]  timeAgo:[[NSDate alloc]init] isAnswerAccepted:false isQuestionAnswered:true],
             [[Question alloc] initWithTitle:@"What is objective-C" numberOfAnswers:4 tags:@[@"ios",@"objective-c"]  timeAgo:[[NSDate alloc]init] isAnswerAccepted:true isQuestionAnswered:true],
             [[Question alloc] initWithTitle:@"What is objective-C" numberOfAnswers:1 tags:@[@"ios",@"objective-c"] timeAgo:[[NSDate alloc]init] isAnswerAccepted:false isQuestionAnswered:true]
             ];
}

-(NSMutableArray *)getQuestions{
    return questions;
}

-(void)fetchQuestionsFromStackOverFlowApi{
    questions = [[NSMutableArray alloc]init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://api.stackexchange.com/2.2/questions?pagesize=100&order=asc&sort=creation&tagged=ios&site=stackoverflow"]];
    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response, NSError *error){
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
            [self questionsFromJSON:data error:error];
            [self.delegate didFetchQuestionsFromStackOverFlow:questions];
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


-(void)questionsFromJSON:(NSData *)objectNotation error:(NSError *)error{
    NSError *localError = nil;
    NSDictionary *parsedobject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    NSLog(@"%@", parsedobject);
    if (localError != nil) {
        error = localError;
    }else{
    NSArray *items = [parsedobject valueForKey:@"items"];
    
    for (NSDictionary *questionDict in items) {
        Question *question = [[Question alloc] init];
        
        for (NSString *key in questionDict) {
            if ([question respondsToSelector:NSSelectorFromString(key)]) {
                [question setValue:[questionDict valueForKey:key] forKey:key];
            }
        }
        [questions addObject:question];
        NSLog(@"%@", @"Adding question objects");
    }
    }
}

@end
