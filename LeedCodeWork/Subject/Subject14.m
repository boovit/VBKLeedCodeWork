//
//  Subject14.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/18.
//

#import "Subject14.h"

/**
 14. 最长公共前缀
 编写一个函数来查找字符串数组中的最长公共前缀。
 如果不存在公共前缀，返回空字符串 ""。

 输入：strs = ["flower","flow","flight"]
 输出："fl"
 */

//循环比较每一位，直到出现不同时，结束比较。
@implementation Subject14
-(NSString*)longestCommonPrefix:(NSArray<NSString*>*)strs
{
    NSString *restr=@"";
    BOOL flag = YES;
    NSInteger index = -1;
    while (flag) {
        index++;
        NSString *compareStr = nil;
        for (NSString *itemStr in strs) {
            if (compareStr==nil) {
                compareStr = [itemStr substringWithRange:NSMakeRange(index, 1)];
            }else{
                NSString *temp = [itemStr substringWithRange:NSMakeRange(index, 1)];
                if (![compareStr isEqualToString:temp]) {//出现不同字符，结束while循环
                    flag = NO;
                    break;
                }
            }
        }
    }
    restr = [strs[0] substringWithRange:NSMakeRange(0,index+1)];
    return restr;
}
@end
