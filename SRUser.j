@import "SRObject.j"
@import "SRJID.j"

SRAvailable = 0;
SRNotAvailable = 1;
SROffline = 2;

@implementation SRUser : SRObject
{
    SRJID JID;
    CPString name;
    CPString status;
    unsigned available;
}

+ (SRUser)userWithJID:(CPString)aJID connection:(SRJabberConnection)aConnection
{
    return [[self alloc] initWithJID:aJID connection:aConnection];
}

- (SRUser)initWithJID:(CPString)aJID connection:(SRJabberConnection)aConnection
{
    [super initWithConnection:aConnection]

    JID = [SRJID JIDWithStringJID:aJID];
    name = null;
    status = "";
    available = SRAvailable;

    return self;
}

- (CPString)JID
{
    return [JID description];
}

- (CPString)bareJID
{
    return [JID bare];
}

- (CPString)escapedJID
{
    return [JID escaped];
}

- (CPString)unescapedJID
{
    return [JID unescaped];
}

- (CPString)JIDNode
{
    return [JID node];
}

- (CPString)JIDDomain
{
    return [JID domain];
}

- (CPString)JIDResource
{
    return [JID resource];
}

- (CPString)name
{
    return name || [JID node];
}

@end
