
//
//  QuestionCell.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "QuestionCell.h"
#import "Question.h"

@implementation QuestionCell

@synthesize numberOfAnswers = _numberOfAnswers;
@synthesize question = _question;
@synthesize numberOfHoursAgo = _numberOfHoursAgo;
@synthesize answersHolder = _answersHolder;
@synthesize answerLabel = _answerLabel;
@synthesize tagsStack = _tagsStack;

- (void)awakeFromNib
{
    [super awakeFromNib];
    _answerLabel.text =@"Answers";
    _answersHolder.backgroundColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.4];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(void)configureCellWithQuestion:(Question*)question
{
    self.questionViewModel = [[QuestionViewModel alloc]initWithQuestion:question];
    self.answerLabel.text = _questionViewModel.answerLabel;
    self.numberOfAnswers.text = [NSString stringWithFormat:@"%lu",(unsigned long)_questionViewModel.answerCount];
    self.question.text = _questionViewModel.displayQuestionTitle;
    self.numberOfHoursAgo.text = _questionViewModel.timeElapsed;
    for (NSString* tag in _questionViewModel.tags)
    {
        UITextField *label = [self createTagWithTagNamed:tag];
        [self.tagsStack addArrangedSubview:label];
    }
    self.answersHolder.backgroundColor = _questionViewModel.backgroundColorForAnswerHolder;
    self.answersHolder.layer.cornerRadius = _answersHolder.frame.size.width/2;
    self.answersHolder.layer.masksToBounds = true;
}

-(UITextField *)createTagWithTagNamed:(NSString *)tagName
{
    UITextField *label = [[UITextField alloc] init];
    [label setText:tagName];
    [label setBackgroundColor:[UIColor.lightGrayColor colorWithAlphaComponent:0.4]];
    [label setBorderStyle:UITextBorderStyleRoundedRect];
    [label setUserInteractionEnabled:false];
    return label;
}

@end
