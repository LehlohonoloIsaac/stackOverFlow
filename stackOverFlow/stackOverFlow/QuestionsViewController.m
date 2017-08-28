//
//  ViewController.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsViewController.h"
#import "QuestionCell.h"

@interface QuestionsViewController ()
@end

@implementation QuestionsViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    QuestionsData *questionData = [[QuestionsData alloc] init];
    questionData.delegate = self;
    _questionsViewModel = [[QuestionsViewModel alloc] initWithQuestions:questionData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.questionsViewModel numberOfQuestions];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"QuestionCell";
    QuestionCell *cell = (QuestionCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QuestionCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSUInteger numberOfAnswers = (unsigned long) [self.questionsViewModel numberOfAnswersAtIndexPath:indexPath];
    cell.answersHolder.backgroundColor = [self.questionsViewModel setBackgroundColorForAnswerHolderAtIndexPath:indexPath];
    cell.answerLabel.text = [self.questionsViewModel setAnswerLabelAtIndexPath:indexPath];
    cell.question.text = [self.questionsViewModel displayQuestionAtIndexPath:indexPath];
    cell.numberOfAnswers.text = [NSString stringWithFormat:@"%ld",numberOfAnswers];
    cell.numberOfHoursAgo.text = [self.questionsViewModel timeAtIndexPath:indexPath];
    cell.tags.text = [self.questionsViewModel tagsAtIndexPath:indexPath];
    cell.answersHolder.layer.cornerRadius = cell.answersHolder.frame.size.width/2;
    cell.answersHolder.layer.masksToBounds = true;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

-(void)didFetchQuestionsFromStackOverFlow:(NSMutableArray *)questions{
    _questions = questions;
    [_tableView reloadData];
    NSLog(@"Finished fetching questions...");
}

@end
