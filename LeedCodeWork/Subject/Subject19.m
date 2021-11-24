//
//  Subject19.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/23.
//

#import "Subject19.h"
/**
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 
 1->2->3->4->5  n=2
 1->2->3->5
 */

@implementation Subject19
//双指针测距法
-(ListNode*)removeNthFromEnd:(ListNode*)head n:(int)n
{
    ListNode *preNode = [ListNode new];//前向节点
    preNode.next = head;
    ListNode *fir = head;
    ListNode *sec = head;
    for (int i=0; i<n; i++) {
        fir = fir.next;
    }
    while (fir.next!=nil) {
        fir = fir.next;
        sec = sec.next;
    }
    
    sec.next = sec.next.next;
    return preNode.next;
}
@end
