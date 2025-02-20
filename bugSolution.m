The solution involves removing the redundant release and using a temporary variable. The original code released the string twice — once when the `MyClass` object's `dealloc` method is called and once directly before assigning it to `myObject.myString`. 

The corrected code is shown below:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, retain) NSString *myString;
@end

@implementation MyClass
- (void)dealloc {
    [myString release];
    [super dealloc];
}
@end

// ...in some other method...
MyClass *myObject = [[MyClass alloc] init];
NSString *tempString = [[NSString alloc] initWithString: @"Hello"];
myObject.myString = tempString; // Assign the string after creating it
[tempString release]; //Properly release the temp string
[myObject release];
```

By using a temporary variable `tempString`, we ensure that the string is only released once, preventing the double-release.  In modern Objective-C with Automatic Reference Counting (ARC), this problem mostly disappears, but understanding this fundamental concept is crucial when working with older codebases or custom memory management scenarios.