project(SmartHomeControllerApp)

set(APP_SOURCE_FILE
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/main.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerApp/UI/qml.qrc
    )

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Quick Core Qml)

if(NOT Qt6_FOUND)
    find_package(Qt5 REQUIRED COMPONENTS Quick Core Qml)
    set(QT_VERSION 5)
else()
    set(QT_VERSION 6)

endif()

add_executable(SmartHomeControllerApp ${APP_SOURCE_FILE})

target_link_libraries(SmartHomeControllerApp
    Qt${QT_VERSION}::Core
    Qt${Qt_VERSION}::Quick
    Qt${Qt_VERSION}::Qml
    )

set(QML_IMPORT_PATH "${CMAKE_SOURCE_DIR}/SmartHomeControllerApp/UI")
target_compile_definitions(SmartHomeControllerApp PRIVATE QML_IMPORT_PATH="${QML_IMPORT_PATH}")



# Collect component source files
file(GLOB_RECURSE COMPONENT_SOURCE_FILES
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/controllers/*.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/models/*.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/views/*.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/interfaces/*.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/utils/*.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/patterns/*.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/protocols/*.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/database/*.cpp
    ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents/services/*.cpp
)

# Create a static library for components and link it to the main app
add_library(SmartHomeControllerComponents STATIC ${COMPONENT_SOURCE_FILES})
target_link_libraries(SmartHomeControllerComponents PRIVATE Qt${QT_VERSION}::Core)
target_include_directories(SmartHomeControllerComponents PUBLIC ${CMAKE_SOURCE_DIR}/SmartHomeControllerComponents)

# Link the components library to the main app
#target_link_libraries(SmartHomeControllerApp PRIVATE SmartHomeControllerComponents)
