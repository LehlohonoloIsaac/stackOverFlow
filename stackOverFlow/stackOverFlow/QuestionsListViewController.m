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

- (void)viewDidLoad {
    [super viewDidLoad];
    QuestionsList *questionsList = [[QuestionsList alloc] initWithQuestions];
    questionsList.delegate = self;
    _questionsViewModel = [[QuestionsListViewModel alloc] initWithQuestionsList:questionsList];
    UINib *questionCell = [UINib nibWithNibName:@"QuestionCell" bundle:nil];
    [_tableView registerNib:questionCell forCellReuseIdentifier:@"QuestionCell"];
    _searchResults = [[NSMutableArray alloc]init];
    _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    _searchController.definesPresentationContext = true;
    _searchController.dimsBackgroundDuringPresentation = false;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIActivityIndicatorView *loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loader.tag = 1;
    loader.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:loader];
    [loader startAnimating];
    
    _searchController.searchResultsUpdater = self;
    _searchController.searchBar.delegate = self;
    _tableView.tableHeaderView = _searchController.searchBar;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_searchResults.count != 0) {
        return _searchResults.count;
    }else{
        if (!_searchController.isActive) {
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
    if (_searchResults.count!=0) {
        question = _searchResults[indexPath.row];
    }else{
        if (!_searchController.isActive) {
            question = [_questionsViewModel questionAtIndexPath:indexPath];
        }else{
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

-(void)didFetchQuestionsFromStackOverFlow:(NSMutableArray *)questions{
    _questions = questions;
    [[self.view viewWithTag:1] stopAnimating];
    [_tableView reloadData];
    NSLog(@"Finished fetching questions...");
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    [_searchResults removeAllObjects];
    NSString* searchText = searchController.searchBar.text;
    for (Question* question in _questions) {
        if ([question.title containsString:searchText]) {
            [_searchResults addObject:question];
        }
    }
    [_tableView reloadData];
    
}

@end
