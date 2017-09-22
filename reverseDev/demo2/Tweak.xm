%hook SpringBoard

- (void)_menuButtonDown:(struct __IOHIDEvent *)arg1 {
	%orig;

	%log((NSString *)@"Hello world!", (NSString *)@"hook springboard by wz.");
	%log((NSString *)@"Hello world!", (NSString *)@"hook springboard by wz.");
	%log((NSString *)@"Hello world!", (NSString *)@"hook springboard by wz.");
	%log((NSString *)@"Hello world!", (NSString *)@"hook springboard by wz.");

	    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"wz hook this iphone test" delegate:nil cancelButtonTitle:@"owesome" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}


%end
