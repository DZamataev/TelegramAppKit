#import "TGGroupAvatarGalleryModel.h"

#import "TGGroupAvatarGalleryItem.h"

#import "ActionStage.h"
#import "TGDatabase.h"

#import "TGImageMediaAttachment.h"
#import "TGGenericPeerMediaGalleryDefaultHeaderView.h"
#import "TGGenericPeerMediaGalleryActionsAccessoryView.h"

#import "TGActionSheet.h"

#import "TGAlertView.h"

#import <AssetsLibrary/AssetsLibrary.h>

@implementation TGGroupAvatarGalleryModel

- (instancetype)initWithMessageId:(int32_t)messageId legacyThumbnailUrl:(NSString *)legacyThumbnailUrl legacyUrl:(NSString *)legacyUrl imageSize:(CGSize)imageSize
{
    self = [super init];
    if (self != nil)
    {
        TGGroupAvatarGalleryItem *item = [[TGGroupAvatarGalleryItem alloc] initWithMessageId:messageId legacyThumbnailUrl:legacyThumbnailUrl legacyUrl:legacyUrl imageSize:imageSize];
        [self _replaceItems:@[item] focusingOnItem:item];
    }
    return self;
}

- (UIView<TGModernGalleryDefaultFooterAccessoryView> *)createDefaultLeftAccessoryView
{
    TGGenericPeerMediaGalleryActionsAccessoryView *accessoryView = [[TGGenericPeerMediaGalleryActionsAccessoryView alloc] init];
    __weak TGGroupAvatarGalleryModel *weakSelf = self;
    accessoryView.action = ^(id<TGModernGalleryItem> item)
    {
        if ([item isKindOfClass:[TGGroupAvatarGalleryItem class]])
        {
            __strong TGGroupAvatarGalleryModel *strongSelf = weakSelf;
            if (strongSelf != nil)
            {
                UIView *actionSheetView = nil;
                if (strongSelf.actionSheetView)
                    actionSheetView = strongSelf.actionSheetView();
                
                if (actionSheetView != nil)
                {
                    NSMutableArray *actions = [[NSMutableArray alloc] init];
                    
                    if ([strongSelf _isDataAvailableForSavingItemToCameraRoll:item])
                    {
                        [actions addObject:[[TGActionSheetAction alloc] initWithTitle:TGLocalized(@"Preview.SaveToCameraRoll") action:@"save" type:TGActionSheetActionTypeGeneric]];
                    }
                    [actions addObject:[[TGActionSheetAction alloc] initWithTitle:TGLocalized(@"Common.Cancel") action:@"cancel" type:TGActionSheetActionTypeCancel]];
                    
                    [[[TGActionSheet alloc] initWithTitle:nil actions:actions actionBlock:^(__unused id target, NSString *action)
                    {
                        __strong TGGroupAvatarGalleryModel *strongSelf = weakSelf;
                        if ([action isEqualToString:@"save"])
                            [strongSelf _commitSaveItemToCameraRoll:item];
                    } target:strongSelf] showInView:actionSheetView];
                }
            }
        }
    };
    return accessoryView;
}

- (bool)_isDataAvailableForSavingItemToCameraRoll:(id<TGModernGalleryItem>)item
{
    if ([item isKindOfClass:[TGGroupAvatarGalleryItem class]])
    {
        TGGroupAvatarGalleryItem *avatarItem = (TGGroupAvatarGalleryItem *)item;
        return [[NSFileManager defaultManager] fileExistsAtPath:[avatarItem filePath]];
    }
    
    return false;
}

- (void)_commitSaveItemToCameraRoll:(id<TGModernGalleryItem>)item
{
    if ([item isKindOfClass:[TGGroupAvatarGalleryItem class]])
    {
        TGGroupAvatarGalleryItem *avatarItem = (TGGroupAvatarGalleryItem *)item;
        NSData *data = [[NSData alloc] initWithContentsOfFile:[avatarItem filePath]];
        [self _saveImageDataToCameraRoll:data];
    }
}

- (void)_saveImageDataToCameraRoll:(NSData *)data
{
    if (data == nil)
        return;
    
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    
    __block __strong ALAssetsLibrary *blockLibrary = assetsLibrary;
    [assetsLibrary writeImageDataToSavedPhotosAlbum:data metadata:nil completionBlock:^(NSURL *assetURL, NSError *error)
    {
        if (error != nil)
        {
            dispatch_async(dispatch_get_main_queue(), ^
            {
                TGAlertView *alertView = [[TGAlertView alloc] initWithTitle:nil message:@"An error occured" delegate:nil cancelButtonTitle:TGLocalized(@"Common.Cancel") otherButtonTitles:nil];
                [alertView show];
            });
        }
        else
            TGLog(@"Saved to %@", assetURL);
        
        blockLibrary = nil;
    }];
}

@end
