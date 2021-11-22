//
//  Subject16.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/19.
//

#import "Subject16.h"

/**
 16. 最接近的三数之和
 给你一个长度为 n 的整数数组 nums 和 一个目标值 target。请你从 nums 中选出三个整数，使它们的和与 target 最接近。
 返回这三个数的和。
 假定每组输入只存在恰好一个解。
 
 输入：nums = [-1,2,1,-4], target = 1
 输出：2
 解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
 */

@implementation Subject16
-(NSInteger)threeSumClosest:(NSArray<NSNumber*>*)nums target:(NSInteger)target
{
    NSInteger result = 0;
    //排序
    NSArray<NSNumber*> *sortArr = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *num1 = (NSNumber*)obj1;
        NSNumber *num2 = (NSNumber*)obj2;
        if (num1.integerValue<num2.integerValue) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    
    NSInteger temp = sortArr[0].integerValue+sortArr[1].integerValue+sortArr[2].integerValue;
    for (NSInteger i=0; i<sortArr.count; i++) {
        NSInteger start = i+1;
        NSInteger end = sortArr.count-1;
        while (start<end) {
            NSInteger sum = sortArr[i].integerValue+sortArr[start].integerValue+sortArr[end].integerValue;
            if (labs(target-sum) < labs(target-temp)) {//更接近
                temp = sum;
            }
            if(target < sum){
                end--;
            }else if(target > sum){
                start++;
            }else{
                return sum;
            }
        }
    }
    result = temp;
    return result;
}
@end
