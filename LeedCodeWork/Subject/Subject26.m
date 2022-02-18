//
//  Subject26.m
//  LeedCodeWork
//
//  Created by weibo on 2021/12/21.
//

#import "Subject26.h"
/**
 26.删除有序数组中的重复项
 
 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。
 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

 */
@implementation Subject26
//双指针
-(NSInteger)removeDuplicates:(NSMutableArray<NSNumber*>*)nums
{
    if (nums.count<=0) {
        return 0;
    }
    NSInteger i = 0,j = 1;
    while (j<nums.count) {
        if(nums[i].integerValue == nums[j].integerValue){//相等
            j++;
        }else{//不等
            nums[++i] = nums[j++];
        }
    }
    return i+1;
}
@end
