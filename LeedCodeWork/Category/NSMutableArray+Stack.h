//
//  NSMutableArray+Stack.h
//  LeedCodeWork
//
//  Created by weibo on 2021/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Stack)
-(BOOL)push:(id)val;
-(id)pop;
@end

NS_ASSUME_NONNULL_END
