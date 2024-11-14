# Set source files
set(SOURCE 
    src/main.cpp
    UI/qml.qrc
)

# Enable automatic processing of moc, rcc, and uic files
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Determine Qt version and set up accordingly
if(Qt5_FOUND)
    find_package(Qt5 COMPONENTS Core Gui Quick Qml QUIET)
else()
    find_package(Qt6 COMPONENTS Core Gui Quick Qml QUIET)
endif()

if (Qt5_FOUND)
    # Qt5 configuration
    message(STATUS "Using Qt5")
    add_executable(SmartHomeControllerApp ${SOURCE})
    target_link_libraries(SmartHomeControllerApp
        Qt5::Core
        Qt5::Gui
        Qt5::Quick
        Qt5::Qml
    )
elseif (Qt6_FOUND)
    # Qt6 configuration
    message(STATUS "Using Qt6")
    add_executable(SmartHomeControllerApp ${SOURCE})
    target_link_libraries(SmartHomeControllerApp
        Qt6::Core
        Qt6::Gui
        Qt6::Quick
        Qt6::Qml
    )
else()
    message(FATAL_ERROR "Neither Qt5 nor Qt6 found. Please install Qt5 or Qt6.")
endif()
