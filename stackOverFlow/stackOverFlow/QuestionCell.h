//
//  QuestionCell.h
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCell : UITableViewCell
    @property (nonatomic, weak) IBOutlet UILabel *numberOfAnswers;
    @property (nonatomic, weak) IBOutlet UILabel *question;
    @property (nonatomic, weak) IBOutlet UILabel *numberOfHoursAgo;
    @property (nonatomic, weak) IBOutlet UILabel *tags;
    @property (nonatomic,weak) IBOutlet UIView *answersHolder;

@end
