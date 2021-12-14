//
//  Subject22.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/24.
//

#import "Subject22.h"

/**
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 有效括号组合需满足：左括号必须以正确的顺序闭合。
 
 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 
 输入：n = 1
 输出：["()"]
 
 n=1   ( )
 n=2   ( )
 */

@implementation Subject22
//递归，剪枝
-(NSArray<NSString*>*)generateParenthesis:(int)n
{
    NSMutableArray *arr = [NSMutableArray array];
    if (n<=0) {
        return [arr copy];
    }
    [self DFS:@"(" left:n-1 right:n array:arr];
    return [arr copy];
}

-(void)DFS:(NSString*)curString left:(int)left right:(int)right array:(NSMutableArray<NSString*>*)arr
{
    if (left==0 && right==0) {
        [arr addObject:curString];
        return;
    }
    
    if (left>right) {//此时会出现这样的错误情况：())
        return;
    }
    
    if (0<left) {
        [self DFS:[self addS1:curString S2:@"("] left:left-1 right:right array:arr];
    }
    
    if (0<right) {
        [self DFS:[self addS1:curString S2:@")"] left:left right:right-1 array:arr];
    }
}

-(NSString*)addS1:(NSString*)s1 S2:(NSString*)s2
{
    return [NSString stringWithFormat:@"%@%@",s1,s2];
}
@end
