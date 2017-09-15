%hook SpringBoard

- (void)_menuButtonDown:(struct __IOHIDEvent *)arg1 {
	%orig;

	%log((NSString *)@"Hello world!", (NSString *)@"jailBroken by wz.");
	%log((NSString *)@"Hello world!", (NSString *)@"jailBroken by wz.");
	%log((NSString *)@"Hello world!", (NSString *)@"jailBroken by wz.");
	%log((NSString *)@"Hello world!", (NSString *)@"jailBroken by wz.");

	    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"wz jailBreak the iPhone" delegate:nil cancelButtonTitle:@"owesome" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}


%end
