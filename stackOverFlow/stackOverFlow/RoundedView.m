//
//  RoundedView.m
//  stackOverFlow
//
//  Created by dvt on 2017/10/19.
//  Copyright © 2017 DVT. All rights reserved.
//

#import "RoundedView.h"

@implementation RoundedView

- (void)drawRect:(CGRect)rect {
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.masksToBounds = true;
}

@end
