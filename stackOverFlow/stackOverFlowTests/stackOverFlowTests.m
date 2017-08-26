//
//  stackOverFlowTests.m
//  stackOverFlowTests
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuestionsData.h"
#import "QuestionsViewModel.h"

@interface stackOverFlowTests : XCTestCase

@property (nonatomic,strong) QuestionsViewModel *questionsViewModelToTest;
@property (nonatomic,strong) QuestionsData *mockQuestionsData;
@property (nonatomic,strong) NSIndexPath *indexPath;

@end

@implementation stackOverFlowTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _mockQuestionsData = [[QuestionsData alloc]init];
    _questionsViewModelToTest = [[QuestionsViewModel alloc]initWithQuestions:_mockQuestionsData];
    _indexPath = [NSIndexPath indexPathForRow:1 inSection:1];
}

-(void)testIfTheCorrectQuestionIsDisplayed{
    NSString *expectedResult = @"What is objective-C";
    NSString *question = [self.questionsViewModelToTest displayQuestionAtIndexPath:_indexPath];
    XCTAssertTrue([question isEqualToString:expectedResult]);
}

-(void)testIfTheCorrectNumberOfQuestionsIsReturned{
    NSUInteger expectedResult = 3;
    NSUInteger numberOfQuestions = [self.questionsViewModelToTest numberOfQuestions];
    XCTAssertEqual(expectedResult, numberOfQuestions);
}

-(void)testIfTheCorrectTimeIsReturned{
    NSString *expectedResult = @"3 years";
    NSString *timePosted = [self.questionsViewModelToTest timeAtIndexPath:_indexPath];
    XCTAssertTrue([timePosted isEqualToString:expectedResult]);
}

-(void)testIfTheCorrectTagsAreReturned{
    NSString *expectedResult = @"ios objective-C";
    NSString *tags = [self.questionsViewModelToTest tagsAtIndexPath:_indexPath];
    XCTAssertTrue([tags isEqualToString:expectedResult]);
  
}

-(void)testIfCorrectAnswerLabelIsSet{
    NSString *expectedResult = @"Answers";
    NSString *answerLabel = [self.questionsViewModelToTest setAnswerLabelAtIndexPath:_indexPath];
    XCTAssertTrue([answerLabel isEqualToString:expectedResult]);
}

-(void)testIfCorrectNumberOfAnswersAreReturned{
    NSUInteger expectedResult = 4;
    NSUInteger numberofAnswers = [self.questionsViewModelToTest numberOfAnswersAtIndexPath:_indexPath];
    XCTAssertEqual(expectedResult, numberofAnswers);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
