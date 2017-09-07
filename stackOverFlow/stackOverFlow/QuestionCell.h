//
//  QuestionCell.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionViewModel.h"

@interface QuestionCell : UITableViewCell
    -(void)updateCellWithQuestion:(Question*)question;
    @property (nonatomic,strong) QuestionViewModel* questionViewModel;
    @property (nonatomic, weak) IBOutlet UILabel *numberOfAnswers;
    @property (nonatomic, weak) IBOutlet UILabel *question;
    @property (nonatomic, weak) IBOutlet UILabel *numberOfHoursAgo;
    @property (nonatomic,weak) IBOutlet UIView *answersHolder;
    @property (nonatomic, weak) IBOutlet UILabel *answerLabel;
    @property (nonatomic,weak) IBOutlet UIStackView *tagsStack;

@end
