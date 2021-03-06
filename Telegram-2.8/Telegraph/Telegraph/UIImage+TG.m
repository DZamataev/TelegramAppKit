/*
 * This is the source code of Telegram for iOS v. 1.1
 * It is licensed under GNU GPL v. 2 or later.
 * You should have received a copy of the license in this archive (see LICENSE).
 *
 * Copyright Peter Iakovlev, 2013.
 */

#import "UIImage+TG.h"

#import <objc/runtime.h>

static const void *staticBackdropImageDataKey = "staticBackdropImageDataKey";
static const void *extendedInsetsKey = &extendedInsetsKey;

@implementation UIImage (TG)

- (NSDictionary *)attachmentsDictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    TGStaticBackdropImageData *staticBackdropImageData = [self staticBackdropImageData];
    if (staticBackdropImageData != nil)
        dict[[[NSString alloc] initWithCString:staticBackdropImageDataKey encoding:NSUTF8StringEncoding]] = staticBackdropImageData;
    
    return dict;
}

- (void)setAttachmentsFromDictionary:(NSDictionary *)attachmentsDictionary
{
    [self setStaticBackdropImageData:attachmentsDictionary[[[NSString alloc] initWithCString:staticBackdropImageDataKey encoding:NSUTF8StringEncoding]]];
}

- (TGStaticBackdropImageData *)staticBackdropImageData
{
    return objc_getAssociatedObject(self, staticBackdropImageDataKey);
}

- (void)setStaticBackdropImageData:(TGStaticBackdropImageData *)staticBackdropImageData
{
    objc_setAssociatedObject(self, staticBackdropImageDataKey, staticBackdropImageData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)extendedEdgeInsets
{
    id value = objc_getAssociatedObject(self, extendedInsetsKey);
    if (value != nil)
        return [(NSValue *)value UIEdgeInsetsValue];
    return UIEdgeInsetsZero;
}

- (void)setExtendedEdgeInsets:(UIEdgeInsets)edgeInsets
{
    objc_setAssociatedObject(self, extendedInsetsKey, [NSValue valueWithUIEdgeInsets:edgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
