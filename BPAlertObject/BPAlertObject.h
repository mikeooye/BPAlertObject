//
//  BPAlertObject.h
//  BPAlertObject
//
//  Created by LiHaozhen on 15/4/29.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if (defined (__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0)

#define __UNDER_IPHONE_8_0 1
#endif

@protocol BPAlertObjectDelegate;
@interface BPAlertObject : NSObject

@property (copy, nonatomic) IBInspectable NSString *title;
@property (copy, nonatomic) IBInspectable NSString *message;
@property (copy, nonatomic) IBInspectable NSString *cancel;
@property (copy, nonatomic) IBInspectable NSString *other;

@property (weak, nonatomic) IBOutlet id<BPAlertObjectDelegate> delegate;

- (IBAction)show:(id)sender;

@end

@protocol BPAlertObjectDelegate <NSObject>

@optional
- (void)alertObjectDidClickCancel:(BPAlertObject *)obj;
- (void)alertObjectDidClickOther:(BPAlertObject *)obj;
@end
