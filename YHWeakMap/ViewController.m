//
//  ViewController.m
//  YHWeakMap
//
//  Created by ruaho on 2019/7/17.
//  Copyright © 2019 ruaho. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableDictionary+weakMap.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableDictionary *weakMap;
@property (nonatomic, strong) UIView *strongView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
    // Do any additional setup after loading the view.
}

- (void)test1 {
    _weakMap = [NSMutableDictionary dictionary];
    _strongView = [[UIView alloc]init];
    UIView *weakView = [[UIView alloc]init];
    
    _weakMap[@"weakView"] = weakView;
    _weakMap[@"strongView"] = _strongView;
}

- (void)test2 {
    _weakMap = [NSMutableDictionary dictionary];
    _strongView = [[UIView alloc]init];
    UIView *weakView = [[UIView alloc]init];
    
    [_weakMap weak_setObject:weakView forKey:@"weakView"];
    [_weakMap weak_setObject:_strongView forKey:@"strongView"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"strongView == %@ weakView == %@",[_weakMap weak_objectForKey:@"strongView"],[_weakMap weak_objectForKey:@"weakView"]);
}

@end
