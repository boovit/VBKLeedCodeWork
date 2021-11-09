//
//  Subject2.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/8.
//

#import "Subject2.h"

@implementation Node
@end

@implementation Subject2
-(Node*)node:(Node*)node1 addNode:(Node*)node2
{
    if (node1 == nil && node2 == nil) {
        return nil;
    }else if (node1 != nil && node2 == nil){
        return node1;
    }else if (node1 == nil && node2 != nil){
        return node2;
    }
    Node *resNode = node1;//用node1作为结果保存
    NSInteger carry = 0;
    while (node1 || node2 || carry) {
        node1.value += node2.value + carry;
        carry = node1.value/10;
        node1.value = node1.value%10;
        node1 = node1.next;
        node2 = node2.next;
        
        if (carry==0) {//无进位
            if (node2==nil) {
                break;
            }else if(node2!=nil && node1==nil){
                node1 = node2;
                break;
            }
        }else{//有进位
            if (node1==nil && node2!=nil) {
                node1 = node2;
                node2 = nil;
            }else if (node1==nil && node2 == nil){
                node1 = [Node new];
            }
        }
    }
    return resNode;
}
@end
