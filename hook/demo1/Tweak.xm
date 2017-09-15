
%hook SpringBoard

- (void)_menuButtonDown:(struct __IOHIDEvent *)arg1 {
	
	NSLog(@"a=%d, b=%d", 10, 20);
	%log((NSString *)@"Hello wz. \n", (NSString *)@"This is my first hook project.");
	%orig; //call original method
}


%end
