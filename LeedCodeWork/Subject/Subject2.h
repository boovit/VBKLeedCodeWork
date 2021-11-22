//
//  Subject2.h
//  LeedCodeWork
//
//  Created by weibo on 2021/11/8.
//

#import "SubjectObject.h"

/*
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 -------------------------------------
 提示：
 每个链表中的节点数在范围 [1, 100] 内
 0 <= Node.val <= 9
 题目数据保证列表表示的数字不含前导零
 */

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property(nonatomic,strong)Node *next;
@property(nonatomic,assign)NSInteger value;
@end

@interface Subject2 : SubjectObject

@end

NS_ASSUME_NONNULL_END
