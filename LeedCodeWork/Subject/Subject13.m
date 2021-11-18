//
//  Subject13.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/18.
//

#import "Subject13.h"

/**
 罗马字符转整数
 */

static const NSDictionary<NSString*,NSNumber*> *dic = @{@"I":@1,
                                                        @"V":@5,
                                                        @"X":@10,
                                                        @"L":@50,
                                                        @"C":@100,
                                                        @"D":@500,
                                                        @"M":@1000};

@implementation Subject13
-(int)romanToInt:(NSString*)roman
{
    int res=0;
    NSInteger len = roman.length;
    for (NSInteger i=0; i<len; i++) {
        NSString *oneChar = [roman substringWithRange:NSMakeRange(i, 1)];
        NSNumber *val = dic[oneChar];
        if (i<len-1) {
            NSString *behindSubStr = [roman substringWithRange:NSMakeRange(i+1, 1)];
            NSNumber *behindVal = dic[behindSubStr];
            if (val<behindVal) {
                res-=val.intValue;
            }else{
                res+=val.intValue;
            }
        }else{
            res+=val.intValue;
        }
    }
    return res;
}
@end
