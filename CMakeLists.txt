cmake_minimum_required(VERSION 3.14)

# Set project name
project(TestApp)

set(FRAMEWORKS_DESTINATION "${CMAKE_BINARY_DIR}/Frameworks")

# Add subdirectories for the framework and app
add_subdirectory(MyApp)