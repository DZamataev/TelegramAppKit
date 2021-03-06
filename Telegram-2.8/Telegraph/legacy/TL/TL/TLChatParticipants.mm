#import "TLChatParticipants.h"

#import "../NSInputStream+TL.h"
#import "../NSOutputStream+TL.h"


@implementation TLChatParticipants


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

@implementation TLChatParticipants$chatParticipantsForbidden : TLChatParticipants


- (int32_t)TLconstructorSignature
{
    return (int32_t)0xfd2bb8a;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x975fee04;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLChatParticipants$chatParticipantsForbidden *object = [[TLChatParticipants$chatParticipantsForbidden alloc] init];
    object.chat_id = metaObject->getInt32((int32_t)0x7234457c);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.chat_id;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0x7234457c, value));
    }
}


@end

@implementation TLChatParticipants$chatParticipants : TLChatParticipants


- (int32_t)TLconstructorSignature
{
    return (int32_t)0x7841b415;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x520973ae;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLChatParticipants$chatParticipants *object = [[TLChatParticipants$chatParticipants alloc] init];
    object.chat_id = metaObject->getInt32((int32_t)0x7234457c);
    object.admin_id = metaObject->getInt32((int32_t)0xdf3d1ee7);
    object.participants = metaObject->getArray((int32_t)0xe0e25c28);
    object.version = metaObject->getInt32((int32_t)0x4ea810e9);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.chat_id;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0x7234457c, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.admin_id;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0xdf3d1ee7, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeVector;
        value.nativeObject = self.participants;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0xe0e25c28, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.version;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0x4ea810e9, value));
    }
}


@end

