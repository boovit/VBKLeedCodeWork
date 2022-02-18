//
//  Subject24.m
//  LeedCodeWork
//
//  Created by weibo on 2021/12/14.
//

#import "Subject24.h"

@implementation Subject24
//官方递归
-(ListNode*)officialSwapParis:(ListNode*)head
{
    if(head == nil || head.next == nil){
        return head;
    }
    ListNode *next = head.next;
    head.next = [self officialSwapParis:next.next];
    next.next = head;
    return next;
}

//官方循环
-(ListNode*)official1SwapParis:(ListNode*)head
{
    ListNode *preNode = [ListNode new];
    preNode.next = head;
    ListNode *temp = preNode;
    while (temp.next!=nil && temp.next.next!=nil) {
        ListNode *p1 = temp.next;
        ListNode *p2 = temp.next.next;
        p1.next = p2.next;
        p2.next = p1;
        temp.next = p2;
        temp = temp.next.next;
    }
    return preNode.next;
}

-(ListNode*)swapParis:(ListNode*)head
{
    ListNode *temphead = [ListNode new];
    temphead.next = head;
    [self dfs:temphead];
    return temphead.next;
}

-(void)dfs:(ListNode*)head
{
    ListNode *p1 = head.next;
    ListNode *p2 = p1.next;
    if (p1==nil || p2==nil) {
        return;
    }
    if (p1 && p2) {
        //交换p1 p2
        ListNode *temp = p2.next;
        p1.next = temp;
        p2.next = p1;
        head.next=p2;
    }
    [self dfs:head.next.next];
}
@end
