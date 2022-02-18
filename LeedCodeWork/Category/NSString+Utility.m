//
//  NSString+Utility.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/23.
//

#import "NSString+Utility.h"

@implementation NSString (Utility)
-(NSString*)oneCharIndex:(NSUInteger)index
{
    if (self.length<=index) {
        return nil;
    }
    return [self substringWithRange:NSMakeRange(index, 1)];
}

-(NSString*)safe_substringFromIndex:(NSUInteger)index
{
    if (self.length<=index) {
        return nil;
    }
    return [self substringFromIndex:index];
}
@end
