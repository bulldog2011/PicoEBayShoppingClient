// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Shopping_GetCategoryInfoRequestType.h"

@implementation Shopping_GetCategoryInfoRequestType

@synthesize categoryID = _categoryID;
@synthesize includeSelector = _includeSelector;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    PicoClassSchema *cs = [[PicoClassSchema alloc] initWithXmlName:@"GetCategoryInfoRequest" nsUri:@"urn:ebay:apis:eBLBaseComponents"];
    [cs autorelease];
    return cs;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"CategoryID" propertyName:@"categoryID" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"categoryID"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"IncludeSelector" propertyName:@"includeSelector" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"includeSelector"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.categoryID = nil;
    self.includeSelector = nil;
    [super dealloc];
}

@end