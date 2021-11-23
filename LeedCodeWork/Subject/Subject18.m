//
//  Subject18.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/23.
//

#import "Subject18.h"

/**
 给你一个由 n 个整数组成的数组 nums ，和一个目标值 target 。请你找出并返回满足下述全部条件且不重复的四元组 [nums[a], nums[b], nums[c], nums[d]] （若两个四元组元素一一对应，则认为两个四元组重复）：

 0 <= a, b, c, d < n
 a、b、c 和 d 互不相同
 nums[a] + nums[b] + nums[c] + nums[d] == target
 你可以按 任意顺序 返回答案 。

 输入：nums = [1,0,-1,0,-2,2], target = 0
 输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 
 链接：https://leetcode-cn.com/problems/4sum
 */

@implementation Subject18
-(NSArray<NSArray<NSNumber*>*>*)fourSum:(NSArray<NSNumber*>*)nums target:(NSInteger)target
{
    NSMutableArray *resArr = [NSMutableArray array];
    if (nums.count<4) {
        return [resArr copy];
    }
    //排序
    NSArray<NSNumber*> *sortArr = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *num1 = obj1;
        NSNumber *num2 = obj2;
        if (num1.integerValue<num2.integerValue) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    
    int n = (int)sortArr.count;
    for (int i=0; i<n-3; i++) {
        if(target<sortArr[i].integerValue+sortArr[i+1].integerValue+sortArr[i+2].integerValue+sortArr[i+3].integerValue){//前个数如果大于target，直接结束
            break;
        }
        if (0<i && sortArr[i].integerValue == sortArr[i-1].integerValue) {
            continue;//跳过相同的数
        }
        if(sortArr[i].integerValue+sortArr[n-1].integerValue+sortArr[n-2].integerValue+sortArr[n-3].integerValue<target){//跳过前面更多较小的数
            continue;
        }
        for (int j=i+1; j<n; j++) {
            if (target<sortArr[i].integerValue+sortArr[j].integerValue+sortArr[j+1].integerValue+sortArr[j+2].integerValue) {
                break;
            }
            if (i+1<j && sortArr[j].integerValue == sortArr[j-1].integerValue) {
                continue;
            }
            if (sortArr[i].integerValue+sortArr[j].integerValue+sortArr[n-1].integerValue+sortArr[n-2].integerValue<target) {
                continue;
            }
            int start = j+1;
            int end = (int)sortArr.count-1;
            while (start<end) {
                NSInteger a = sortArr[i].integerValue;
                NSInteger b = sortArr[j].integerValue;
                NSInteger c = sortArr[start].integerValue;
                NSInteger d = sortArr[end].integerValue;
                NSInteger sum = a+b+c+d;
                if (sum==target) {//添加结果
                    [resArr addObjectsFromArray:@[sortArr[i],
                                                  sortArr[j],
                                                  sortArr[start],
                                                  sortArr[end]]];
                    while (start<end &&
                           sortArr[start].integerValue == sortArr[start+1].integerValue)
                    {//跳过左边相同的数
                        start++;
                    }
                    start++;//此时的start是一个与之前不同的数
                    while (start<end &&
                           sortArr[end].integerValue == sortArr[end-1].integerValue)
                    {//跳过右边相同的数
                        end--;
                    }
                    end--;//此时的end是一个与之前不同的数
                }else if (sum<target){
                    start++;
                }else{
                    end--;
                }
            }
        }
    }
    return [resArr copy];
}
@end
