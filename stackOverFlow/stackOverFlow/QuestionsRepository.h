//
//  QuestionsRepository.h
//  stackOverFlow
//
//  Created by dvt on 2017/10/31.
//  Copyright © 2017 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QuestionsRepository <NSObject>
-(NSMutableArray*)fetchQuestions;
@end
