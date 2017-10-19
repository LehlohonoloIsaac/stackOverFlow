//
//  ViewController.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionsListViewController.h"
#import "QuestionCell.h"

@interface QuestionsListViewController ()<UITableViewDelegate,UITableViewDataSource,QuestionsListDelegate,UISearchResultsUpdating,UISearchBarDelegate>
@property (nonatomic,retain) NSMutableArray *questions;
@property (nonatomic,strong) QuestionsListViewModel *questionsViewModel;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,strong) UISearchController* searchController;
@property (nonatomic,strong) NSMutableArray* searchResults;
@end

@implementation QuestionsListViewController

@synthesize tableView = _tableView;
@synthesize searchController = _searchController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    QuestionsList *questionsList = [[QuestionsList alloc] initWithQuestions];
    questionsList.delegate = self;
    self.questionsViewModel = [[QuestionsListViewModel alloc] initWithQuestionsList:questionsList];
    [self configureTableView];
    [self configureSearchController];
}

-(void)configureTableView
{
    UINib *questionCell = [UINib nibWithNibName:@"QuestionCell" bundle:nil];
    [_tableView registerNib:questionCell forCellReuseIdentifier:@"QuestionCell"];
}

-(void)configureSearchController
{
    self.searchResults = [[NSMutableArray alloc]init];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.definesPresentationContext = true;
    self.searchController.dimsBackgroundDuringPresentation = false;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIActivityIndicatorView *loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loader.tag = 1;
    loader.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:loader];
    [loader startAnimating];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchResults.count != 0)
    {
        return self.searchResults.count;
    }else
    {
        if (!self.searchController.isActive)
        {
             return [self.questionsViewModel numberOfQuestions];
        }
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"QuestionCell";
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Question* question;
    if (self.searchResults.count!=0)
    {
        question = self.searchResults[indexPath.row];
    }else
    {
        if (!self.searchController.isActive)
        {
            question = [self.questionsViewModel questionAtPosition: indexPath.row];
        }else
        {
            question = nil;
        }
    }
    [cell configureCellWithQuestion:question];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

-(void)didFetchQuestionsFromStackOverFlow:(NSMutableArray *)questions
{
    self.questions = questions;
    [[self.view viewWithTag:1] stopAnimating];
    [self.tableView reloadData];
    NSLog(@"Finished fetching questions...");
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    [self.searchResults removeAllObjects];
    NSString* searchText = searchController.searchBar.text;
    for (Question* question in self.questions)
    {
        if ([question.title containsString:searchText])
        {
            [self.searchResults addObject:question];
        }
    }
    [self.tableView reloadData];
}

@end
