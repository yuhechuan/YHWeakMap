//
//  NSMutableDictionary+weakMap.h
//  YHWeakMap
//
//  Created by ruaho on 2019/7/17.
//  Copyright © 2019 ruaho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (weakMap)

- (nullable id)weak_objectForKey:(id <NSCopying>)aKey;
- (void)weak_setObject:(id)anObject forKey:(id <NSCopying>)aKey;


@end

NS_ASSUME_NONNULL_END
