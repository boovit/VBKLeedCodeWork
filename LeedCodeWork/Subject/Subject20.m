//
//  Subject20.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/24.
//

#import "Subject20.h"
#import "NSMutableArray+Stack.h"
#import "NSString+Utility.h"

/**
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 
 输入：s = "( ) [ ] { }"
 输出：true
 
 输入：s = "( [ ) ]"
 输出：false
 
 输入：s = "{ [ ] }"
 输出：true

 链接：https://leetcode-cn.com/problems/valid-parentheses
 */

NSMutableArray<NSString*> *stackArr = nil;

@implementation Subject20
//使用栈结构
-(BOOL)isValid:(NSString*)string
{
    if (string.length<=0) {
        return NO;
    }
    BOOL res = NO;
    stackArr = [NSMutableArray new];
    NSDictionary<NSString*,NSString*> *dic = @{@"(":@")",@"[":@"]",@"{":@"}"};
    for (int i=0; i<string.length; i++) {
        NSString *oneChar = [string oneCharIndex:i];
        if ([oneChar isEqualToString:@")"] ||
            [oneChar isEqualToString:@"]"] ||
            [oneChar isEqualToString:@"}"] ) {
            NSString *popStr = [stackArr pop];//出栈
            if (![dic[popStr] isEqualToString:oneChar]) {
                return NO;
            }
        }else{
            [stackArr push:oneChar];//入栈
        }
    }
    if (stackArr.count<=0) {
        res = YES;
    }
    return res;
}


@end
