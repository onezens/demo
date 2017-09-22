
%hook SpringBoard

- (void)_menuButtonDown:(struct __IOHIDEvent *)arg1 {
	%orig;

	    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"wz hook the iphone test" delegate:nil cancelButtonTitle:@"owesome" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}


%end
