PicoEBayShoppingClient
======================

Pico Objective-C Client for the [eBay Shopping API](https://www.x.com/developers/ebay/products/shopping-api)

## Note
1. This is only the proxy part of the PicoEBayShoppingClient, you need to integrate with [Pico Runtime](https://github.com/bulldog2011/pico) before you can use this proxy, please follow instructions on Pico github site to add the Pico runtime library and the PicoEBayShoppingClient in your iOS app, you may also start with the sample mentioned in Reference Sample section below. 
2. You need to fill in `eBayAppId` in `EBayShoppingServiceClient` before your app can invoke eBay Shopping service.
3. Besides proxy code, this site also hosts the [appledoc for the PicoEBayShoppingClient](http://bulldog2011.github.com/PicoEBayShoppingClient/). 

##Example Usage
With this proxy and the generic Pico runtime library, eBay Shopping API invocation on iOS platform is quite simple:

``` objective-c

        // start progress activity
        [self.view makeToastActivity];
        
        // Get shared service client
        EBayShoppingServiceClient *shoppingClient = [EBayShoppingServiceClient sharedClient];
        shoppingClient.debug = YES; // enable request/response message logging
        
        // Build request object
        Shopping_FindPopularItemsRequestType *request = [[[Shopping_FindPopularItemsRequestType alloc] init] autorelease];
        request.queryKeywords = _searchText.text;
        // only need one item for demo
        request.maxEntries = [NSNumber numberWithInt:1];
        
        // make API call and register callbacks
        [shoppingClient findPopularItems:request success:^(Shopping_FindPopularItemsResponseType *responseObject) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
            if ([Shopping_AckCodeType_SUCCESS isEqualToString:responseObject.ack]) {
            
                if (responseObject.itemArray.item.count > 0) {
                    // show the title of the first found item
                    Shopping_SimpleItemType *item = [responseObject.itemArray.item objectAtIndex:0];
                    
                    // start image downloading progress activity
                    [self.view makeToastActivity];
                    // get gallery image
                    NSURL *imageURL = [NSURL URLWithString:item.galleryURL];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    // stop progress activity
                    [self.view hideToastActivity];
                    
                    UIImage *image = [UIImage imageWithData:imageData];
                    [self.view makeToast:item.title duration:3.0 position:@"center" title:@"Success" image:image];
                } else {
                    
                    // no result
                    [self.view makeToast:@"No result" duration:3.0 position:@"center"];
                }
                
            } else { // response resident error
                Shopping_ErrorType *error = [responseObject.errors objectAtIndex:0];
                [self.view makeToast:error.shortMessage duration:3.0 position:@"center" title:@"Error"];
            }
        } failure:^(NSError *error) {
            
            [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
        }];

        
```

## Reference Sample 

* [eBayShopping](https://github.com/bulldog2011/pico/tree/master/Examples/eBayShopping) - Hello world like sample using [eBay Shopping API](https://www.x.com/developers/ebay/products/shopping-api) XML call.
* [eBayDemoApp](https://github.com/bulldog2011/pico/tree/master/Examples/eBayDemoApp) - Sample eBay Search App using both eBay Finding API and eBay Shopping API.

##Docs
1. [Wsdl Driven Development on iOS - the Big Picture](http://bulldog2011.github.com/blog/2013/03/25/wsdl-driven-development-on-ios-the-big-picture/)
2. [Pico Tutorial 4 - Hello eBay Shopping Service](http://bulldog2011.github.com/blog/2013/03/30/pico-tutorial-4-hello-ebay-shopping/)


##Copyright and License
(The MIT License)

Copyright (c) 2013 Leansoft Technology <51startup@sina.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 