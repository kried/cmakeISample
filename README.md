# iOS Framework sample with CMake configuration

Generate the project by command
```bash
cmake .. -G Xcode -DCMAKE_SYSTEM_NAME=iOS
```

Test the Xcode build for simulator by command
```bash
xcodebuild -project TestApp.xcodeproj -scheme MyApp build  -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'
```