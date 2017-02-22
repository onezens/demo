# UITests

>>工具：Xcode 8.2 模拟器：iPhone 7 。测试代码首先是自动录制的。用真机的测试的时候，出现了因为证书的问题报错，所以选择了模拟器。录制的过程中也很容易出问题： `Timestamped Event Matching Error: Failed to find matching element` ，成功录制测试代码后，其他的测试用例可以仿照录制的代码来编写。总之不是很好用，局限性很大。

###Test logs

```

2017-02-22 10:51:28.086 XCTRunner[1298:395964] Running tests...
2017-02-22 10:51:38.069 XCTRunner[1298:395964] Continuing to run tests in the background with task ID 1
Test Suite 'Selected tests' started at 2017-02-22 10:51:38.615
Test Suite 'UITestsUITests.xctest' started at 2017-02-22 10:51:38.616
Test Suite 'UITestsUITests' started at 2017-02-22 10:51:38.617
Test Case '-[UITestsUITests testLogin]' started.
    t =     0.00s     Start Test at 2017-02-22 10:51:38.618
    t =     0.00s     Set Up
    t =     0.01s         Launch cc.onezen.UITests
    t =     6.03s             Waiting for accessibility to load
    t =     9.49s             Wait for app to idle
    t =    11.03s     Tap "username" TextField
    t =    11.03s         Wait for app to idle
    t =    11.07s         Find the "username" TextField
    t =    11.07s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    11.46s             Find: Descendants matching type TextField
    t =    11.46s             Find: Elements matching predicate '"username" IN identifiers'
    t =    11.47s             Wait for app to idle
    t =    11.52s         Synthesize event
    t =    11.83s         Wait for app to idle
    t =    12.77s     Type 'name' into TextField
    t =    12.78s         Wait for app to idle
    t =    12.82s         Find the TextField
    t =    12.82s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    13.93s             Find: Descendants matching type TextField
    t =    13.93s             Find: Elements matching predicate '"username" IN identifiers'
    t =    13.94s             Wait for app to idle
    t =    14.12s         Synthesize event
    t =    14.90s         Wait for app to idle
    t =    14.97s     Tap "password" TextField
    t =    14.97s         Wait for app to idle
    t =    15.04s         Find the "password" TextField
    t =    15.04s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    16.10s             Find: Descendants matching type TextField
    t =    16.10s             Find: Elements matching predicate '"password" IN identifiers'
    t =    16.32s             Wait for app to idle
    t =    16.55s         Synthesize event
    t =    16.84s         Wait for app to idle
    t =    17.41s     Type 'password' into TextField
    t =    17.41s         Wait for app to idle
    t =    17.65s         Find the TextField
    t =    17.65s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    18.66s             Find: Descendants matching type TextField
    t =    18.66s             Find: Elements matching predicate '"password" IN identifiers'
    t =    18.67s             Wait for app to idle
    t =    18.76s         Synthesize event
    t =    19.00s         Wait for app to idle
    t =    19.04s     Tap "login" Button
    t =    19.04s         Wait for app to idle
    t =    19.08s         Find the "login" Button
    t =    19.08s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    20.06s             Find: Descendants matching type Button
    t =    20.06s             Find: Elements matching predicate '"login" IN identifiers'
    t =    20.08s             Wait for app to idle
    t =    20.27s         Synthesize event
    t =    20.52s         Wait for app to idle
    t =    21.14s     Tap "0" Switch
    t =    21.14s         Wait for app to idle
    t =    21.25s         Find the "0" Switch
    t =    21.25s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    21.59s             Find: Descendants matching type Switch
    t =    21.59s             Find: Elements matching predicate '"0" IN identifiers'
    t =    21.60s             Wait for app to idle
    t =    21.64s         Synthesize event
    t =    21.90s         Wait for app to idle
    t =    22.10s     Tap "1" Switch
    t =    22.10s         Wait for app to idle
    t =    22.14s         Find the "1" Switch
    t =    22.14s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    22.49s             Find: Descendants matching type Switch
    t =    22.49s             Find: Elements matching predicate '"1" IN identifiers'
    t =    22.50s             Wait for app to idle
    t =    22.54s         Synthesize event
    t =    22.80s         Wait for app to idle
    t =    23.00s     Tap "0" Switch
    t =    23.00s         Wait for app to idle
    t =    23.04s         Find the "0" Switch
    t =    23.04s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    23.39s             Find: Descendants matching type Switch
    t =    23.39s             Find: Elements matching predicate '"0" IN identifiers'
    t =    23.40s             Wait for app to idle
    t =    23.44s         Synthesize event
    t =    23.70s         Wait for app to idle
    t =    23.90s     Tap "1" Switch
    t =    23.90s         Wait for app to idle
    t =    23.94s         Find the "1" Switch
    t =    23.94s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    24.29s             Find: Descendants matching type Switch
    t =    24.29s             Find: Elements matching predicate '"1" IN identifiers'
    t =    24.30s             Wait for app to idle
    t =    24.34s         Synthesize event
    t =    24.60s         Wait for app to idle
    t =    24.80s     Tap "0" Switch
    t =    24.80s         Wait for app to idle
    t =    24.84s         Find the "0" Switch
    t =    24.84s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    25.19s             Find: Descendants matching type Switch
    t =    25.19s             Find: Elements matching predicate '"0" IN identifiers'
    t =    25.20s             Wait for app to idle
    t =    25.24s         Synthesize event
    t =    25.50s         Wait for app to idle
    t =    25.70s     Tap "1" Switch
    t =    25.70s         Wait for app to idle
    t =    25.74s         Find the "1" Switch
    t =    25.74s             Snapshot accessibility hierarchy for cc.onezen.UITests
    t =    26.07s             Find: Descendants matching type Switch
    t =    26.07s             Find: Elements matching predicate '"1" IN identifiers'
    t =    26.08s             Wait for app to idle
    t =    26.12s         Synthesize event
    t =    26.38s         Wait for app to idle
    t =    26.58s     Tear Down
Test Case '-[UITestsUITests testLogin]' passed (26.787 seconds).
Test Suite 'UITestsUITests' passed at 2017-02-22 10:52:05.405.
	 Executed 1 test, with 0 failures (0 unexpected) in 26.787 (26.788) seconds
Test Suite 'UITestsUITests.xctest' passed at 2017-02-22 10:52:05.406.
	 Executed 1 test, with 0 failures (0 unexpected) in 26.787 (26.789) seconds
Test Suite 'Selected tests' passed at 2017-02-22 10:52:05.406.
	 Executed 1 test, with 0 failures (0 unexpected) in 26.787 (26.791) seconds


```




