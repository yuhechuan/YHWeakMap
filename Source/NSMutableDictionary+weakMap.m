//
//  NSMutableDictionary+weakMap.m
//  YHWeakMap
//
//  Created by ruaho on 2019/7/17.
//  Copyright © 2019 ruaho. All rights reserved.
//

#import "NSMutableDictionary+weakMap.h"

typedef id(^WeakReference)(void);

@implementation NSMutableDictionary (weakMap)

- (nullable id)weak_objectForKey:(id <NSCopying>)aKey {
    id object = [self objectForKey:aKey];
    
    NSString *blockClass = [NSString stringWithFormat:@"%s",object_getClassName([object class])];
    if ([blockClass isEqualToString:@"__NSMallocBlock__"]) {
        return weakReferenceNonretainedObjectValue(object);
    }
    return [self objectForKey:aKey];
}

- (void)weak_setObject:(id)anObject forKey:(id <NSCopying>)aKey {
    [self setObject:makeWeakReference(anObject) forKey:aKey];
}


WeakReference makeWeakReference(id anObject){
    __weak id weakAnObject = anObject;
    return ^{
        return weakAnObject;
    };
}

id weakReferenceNonretainedObjectValue(WeakReference ref) {
    return ref?ref():nil;
}

@end
