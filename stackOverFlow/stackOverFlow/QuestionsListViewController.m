//
//  ViewController.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsListViewController.h"
#import "QuestionCell.h"

@interface QuestionsListViewController ()
@end

@implementation QuestionsListViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    QuestionsList *questionsList = [[QuestionsList alloc] initWithQuestions];
    questionsList.delegate = self;
    _questionsViewModel = [[QuestionsListViewModel alloc] initWithQuestionsList:questionsList];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIActivityIndicatorView *loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loader.tag = 1;
    loader.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:loader];
    [loader startAnimating];
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
    
    NSArray *tagsArray = [self.questionsViewModel tagsAtIndexPath:indexPath];
    NSUInteger numberOfTags = [tagsArray count];
    for (NSUInteger i = 0; i<numberOfTags; i++) {
        UITextField *label = [self createTagWithTagNamed:tagsArray[i]];
        [cell.tagsStack addArrangedSubview:label];
    }
    cell.answersHolder.backgroundColor = [self.questionsViewModel setBackgroundColorForAnswerHolderAtIndexPath:indexPath];
    cell.answerLabel.text = [self.questionsViewModel setAnswerLabelAtIndexPath:indexPath];
    cell.question.text = [self.questionsViewModel displayQuestionAtIndexPath:indexPath];
    cell.numberOfAnswers.text = [NSString stringWithFormat:@"%ld",numberOfAnswers];
    cell.numberOfHoursAgo.text = [self.questionsViewModel timeAtIndexPath:indexPath];
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
    [[self.view viewWithTag:1] stopAnimating];
    [_tableView reloadData];
    NSLog(@"Finished fetching questions...");
}


-(UITextField *)createTagWithTagNamed:(NSString *)tagName{
    UITextField *label = [[UITextField alloc] init];
    [label setText:tagName];
    [label setBackgroundColor:[UIColor.lightGrayColor colorWithAlphaComponent:0.4]];
    [label setBorderStyle:UITextBorderStyleRoundedRect];
    return label;
}
@end
