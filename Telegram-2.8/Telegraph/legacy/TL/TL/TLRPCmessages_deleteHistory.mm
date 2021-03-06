#import "TLRPCmessages_deleteHistory.h"

#import "../NSInputStream+TL.h"
#import "../NSOutputStream+TL.h"

#import "TLInputPeer.h"
#import "TLmessages_AffectedHistory.h"

@implementation TLRPCmessages_deleteHistory


- (Class)responseClass
{
    return [TLmessages_AffectedHistory class];
}

- (int)impliedResponseSignature
{
    return (int)0xb7de36f2;
}

- (int)layerVersion
{
    return 8;
}

- (int32_t)TLconstructorSignature
{
    TGLog(@"constructorSignature is not implemented for base type");
    return 0;
}

- (int32_t)TLconstructorName
{
    TGLog(@"constructorName is not implemented for base type");
    return 0;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)__unused metaObject
{
    TGLog(@"TLbuildFromMetaObject is not implemented for base type");
    return nil;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)__unused values
{
    TGLog(@"TLfillFieldsWithValues is not implemented for base type");
}


@end

@implementation TLRPCmessages_deleteHistory$messages_deleteHistory : TLRPCmessages_deleteHistory


- (int32_t)TLconstructorSignature
{
    return (int32_t)0xf4f8fb61;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x90004f94;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLRPCmessages_deleteHistory$messages_deleteHistory *object = [[TLRPCmessages_deleteHistory$messages_deleteHistory alloc] init];
    object.peer = metaObject->getObject((int32_t)0x9344c37d);
    object.offset = metaObject->getInt32((int32_t)0xfc56269);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeObject;
        value.nativeObject = self.peer;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0x9344c37d, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.offset;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0xfc56269, value));
    }
}


@end

