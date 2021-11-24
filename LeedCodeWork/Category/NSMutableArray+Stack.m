//
//  NSMutableArray+Stack.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/24.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)
-(BOOL)push:(id)val
{
    if (val==nil) {
        return NO;
    }
    [self addObject:val];
    return YES;
}

-(id)pop
{
    id val = [self lastObject];
    [self removeLastObject];
    return val;
}
@end
