//
//  Subject12.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/17.
//

#import "Subject12.h"

/**
 int整数转罗马字符
 I           1
 V          5
 X          10
 L          50
 C          100
 D          500
 M          1000
 */
static const NSArray<NSString*> *onebit = @[@"",@"I",@"II",@"III",@"IV",@"V",@"VI",@"VII",@"VIII",@"IX"];
static const NSArray<NSString*> *tenbit = @[@"",@"X",@"XX",@"XXX",@"XL",@"L",@"LX",@"LXX",@"LXXX",@"XC"];
static const NSArray<NSString*> *hundbit = @[@"",@"C",@"CC",@"CCC",@"CD",@"D",@"DC",@"DCC",@"DCCC",@"CM"];
static const NSArray<NSString*> *thousbit = @[@"",@"M",@"MM",@"MMM",@"",@"",@"",@"",@"",@""];

@implementation Subject12
//官方 硬编码
-(NSString*)intToRomanFun:(int)num
{
    int one = num%10;
    int ten = num/10%10;
    int hun = num/100%10;
    int tho = num/1000;
    NSString *res = [NSString stringWithFormat:@"%@%@%@%@",thousbit[tho],hundbit[hun],tenbit[ten],onebit[one]];
    return res;
}

-(NSString*)intToRoman:(int)num
{
    NSString *restr = @"";
    NSMutableArray *arr = [NSMutableArray new];
    int i = 0;
    while (num!=0) {
        int temp = num%10;
        num = num/10;
        NSString *tempRoman;
        switch (i) {
            case 0://个
            {
                tempRoman = [self tempInt:temp oneStr:@"I" fiveStr:@"V" tenStr:@"X"];
            }
                break;
            case 1://十
            {
                tempRoman = [self tempInt:temp oneStr:@"X" fiveStr:@"L" tenStr:@"C"];
            }
                break;
            case 2://百
            {
                tempRoman = [self tempInt:temp oneStr:@"C" fiveStr:@"D" tenStr:@"M"];
            }
                break;
            case 3://千
            {
                tempRoman = [self tempInt:temp oneStr:@"M" fiveStr:@"" tenStr:@""];
            }
                break;
            default:
                break;
        }
        i++;
        [arr insertObject:tempRoman atIndex:0];
    }
    restr = [arr componentsJoinedByString:@""];
    return restr;
}

-(NSString*)tempInt:(int)temp oneStr:(NSString*)one fiveStr:(NSString*)five tenStr:(NSString*)ten
{
    NSMutableString *str = [NSMutableString string];
    if (0<temp && temp<=3) {
        for (int i=0; i<temp; i++) {
            [str appendString:one];
        }
    }else if (3<temp && temp<5){
        str = [NSString stringWithFormat:@"%@%@",five,one].mutableCopy;
    }else if (temp==5){
        str = [five mutableCopy];
    }else if (5<temp && temp<=8){
        for (int i=0; i<(temp-5); i++) {
            [str appendString:one];
        }
        [str appendString:five];
    }else{
        str = [NSString stringWithFormat:@"%@%@",ten,one].mutableCopy;
    }
    return [str copy];
}
@end
