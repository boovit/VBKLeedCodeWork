//
//  Subject17.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/22.
//

#import "Subject17.h"
#import "NSString+Utility.h"

/**
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 */

@implementation Subject17

NSMutableArray<NSString*> *resArr;
-(NSArray<NSString*>*)letterCombinations:(NSString*)digits
{
    resArr = [NSMutableArray array];
    NSDictionary<NSString*,NSString*> *digitMap = @{
                               @"2":@"abc",
                               @"3":@"def",
                               @"4":@"ghi",
                               @"5":@"jkl",
                               @"6":@"mno",
                               @"7":@"pqrs",
                               @"8":@"tuv",
                               @"9":@"wxyz"};
    NSMutableString *tempStr = [NSMutableString string];
    [self recursionFunc:digits map:digitMap temp:tempStr];
    return [resArr copy];
}

-(void)recursionFunc:(NSString*)digits map:(NSDictionary<NSString*,NSString*>*)map temp:(NSMutableString*)temp
{
    if (digits.length<=0) {
        [resArr addObject:temp];
        return;
    }
    NSString *key = [digits oneCharIndex:0];
    NSString *strs = map[key];
    for (int i=0; i<strs.length; i++) {
        NSString *oneChar = [strs oneCharIndex:i];
        [temp appendString:oneChar];
        [self recursionFunc:[digits safe_substringFromIndex:1] map:map temp:temp];
    }
}
@end
