import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: roomOverview
    width: 1024
    height: 768
    color: "#f9f9f9" // Background color

    // Header Section
    Text {
        text: "Room Overview"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 28
        font.bold: true
        color: "#333333"
    }

    // Back Button
    Button {
        text: "Back"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.leftMargin: 20
    }

    // Main Content Area
    Flickable {
        id: flickable
        anchors.fill: parent
        anchors.margins: 20
        contentHeight: columnLayout.height
        clip: true

        Column {
            id: columnLayout
            width: flickable.width // Matches Flickable's width
            spacing: 20

            // Room Cards (Repeat for each room)
            Repeater {
                model: 4 // Number of rooms
                delegate: Rectangle {
                    width: columnLayout.width
                    height: 120
                    radius: 10
                    color: "white"
                    border.color: "#cccccc"
                    border.width: 1

                    Row {
                        anchors.fill: parent
                        anchors.margins: 10

                        // Room Image with Proper ID
                        Image {
                            id: roomImage
                            source: "qrc:/qml/assets/room.png" // Replace with actual room image
                            width: 80
                            height: 80
                        }

                        Column {
                            spacing: 5
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: roomImage.right
                            anchors.leftMargin: 10

                            Text {
                                text: "Room " + (index + 1) // Room numbering
                                font.pixelSize: 20
                                font.bold: true
                            }

                            Text {
                                text: "Devices: " + (index + 2) // Example device count
                                font.pixelSize: 14
                                color: "#777"
                            }

                            Button {
                                text: "Manage Devices"
                                onClicked: {
                                    // Navigate to Room Detail
                                    stackView.push(Qt.resolvedUrl("screens/RoomDetail.qml"))
                                }
                                font.pixelSize: 12
                                width: 120
                                height: 30
                            }
                        }
                    }
                }
            }
        }

        // Vertical ScrollBar
        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
            width: 10
        }
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
