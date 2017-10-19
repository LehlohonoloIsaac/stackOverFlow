//
//  stackOverFlowTests.m
//  stackOverFlowTests
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuestionsList.h"
#import "QuestionsListViewModel.h"

@interface stackOverFlowTests : XCTestCase

@property (nonatomic,strong) QuestionsListViewModel *questionsViewModelToTest;
@property (nonatomic,strong) QuestionsList *mockQuestionsList;

@end

@implementation stackOverFlowTests

- (void)setUp
{
    [super setUp];
    _mockQuestionsList = [[QuestionsList alloc]initWithMockQuestions];
    _questionsViewModelToTest = [[QuestionsListViewModel alloc]initWithQuestionsList:_mockQuestionsList];
}

-(void)testIfTheCorrectNumberOfQuestionsIsReturned
{
    NSUInteger expectedResult = 10;
    NSUInteger numberOfQuestions = [self.questionsViewModelToTest numberOfQuestions];
    XCTAssertEqual(expectedResult, numberOfQuestions);
}

- (void)testPerformanceExample
{
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
