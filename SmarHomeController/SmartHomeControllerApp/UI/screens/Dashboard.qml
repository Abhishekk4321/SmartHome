import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: dashboard
    width: 1024
    height: 786
    color: "#f0f0f0"

    // Header Section
    Text {
        text: "Dashboard"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 28
        font.bold: true
        color: "#333333"
    }

    // Main Content Area
    Flickable {
        id: flickable
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: footer.top
        contentHeight: columnLayout.height
        clip: true
        anchors.margins: 20

        Column {
            id: columnLayout
            width: flickable.width
            spacing: 20

            // Active Devices Card
            Rectangle {
                width: parent.width
                height: 100
                radius: 12
                color: "white"
                border.color: "#cccccc"
                border.width: 1

                Row {
                    anchors.fill: parent
                    anchors.margins: 10

                    Image {
                        source: "qrc:/qml/assets/devices.png" // Use a valid image
                        width: 60
                        height: 60
                    }

                    Column {
                        spacing: 5
                        anchors.verticalCenter: parent.verticalCenter

                        Text {
                            text: "Active Devices"
                            font.pixelSize: 20
                            font.bold: true
                        }

                        Text {
                            text: "12 Devices Connected"
                            font.pixelSize: 14
                            color: "#777"
                        }
                    }
                }
            }

            // Energy Usage Section (Placeholder for Chart)
            Rectangle {
                width: parent.width
                height: 300
                radius: 12
                color: "white"
                border.color: "#cccccc"
                border.width: 1

                Text {
                    text: "Energy Usage Chart Placeholder"
                    anchors.centerIn: parent
                    font.pixelSize: 18
                    color: "#666"
                }
            }

            // System Status Card
            Rectangle {
                width: parent.width
                height: 100
                radius: 12
                color: "white"
                border.color: "#cccccc"
                border.width: 1

                Row {
                    anchors.fill: parent
                    anchors.margins: 10

                    Image {
                        source: "qrc:/qml/assets/status.png" // Use a valid image
                        width: 60
                        height: 60
                    }

                    Column {
                        spacing: 5
                        anchors.verticalCenter: parent.verticalCenter

                        Text {
                            text: "System Status"
                            font.pixelSize: 20
                            font.bold: true
                        }

                        Text {
                            text: "All Systems Operational"
                            font.pixelSize: 14
                            color: "#777"
                        }
                    }
                }
            }

            // Navigation Buttons
            Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Button {
                    text: "View Rooms"
                    onClicked: {
                        // Navigate to Room Overview
                        stackView.push(Qt.resolvedUrl("qrc:/screens/RoomOverview.qml"))
                    }
                }

                Button {
                    text: "Control Devices"
                    onClicked: {
                        // Navigate to Device Control
                        stackView.push(Qt.resolvedUrl("qrc:/screens/DeviceControl.qml"))
                    }
                }
                Button {
                    text: "Security & Alerts"
                    onClicked: {
                        stackView.push("qrc:/screens/SecurityAlerts.qml")
                    }
                }
                Button {
                    text: "User Profile & Settings"
                    onClicked: {
                        stackView.push("qrc:/screens/UserProfileSettings.qml")
                    }
                }


            }
        }
    }

    // StackView for Navigation
    StackView {
        id: stackView
        width: parent.width
        height: parent.height
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }

    // Footer Section
    Rectangle {
        id: footer
        width: parent.width
        height: 50
        color: "#333333"
        anchors.bottom: parent.bottom

        Row {
            anchors.centerIn: parent
            spacing: 30

            Text {
                text: "Smart Home Controller v1.0"
                color: "white"
                font.pixelSize: 14
            }

            Text {
                text: "© 2024 YourCompany"
                color: "white"
                font.pixelSize: 14
            }
        }
    }
}
