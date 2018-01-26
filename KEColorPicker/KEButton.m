//
//  KEButton.m
//  KEColorPicker
//
//  Created by Kaan Esin on 26.01.2018.
//  Copyright © 2018 Kaan Esin. All rights reserved.
//

#import "KEButton.h"

@implementation KEButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGFloat offSet = 50.0;
    CGRect newArea = CGRectMake(self.bounds.origin.x - offSet,
                                self.bounds.origin.y - offSet,
                                self.bounds.size.width + offSet*2,
                                self.bounds.size.height + offSet*2);
    return CGRectContainsPoint(newArea, point);
}

@end
