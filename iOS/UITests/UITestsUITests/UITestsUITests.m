//
//  UITestsUITests.m
//  UITestsUITests
//
//  Created by wangzhen on 17/2/18.
//  Copyright © 2017年 onezen.cc. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UITestsUITests : XCTestCase

@end

@implementation UITestsUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}

- (void)testNoNameAndPassword {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"login"] tap];
    [app.alerts[@"name or password field can not empty"].buttons[@"confirm"] tap];
}

- (void)testNoName {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *passwordTextField = app.textFields[@"password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"password"];
    [app.buttons[@"login"] tap];

}

- (void)testNoPassword {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"username"];
    [usernameTextField tap];
    [usernameTextField typeText:@"username"];
    [app.buttons[@"login"] tap];

}

- (void)testLogin {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"username"];
    [usernameTextField tap];
    [usernameTextField typeText:@"name"];
    
    XCUIElement *passwordTextField = app.textFields[@"password"];
    [passwordTextField tap];
    [passwordTextField typeText:@"password"];
    [app.buttons[@"login"] tap];
    
    XCUIElement *switch2 = app.switches[@"0"];
    [switch2 tap];
    
    XCUIElement *switch3 = app.switches[@"1"];
    [switch3 tap];
    [switch2 tap];
    [switch3 tap];
    [switch2 tap];
    [switch3 tap];
    
}

@end
