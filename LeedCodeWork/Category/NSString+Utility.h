//
//  NSString+Utility.h
//  LeedCodeWork
//
//  Created by weibo on 2021/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Utility)
-(NSString*)oneCharIndex:(NSUInteger)index;
-(NSString*)safe_substringFromIndex:(NSUInteger)index;
@end

NS_ASSUME_NONNULL_END
