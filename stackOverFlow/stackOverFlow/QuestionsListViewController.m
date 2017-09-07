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
    UINib *questionCell = [UINib nibWithNibName:@"QuestionCell" bundle:nil];
    [_tableView registerNib:questionCell forCellReuseIdentifier:@"QuestionCell"];
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
    static NSString *cellIdentifier = @"QuestionCell";
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Question* question = [_questionsViewModel questionAtIndexPath:indexPath];
    [cell updateCellWithQuestion:question];
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



@end
