// <XLTestLog>
// Aspect-XCTestConsoleMessage.m
//
// Copyright (c) 2015 Xaree Lee (Kang-Yu Lee)
// Released under the MIT license (see below)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import <XAspect/XAspect.h>
#import <XCTest/XCTestLog.h>
#import "XCTestConsoleMessage.h"

#define AtAspect XCTestConsoleMessage

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#define AtAspectOfClass XCTestLog
@classPatchField(XCTestLog)
#pragma clang diagnostic pop

AspectPatch(-, void, testLogWithFormat:(NSString *)format arguments:(va_list)arguments)
{
  // Intercept the Objective-C messaging for specific XCTest string construction,
  // print new messages on the console for coloring, and return `nil`.
  printf("%s", [[XCTestConsoleMessage testLogWithFormat:format arguments:arguments] UTF8String]);
}

@end
#undef AtAspectOfClass


