//
//  Subject11.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/16.
//

#import "Subject11.h"

/**
 11. 盛最多水的容器
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 */

@implementation Subject11

-(NSInteger)maxArea:(NSArray<NSNumber*>*)height
{
    NSInteger i,j,res;
    res = 0;
    i = 0;
    j = height.count-1;
    
    while (i!=j) {
        NSInteger tmp = 0;
        tmp = MIN(height[i].integerValue, height[j].integerValue)*(j-i);
        res = MAX(res, tmp);
        if (height[i].integerValue<=height[j].integerValue) {
            i++;
        }else{
            j--;
        }
    }
    return res;
}

@end
