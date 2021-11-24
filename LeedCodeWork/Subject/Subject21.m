//
//  Subject21.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/24.
//

#import "Subject21.h"

/**
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 1->3->4->6->8
 2->3->4->5
 
 1->2->3->3->4->4->5->6->8
 */
//迭代法 按顺序链接
@implementation Subject21
-(ListNode*)mergeTwoLists:(ListNode*)firstNode second:(ListNode*)secNode
{
    ListNode *preNode = [ListNode new];
    ListNode *headNode = preNode;
    while (firstNode && secNode) {
        if(firstNode.value <= secNode.value){
            preNode.next = firstNode;
            firstNode = firstNode.next;
        }else{
            preNode.next = secNode;
            secNode = secNode.next;
        }
        preNode = preNode.next;
    }
    if (firstNode) {
        preNode.next = firstNode;
    }
    if (secNode) {
        preNode.next = secNode;
    }
    return headNode.next;
}

//递归法 
-(ListNode*)mergeTwoListsFun:(ListNode*)firstNode second:(ListNode*)secNode
{
    if (firstNode && secNode) {
        ListNode *temp1 = firstNode.next;
        ListNode *temp2 = secNode.next;
        if (firstNode.value<=secNode.value) {
            firstNode.next = secNode;
            secNode.next = [self mergeTwoListsFun:temp1 second:temp2];
            return firstNode;
        }else{
            secNode.next = firstNode;
            firstNode.next = [self mergeTwoListsFun:temp1 second:temp2];
            return secNode;
        }
    }else if(firstNode){
        return firstNode;
    }else if(secNode){
        return secNode;
    }
    return nil;
}
@end
