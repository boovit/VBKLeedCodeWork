//
//  Subject17.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/22.
//

#import "Subject17.h"

/**
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

@implementation Subject17
-(NSArray<NSString*>*)letterCombinations:(NSString*)digits
{
    NSMutableArray<NSString*> *resArr = [NSMutableArray array];
    NSDictionary *digitMap = @{@"2":@"abc",
                               @"3":@"def",
                               @"4":@"ghi",
                               @"5":@"jkl",
                               @"6":@"mno",
                               @"7":@"pqrs",
                               @"8":@"tuv",
                               @"9":@"wxyz"};
    for (int i=0; i<digits.length; i++) {
        
    }
    return [resArr copy];
}
@end
