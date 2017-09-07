//
//  QuestionsViewController.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionsListViewModel.h"

@interface QuestionsListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,QuestionsListDelegate,UISearchResultsUpdating,UISearchBarDelegate>
@property (nonatomic,retain) NSMutableArray *questions;
@property (nonatomic,strong) QuestionsListViewModel *questionsViewModel;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,strong) UISearchController* searchController;
@property (nonatomic,strong) NSMutableArray* searchResults;
@end

