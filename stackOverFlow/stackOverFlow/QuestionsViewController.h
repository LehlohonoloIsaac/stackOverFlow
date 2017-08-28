//
//  QuestionsViewController.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionsViewModel.h"

@interface QuestionsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,QuestionDataDelegate>
@property (nonatomic,retain) NSMutableArray *questions;
@property (nonatomic,strong) QuestionsViewModel *questionsViewModel;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@end

