//
//  OCMockDemoTests.m
//  OCMockDemoTests
//
//  Created by wz on 2018/8/2.
//  Copyright © 2018 wz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>
#import "ViewController.h"

@interface OCMockDemoTests : XCTestCase

@end

@implementation OCMockDemoTests

- (void)setUp {
    [super setUp];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {

    [ViewController class];
    // create a mock for the user defaults
    id userDefaultsMock = OCMClassMock([NSUserDefaults class]);
    
    NSLog(@"----%@", [[NSUserDefaults standardUserDefaults] valueForKey:@"MyAppURLKey"]);
    // set it up to return a specific value when stringForKey: is called
    OCMStubRecorder *key = OCMStub([userDefaultsMock stringForKey:@"MyAppURLKey"]).andReturn(@"http://testurl");
    NSLog(@"----%@", [userDefaultsMock stringForKey:@"MyAppURLKey"]);
    // set it up to return the specified value no matter how the method is invoked
    OCMStub([userDefaultsMock stringForKey:[OCMArg any]]).andReturn(@"http://testurl");
    NSLog(@"----%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"MyAppURLKey"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
