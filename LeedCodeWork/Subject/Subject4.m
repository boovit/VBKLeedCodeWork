//
//  Subject4.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/12.
//

#import "Subject4.h"

/*
 *
 A     G     M
 B   F H   L N
 C E   I K   O
 D     J
 */

@implementation Subject4
-(NSString*)convert1:(NSString*)str row:(NSInteger)row
{
    NSString *resStr = nil;
    NSInteger index = 0;
    NSInteger rowNum = 0;
    BOOL flag = NO;
    NSMutableArray<NSMutableString *> *arr = [NSMutableArray arrayWithCapacity:row];
    while (index<str.length) {
        NSString *charStr = [self safe_getSubString:str index:index];
        NSMutableString *rowStr = arr[rowNum];
        if (rowStr==nil) {
            rowStr = [NSMutableString string];
            arr[rowNum] = rowStr;
        }
        [rowStr appendString:charStr];
        if (rowNum==0) {
            flag=NO;
        }else if (rowNum==row-1){
            flag=YES;
        }
        if (flag==NO) {//向下
            rowNum++;
        }else{//向上
            rowNum--;
        }
        index++;
    }
    resStr = [arr componentsJoinedByString:@""];
    return resStr;
}

-(NSString*)convert2:(NSString*)str row:(NSInteger)row
{
    NSInteger len = str.length;
    NSInteger oneGroup = row*2-2;
    NSInteger groupNum = len/oneGroup;
    if (len%oneGroup>0) {
        groupNum++;
    }
    
    NSMutableString *resStr = [NSMutableString string];
    for (int i=0; i<row; i++) {//三行
        for (int j=0;j<groupNum;j++) {//分组
            if (i==0 || i==row-1) {//第一行 最后一行
                NSInteger indx = i+j*oneGroup;
                NSString *charStr = [self safe_getSubString:str index:indx];
                if (charStr) {
                    [resStr appendString:charStr];
                }
            }else{//中间行
                NSInteger indx = i+j*oneGroup;
                NSString *charStr = [self safe_getSubString:str index:indx];
                if (charStr) {
                    [resStr appendString:charStr];
                }
                indx = indx+(row-i)*2-2;
                charStr = [self safe_getSubString:str index:indx];
                if (charStr) {
                    [resStr appendString:charStr];
                }
            }
            
        }
    }
    return resStr;
}

-(NSString*)safe_getSubString:(NSString*)s index:(NSInteger)index
{
    if (s.length<=index) {
        return nil;
    }
    return [s substringWithRange:NSMakeRange(index, 1)];
}

@end
