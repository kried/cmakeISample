cmake_minimum_required(VERSION 3.14)

project(MyApp LANGUAGES Swift)
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGNING_ALLOWED NO)


#-----

# Include the frameworks CMakeLists
add_subdirectory("${CMAKE_SOURCE_DIR}/MyFramework" MyFramework)

# Create an executable for the app
add_executable(MyApp
    src/AppDelegate.swift
    src/ViewController.swift
)

set(CMAKE_OSX_DEPLOYMENT_TARGET "15.0")
set(CFBUNDLE_VERSION "1.0.0")

# Add dependencies
add_dependencies(MyApp MySdk)

target_link_libraries(MyApp PRIVATE MySdk)

# Ensure that MyApp knows where to find frameworks
target_link_options(MyApp PRIVATE
    -framework MySdk
)

set_target_properties(MyApp PROPERTIES
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
)

#-----

# Set the deployment target and architectures
set_target_properties(MyApp PROPERTIES
    MACOSX_DEPLOYMENT_TARGET "15.0"
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2"
    
    # Add the bundle identifier
    XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "com.example.MyApp"
    MACOSX_BUNDLE_GUI_IDENTIFIER "com.example.MyApp"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
    MACOSX_BUNDLE_LONG_VERSION_STRING 1.0.0
    MACOSX_BUNDLE_SHORT_VERSION_STRING 1
    MACOSX_BUNDLE_BUNDLE_VERSION 1
    CMAKE_XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "${FRAMEWORKS_DESTINATION} $(inherited)"
)
