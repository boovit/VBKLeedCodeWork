//
//  Subject5.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/12.
//

#import "Subject5.h"

@implementation Subject5
-(int)revertInt:(int)number
{
    int res = 0;
    int last = 0;
    while (number!=0) {
        last = res;
        int tmp = number%10;
        res = res*10 + tmp;
        number = number/10;
        if (res/10 != last) {//判断溢出
            return 0;
        }
    }
    return res;
}
@end
