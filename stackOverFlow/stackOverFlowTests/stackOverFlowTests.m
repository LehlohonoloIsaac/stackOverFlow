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
@property (nonatomic,strong) NSIndexPath *indexPath;

@end

@implementation stackOverFlowTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _mockQuestionsList = [[QuestionsList alloc]initWithMockQuestions];
    _questionsViewModelToTest = [[QuestionsListViewModel alloc]initWithQuestionsList:_mockQuestionsList];
    _indexPath = [NSIndexPath indexPathForRow:1 inSection:1];
}

-(void)testIfTheCorrectQuestionIsDisplayed{
    NSString *expectedResult = @"What is objective-C";
    NSString *question = [self.questionsViewModelToTest displayQuestionAtIndexPath:_indexPath];
    XCTAssertTrue([question isEqualToString:expectedResult]);
}

-(void)testIfTheCorrectNumberOfQuestionsIsReturned{
    NSUInteger expectedResult = 10;
    NSUInteger numberOfQuestions = [self.questionsViewModelToTest numberOfQuestions];
    XCTAssertEqual(expectedResult, numberOfQuestions);
}

-(void)testIfTheCorrectTimeIsReturned{
    NSString *expectedResults = @"0 hours ago";
    NSString *timePosted = [self.questionsViewModelToTest timeAtIndexPath:_indexPath];
    XCTAssertEqualObjects(expectedResults, timePosted);
}

-(void)testIfTheCorrectTagsAreReturned{
    NSArray *expectedTags = @[@"ios",@"objective-c"];
    NSArray *tags = [self.questionsViewModelToTest tagsAtIndexPath:_indexPath];
    XCTAssertEqualObjects(expectedTags, tags);
  
}

-(void)testIfCorrectAnswerLabelIsSet{
    NSString *expectedResult = @"Answers";
    NSString *answerLabel = [self.questionsViewModelToTest setAnswerLabelAtIndexPath:_indexPath];
    XCTAssertTrue([answerLabel isEqualToString:expectedResult]);
}

-(void)testIfCorrectNumberOfAnswersAreReturned{
    NSUInteger expectedResult = 0;
    NSUInteger numberofAnswers = [self.questionsViewModelToTest numberOfAnswersAtIndexPath:_indexPath];
    XCTAssertEqual(expectedResult, numberofAnswers);
}

-(void)testIfCorrectColorForAnswerHolderIsReturned{
    UIColor *expectedColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.4];
    UIColor *color = [self.questionsViewModelToTest setBackgroundColorForAnswerHolderAtIndexPath:_indexPath];
    XCTAssertEqualObjects(expectedColor, color);
}

-(void)testIfisAnswerCorrectMethodWorksCorrectly{
    Boolean expectedResult = false;
    Boolean result = [self.questionsViewModelToTest isAnswerAccepted:_indexPath];
    XCTAssertTrue(expectedResult == result);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
