//
//  QuestionCell.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionCell.h"

@implementation QuestionCell


@synthesize numberOfAnswers = _numberOfAnswers;
@synthesize question = _question;
@synthesize numberOfHoursAgo = _numberOfHoursAgo;
@synthesize tags = _tags;
@synthesize answersHolder = _answersHolder;
@synthesize answerLabel = _answerLabel;
@synthesize tagsStack = _tagsStack;

- (void)awakeFromNib {
    [super awakeFromNib];
    _answerLabel.text =@"Answers";
    _answersHolder.backgroundColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.4];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
