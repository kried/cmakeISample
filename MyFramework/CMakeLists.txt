cmake_minimum_required(VERSION 3.14)

# Set the project name and the framework target name
project(MyFramework)
set(TARGET_NAME "MySdk")

# Set the minimum deployment target for iOS
set(CMAKE_OSX_DEPLOYMENT_TARGET "14.0")

# Specify the supported platforms (iOS, iOS simulator, etc.)
set(CMAKE_OSX_ARCHITECTURES "arm64;x86_64")

# Enable C++ standard (optional)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the Objective-C++ standard (optional)
set(CMAKE_OBJCXX_STANDARD 17)
set(CMAKE_OBJCXX_STANDARD_REQUIRED ON)

# Define the framework as a dynamic library (i.e., dynamic framework)
# Define source files
set(SOURCES
    src/MyClass.cpp                # C++ source file
    src/MyObjcClass.mm             # Objective-C++ implementation file
)

# Define public headers
set(PUBLIC_HEADERS
    include/MyObjcClass.h          # Public Objective-C header
    include/${TARGET_NAME}.h                # Umbrella header
)

# Define private/internal headers
set(PRIVATE_HEADERS
    src/MyObjcClass_Internal.h     # Internal Objective-C header
)

# Create the library
add_library(${TARGET_NAME} SHARED
    ${SOURCES}
    ${PUBLIC_HEADERS}
    ${PRIVATE_HEADERS}
)

target_include_directories(${TARGET_NAME} PUBLIC
    ${CMAKE_SOURCE_DIR}/MyFramework/include
)

# Set the properties to generate a dynamic framework
set_target_properties(${TARGET_NAME} PROPERTIES
    FRAMEWORK TRUE
    FRAMEWORK_VERSION A
    XCODE_ATTRIBUTE_DEFINES_MODULE YES
    XCODE_ATTRIBUTE_MODULEMAP_FILE "${CMAKE_SOURCE_DIR}/MyFramework/module.modulemap"
    MACOSX_FRAMEWORK_IDENTIFIER com.example.${TARGET_NAME}
    PUBLIC_HEADER "${PUBLIC_HEADERS}"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
    XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET "${CMAKE_OSX_DEPLOYMENT_TARGET}"
    XCODE_ATTRIBUTE_MACH_O_TYPE "mh_dylib"  # Ensure the Mach-O type is Dynamic Library
)

# Add dependency on CommonFramework
add_subdirectory("${CMAKE_SOURCE_DIR}/CommonFramework" CommonFramework)
target_link_libraries(${TARGET_NAME} PRIVATE CommonFramework)

# Install the framework
install(TARGETS ${TARGET_NAME}
    FRAMEWORK DESTINATION ${FRAMEWORKS_DESTINATION}
)

# Set the header search paths for Xcode to use angle brackets for imports
target_include_directories(${TARGET_NAME} SYSTEM PUBLIC
    "$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/MyFramework/include>"
    "$<INSTALL_INTERFACE:Headers>"
)