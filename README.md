This repository demonstrates a common error in Objective-C memory management using Manual Reference Counting (MRC).  The `bug.m` file contains code that exhibits a double-release of an NSString object, leading to a crash.  The `bugSolution.m` file provides the corrected version, highlighting the proper handling of `retain` and `release` to prevent this error. This is particularly important to understand for developers working with legacy Objective-C code or in environments where ARC is not used.  Understanding this can save countless debugging hours.

**Key Concepts:**
* Manual Reference Counting (MRC)
* `retain`, `release`, `dealloc`
* Avoiding double-free errors