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
    NSString *question = [self.questionsViewModelToTest displayQuestionAtIndexPath:_indexPath];
    XCTAssertTrue(false);
}

-(void)testIfTheCorrectNumberOfQuestionsIsReturned{
   XCTAssertTrue(false);
}

-(void)testIfTheCorrectTimeIsReturned{
    XCTAssertTrue(false);
}

-(void)testIfTheCorrectTagsAreReturned{
   XCTAssertTrue(false);
}

-(void)testIfCorrectNumberOfAnswersAreReturned{
   XCTAssertTrue(false);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
