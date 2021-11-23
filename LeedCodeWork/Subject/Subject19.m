//
//  Subject19.m
//  LeedCodeWork
//
//  Created by weibo on 2021/11/23.
//

#import "Subject19.h"
/**
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 */

@interface ListNode : NSObject
@property(nonatomic,assign)int value;
@property(nonatomic,strong)ListNode *next;
@end

@implementation ListNode
@end

@implementation Subject19
-(ListNode*)removeNthFromEnd:(ListNode*)head n:(int)n
{
    ListNode *resNode = head;
    return resNode;
}
@end
