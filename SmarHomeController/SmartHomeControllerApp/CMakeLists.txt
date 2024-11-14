
set(SOURCE 
    src/main.cpp
    UI/qml.qrc
    )

#add the autmatic compiler and rcc to easily covert into c++
#set(CMAKE_AUTOMOC ON)#meta object compiler
set(CMAKE_AUTORCC ON) # rcc for .qrc fil
add_executable(SmartHomeControllerApp ${SOURCE})

find_package(Qt5 REQUIRED COMPONENTS Core Gui Quick Qml)

target_link_libraries(SmartHomeControllerApp
    Qt5::Core
    Qt5::Quick
    Qt5::Qml
    Qt5::Quick
    )

