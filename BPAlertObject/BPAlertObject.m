//
//  BPAlertObject.m
//  BPAlertObject
//
//  Created by LiHaozhen on 15/4/29.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import "BPAlertObject.h"

#if __UNDER_IPHONE_8_0
@interface BPAlertObject ()<UIAlertViewDelegate>

@end
#endif

@implementation BPAlertObject

- (void)show:(id)sender
{
#if !__UNDER_IPHONE_8_0
    
    UIViewController *viewController = nil;
    if ([self.delegate isKindOfClass:[UIViewController class]]) {
        viewController = (UIViewController *)self.delegate;
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.title
                                                                             message:self.message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:self.cancel
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action)
    {
        if ([self.delegate respondsToSelector:@selector(alertObjectDidClickCancel:)]) {
            [self.delegate alertObjectDidClickCancel:self];
        }
    }];
    UIAlertAction *otherAct = [UIAlertAction actionWithTitle:self.other
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action)
    {
        if ([self.delegate respondsToSelector:@selector(alertObjectDidClickOther:)]) {
            [self.delegate alertObjectDidClickOther:self];
        }
    }];
    [alertController addAction:cancelAct];
    [alertController addAction:otherAct];

    [viewController presentViewController:alertController
                                      animated:YES completion:nil];
    
#else
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:self.title
                                                        message:self.message
                                                       delegate:self
                                              cancelButtonTitle:self.cancel
                                              otherButtonTitles:self.other, nil];
    [alertView show];
#endif
}

#if __UNDER_IPHONE_8_0
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != alertView.cancelButtonIndex) {
        
        if ([self.delegate respondsToSelector:@selector(alertObjectDidClickOther:)]) {
            [self.delegate alertObjectDidClickOther:self];
        }
    }else{
        
        if ([self.delegate respondsToSelector:@selector(alertObjectDidClickCancel:)]) {
            [self.delegate alertObjectDidClickCancel:self];
        }
    }
}
#endif
@end
