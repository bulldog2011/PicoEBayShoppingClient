// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "PicoClassSchema.h"
#import "PicoPropertySchema.h"
#import "PicoConstants.h"
#import "PicoBindable.h"
#import "Shopping_AbstractResponseType.h"


@class Shopping_SimpleItemType;

/**
 
    Returns status information for all items in a list. Some of the Item information 
  is returned in an SimpleItemArrayType object, that can include zero, one, or multiple ItemType objects.
 
 
 @ingroup ShoppingInterface
*/
@interface Shopping_GetItemStatusResponseType : Shopping_AbstractResponseType {

@private
    NSMutableArray *_item;

}


/**
 
 Collection of Item status objects in an SimpleItemArrayType object, that can include zero, one, or multiple ItemType objects.
 
 
 entry type : class Shopping_SimpleItemType
*/

@property (nonatomic, retain) NSMutableArray *item;


@end
