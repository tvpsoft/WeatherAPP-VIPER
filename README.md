# WeatherAPP-VIPER
Weather App with architecture VIPER

## API from openweathermap

## VIPER
Because testability is a major concern, I go with VIPER for this project. It contains 2 modules (List and Detail) which is easy to write unit test.



# Unit Test report
```
Test Suite 'All tests' started at 2018-11-05 11:34:46.333
Test Suite 'WeatherAppTests.xctest' started at 2018-11-05 11:34:46.334
Test Suite 'WeatherAppTests' started at 2018-11-05 11:34:46.334
Test Case '-[WeatherAppTests.WeatherAppTests testExample]' started.
Test Case '-[WeatherAppTests.WeatherAppTests testExample]' passed (0.001 seconds).
Test Case '-[WeatherAppTests.WeatherAppTests testPerformanceExample]' started.
/Users/phuong/WorkSpace/Projects/WeatherApp/WeatherApp/WeatherAppTests/WeatherAppTests.swift:29: Test Case '-[WeatherAppTests.WeatherAppTests testPerformanceExample]' measured [Time, seconds] average: 0.000, relative standard deviation: 147.919%, values: [0.000003, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
Test Case '-[WeatherAppTests.WeatherAppTests testPerformanceExample]' passed (0.281 seconds).
Test Suite 'WeatherAppTests' passed at 2018-11-05 11:34:46.617.
	 Executed 2 tests, with 0 failures (0 unexpected) in 0.282 (0.283) seconds
Test Suite 'WeatherDetailInteractorTests' started at 2018-11-05 11:34:46.617
Test Case '-[WeatherAppTests.WeatherDetailInteractorTests testInteractorReceivesWeatherFromRouter]' started.
Test Case '-[WeatherAppTests.WeatherDetailInteractorTests testInteractorReceivesWeatherFromRouter]' passed (0.003 seconds).
Test Suite 'WeatherDetailInteractorTests' passed at 2018-11-05 11:34:46.620.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.003) seconds
Test Suite 'WeatherDetailPresenterTests' started at 2018-11-05 11:34:46.621
Test Case '-[WeatherAppTests.WeatherDetailPresenterTests testViewInterfaceShowErrorWhenNoForecast]' started.
Test Case '-[WeatherAppTests.WeatherDetailPresenterTests testViewInterfaceShowErrorWhenNoForecast]' passed (0.004 seconds).
Test Case '-[WeatherAppTests.WeatherDetailPresenterTests testViewInterfaceShowWeatherWhenSuccess]' started.
Test Case '-[WeatherAppTests.WeatherDetailPresenterTests testViewInterfaceShowWeatherWhenSuccess]' passed (0.000 seconds).
Test Suite 'WeatherDetailPresenterTests' passed at 2018-11-05 11:34:46.625.
	 Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.005) seconds
Test Suite 'WeatherEntityTests' started at 2018-11-05 11:34:46.626
Test Case '-[WeatherAppTests.WeatherEntityTests testWeatherSetGet]' started.
Test Case '-[WeatherAppTests.WeatherEntityTests testWeatherSetGet]' passed (0.000 seconds).
Test Suite 'WeatherEntityTests' passed at 2018-11-05 11:34:46.627.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.000 (0.001) seconds
Test Suite 'WeatherListInteractorTests' started at 2018-11-05 11:34:46.627
Test Case '-[WeatherAppTests.WeatherListInteractorTests test_LoadWeatherWithError_ErrorCaughtInOutput]' started.
Test Case '-[WeatherAppTests.WeatherListInteractorTests test_LoadWeatherWithError_ErrorCaughtInOutput]' passed (0.000 seconds).
Test Case '-[WeatherAppTests.WeatherListInteractorTests test_LoadWeatherWithSuccess_ReturnsWeather]' started.
Test Case '-[WeatherAppTests.WeatherListInteractorTests test_LoadWeatherWithSuccess_ReturnsWeather]' passed (0.000 seconds).
Test Case '-[WeatherAppTests.WeatherListInteractorTests test_LoadWeatherWithSuccess_WeatherAreCaughtInSubjectOutputProtocol]' started.
Test Case '-[WeatherAppTests.WeatherListInteractorTests test_LoadWeatherWithSuccess_WeatherAreCaughtInSubjectOutputProtocol]' passed (0.000 seconds).
Test Suite 'WeatherListInteractorTests' passed at 2018-11-05 11:34:46.636.
	 Executed 3 tests, with 0 failures (0 unexpected) in 0.001 (0.009) seconds
Test Suite 'WeatherListPresenterTests' started at 2018-11-05 11:34:46.636
Test Case '-[WeatherAppTests.WeatherListPresenterTests testItemAtIndexIsInjectedForecast]' started.
Test Case '-[WeatherAppTests.WeatherListPresenterTests testItemAtIndexIsInjectedForecast]' passed (0.000 seconds).
Test Case '-[WeatherAppTests.WeatherListPresenterTests testSelectedWeather]' started.
Test Case '-[WeatherAppTests.WeatherListPresenterTests testSelectedWeather]' passed (0.004 seconds).
Test Case '-[WeatherAppTests.WeatherListPresenterTests testWeatherCountIs3]' started.
Test Case '-[WeatherAppTests.WeatherListPresenterTests testWeatherCountIs3]' passed (0.000 seconds).
Test Case '-[WeatherAppTests.WeatherListPresenterTests testWeatherListEmptyShouldShowList]' started.
Test Case '-[WeatherAppTests.WeatherListPresenterTests testWeatherListEmptyShouldShowList]' passed (0.000 seconds).
Test Case '-[WeatherAppTests.WeatherListPresenterTests testWeatherSectionIs1]' started.
Test Case '-[WeatherAppTests.WeatherListPresenterTests testWeatherSectionIs1]' passed (0.000 seconds).
Test Suite 'WeatherListPresenterTests' passed at 2018-11-05 11:34:46.644.
	 Executed 5 tests, with 0 failures (0 unexpected) in 0.006 (0.007) seconds
Test Suite 'WeatherListRouterTests' started at 2018-11-05 11:34:46.651
Test Case '-[WeatherAppTests.WeatherListRouterTests testRootVCIsWeatherDetailVCWhenPresented]' started.
Test Case '-[WeatherAppTests.WeatherListRouterTests testRootVCIsWeatherDetailVCWhenPresented]' passed (0.002 seconds).
Test Suite 'WeatherListRouterTests' passed at 2018-11-05 11:34:46.654.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.002 (0.003) seconds
Test Suite 'WeatherAppTests.xctest' passed at 2018-11-05 11:34:46.655.
	 Executed 15 tests, with 0 failures (0 unexpected) in 0.298 (0.321) seconds
Test Suite 'All tests' passed at 2018-11-05 11:34:46.655.
	 Executed 15 tests, with 0 failures (0 unexpected) in 0.298 (0.322) seconds
```
