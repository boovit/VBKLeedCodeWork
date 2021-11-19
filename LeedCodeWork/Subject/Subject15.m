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
-(NSArray<NSNumber*>*)threeSum:(NSArray<NSNumber*>*)nums
{
    NSArray<NSNumber*> *resArr = nil;
    //升序排列
    NSArray<NSNumber*> *sortArr = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *num1 = (NSNumber*)obj1;
        NSNumber *num2 = (NSNumber*)obj2;
        if (num1.integerValue<num2.integerValue) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    return resArr;
}
@end
