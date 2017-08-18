//
//  ViewController.m
//  stackOverFlow
//
//  Created by DVT on 2017/08/17.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "StackOverFlowController.h"
#import "QuestionCell.h"

@interface StackOverFlowController ()

@end

@implementation StackOverFlowController
{
    NSArray *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    data = [NSArray arrayWithObjects: @"first question",@"second question",@"third question",@"fourth question",@"fifth question",@"sixth question",@"seventh question",@"eigth question",@"ninth question",@"tenth question", nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"QuestionCell";
    QuestionCell *cell = (QuestionCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QuestionCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.question.text = [data objectAtIndex:indexPath.row];
    
    //cell.textLabel.text = [data objectAtIndex:indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
