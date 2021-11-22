//
//  Subject15.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/19.
//

#import "Subject15.h"

/**
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
 注意：答案中不可以包含重复的三元组。
 
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 
 */

@implementation Subject15
-(NSArray<NSArray<NSNumber*>*>*)threeSum:(NSArray<NSNumber*>*)nums
{
    NSMutableArray<NSArray<NSNumber*>*> *resArr = [NSMutableArray array];
    if (nums==nil || nums.count<3) {//边界情况
        return [resArr copy];
    }
    //1.升序排列
    NSArray<NSNumber*> *sortArr = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *num1 = (NSNumber*)obj1;
        NSNumber *num2 = (NSNumber*)obj2;
        if (num1.integerValue<num2.integerValue) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    
    NSUInteger len = sortArr.count;
    
    for (NSUInteger i=0; i<len; i++) {
        if (sortArr[i].integerValue>0) {//全是正数
            break;
        }
        if(0<i && sortArr[i]==sortArr[i-1])continue;//去重
        NSUInteger L = i+1;
        NSUInteger R = len-1;
        while (L<R) {
            NSInteger sum = sortArr[i].integerValue+sortArr[L].integerValue+sortArr[R].integerValue;
            if (sum == 0) {//符合要求
                NSArray *temp = @[sortArr[i],sortArr[L],sortArr[R]];
                [resArr addObject:temp];
                while (L<R && sortArr[L].integerValue == sortArr[L+1].integerValue) {
                    L++;
                }
                while (L<R && sortArr[R].integerValue == sortArr[R-1].integerValue) {
                    R--;
                }
                L++;
                R--;
            }
            else if (sum<0){
                L++;
            }
            else if (sum>0){
                R--;
            }
        }
    }
    
    return [resArr copy];
}
@end
