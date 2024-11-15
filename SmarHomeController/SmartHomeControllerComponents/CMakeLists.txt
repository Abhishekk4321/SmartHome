# Set minimum CMake version
cmake_minimum_required(VERSION 3.16)

# Project name
project(SmartHomeControllerApp)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)

# Set source files
set(SOURCE_FILES
    main.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerApp/UI/qml.qrc
)

# Enable automatic processing of moc, rcc, and uic files
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Find Qt libraries (attempt Qt6 first, fallback to Qt5 if needed)
find_package(Qt6 COMPONENTS Core Gui Quick Qml QUIET)
if (NOT Qt6_FOUND)
    find_package(Qt5 COMPONENTS Core Gui Quick Qml REQUIRED)
    set(QT_VERSION 5)
else()
    set(QT_VERSION 6)
endif()

# Setup the executable based on Qt version
add_executable(SmartHomeControllerApp ${SOURCE_FILES})

if (QT_VERSION EQUAL 5)
    message(STATUS "Using Qt5")
    target_link_libraries(SmartHomeControllerApp
        Qt5::Core
        Qt5::Gui
        Qt5::Quick
        Qt5::Qml
    )
elseif (QT_VERSION EQUAL 6)
    message(STATUS "Using Qt6")
    target_link_libraries(SmartHomeControllerApp
        Qt6::Core
        Qt6::Gui
        Qt6::Quick
        Qt6::Qml
    )
endif()

# Set QML Import Path
set(QML_IMPORT_PATH "${CMAKE_SOURCE_DIR}/SmartHomeControllerApp/UI")

# Add custom definition for QML path
target_compile_definitions(SmartHomeControllerApp PRIVATE QML_IMPORT_PATH="${QML_IMPORT_PATH}")
