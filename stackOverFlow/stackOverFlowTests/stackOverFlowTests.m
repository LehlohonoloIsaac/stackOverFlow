//
//  stackOverFlowTests.m
//  stackOverFlowTests
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuestionsRepositoryImplementation.h"
#import "QuestionsListViewModel.h"

@interface stackOverFlowTests : XCTestCase

@property (nonatomic,strong) QuestionsListViewModel *questionsViewModelToTest;
@property (nonatomic,strong) QuestionsRepositoryImplementation *mockQuestionsRepositoryImplementation;

@end

@implementation stackOverFlowTests

- (void)setUp
{
    [super setUp];
    _mockQuestionsRepositoryImplementation = [[QuestionsRepositoryImplementation alloc]initWithMockQuestions];
    _questionsViewModelToTest = [[QuestionsListViewModel alloc]initWithQuestionsList:_mockQuestionsRepositoryImplementation];
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
