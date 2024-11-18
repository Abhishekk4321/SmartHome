import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: appWindow
    visible: true
    width: 1024
    height: 768
    title: "Smart Home Controller"

    // Theme and Accent Color Properties
    property bool isMaterialTheme: true
    property var accentColor: isMaterialTheme ? "#448AFF" : "#3A99D9"

    // Header Section
    Rectangle {
        id: header
        width: parent.width
        height: 50
        color: accentColor

        Text {
            text: qsTr("Smart Home Controller")
            anchors.centerIn: parent
            font.bold: true
            color: "white"
            font.pixelSize: 18
        }

        Button {
            id: menuButton
            text: "☰"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 50
            onClicked: navDrawer.open()
            background: Rectangle {
                color: "transparent"
            }
        }
    }

    // Navigation Drawer
    Drawer {
        id: navDrawer
        width: 250
        edge: Qt.LeftEdge
        modal: true

        Column {
            spacing: 15
            anchors.fill: parent
            anchors.margins: 20

            Label {
                text: qsTr("Navigation")
                font.bold: true
                font.pixelSize: 16
            }

            Button {
                text: qsTr("Dashboard")
                onClicked: {
                    mainStackView.push(Qt.resolvedUrl("screens/Dashboard.qml"));
                    navDrawer.close();
                }
            }

            Button {
                text: qsTr("Settings")
                onClicked: {
                    mainStackView.push(Qt.resolvedUrl("screens/Settings.qml"));
                    navDrawer.close();
                }
            }

            Button {
                text: qsTr("Devices")
                onClicked: {
                    mainStackView.push(Qt.resolvedUrl("screens/devices.qml"));
                    navDrawer.close();
                }
            }

            Button {
                text: qsTr("Logs")
                onClicked: {
                    mainStackView.push(Qt.resolvedUrl("screens/logs.qml"));
                    navDrawer.close();
                }
            }
        }
    }

    // StackView for Navigation
    StackView {
        id: mainStackView
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        initialItem: Qt.resolvedUrl("screens/Dashboard.qml")
    }
}
