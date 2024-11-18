import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: deviceControl
    width: 640
    height: 480
    color: "#ffffff"

    // Header Section
    Row {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20

        // Back Button
        Button {
            text: "Back"
            onClicked: {
                stackView.pop()
            }
        }

        // Screen Title
        Text {
            text: "Device Control"
            font.pixelSize: 28
            font.bold: true
            color: "#333333"
            anchors.leftMargin: 20
        }
    }

    // Flickable for Device List
    Flickable {
        id: flickable
        anchors.fill: parent
        anchors.margins: 20
        contentHeight: deviceList.height
        clip: true

        Column {
            id: deviceList
            width: flickable.width
            spacing: 20

            // Repeater to Display Devices
            Repeater {
                model: [
                    { name: "Smart Light", status: true },
                    { name: "Smart Fan", status: false },
                    { name: "Smart AC", status: true },
                    { name: "Smart TV", status: false }
                ]

                delegate: Rectangle {
                    width: parent.width
                    height: 80
                    color: "white"
                    radius: 10
                    border.color: "#cccccc"
                    border.width: 1

                    Row {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        // Device Name
                        Text {
                            text: modelData.name
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        // Toggle Button
                        Switch {
                            checked: modelData.status
                            anchors.verticalCenter: parent.verticalCenter
                            onClicked: {
                                console.log(modelData.name + " toggled to: " + checked)
                            }
                        }
                    }
                }
            }
        }
    }
}
