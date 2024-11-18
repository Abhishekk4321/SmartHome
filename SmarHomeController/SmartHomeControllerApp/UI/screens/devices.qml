import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: deviceSettings
    width: 640
    height: 480
    color: "#f9f9f9"

    // Header Section
    Row {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        spacing: 10

        // Back Button
        Button {
            text: "Back"
            onClicked: {
                stackView.pop()
            }
        }

        // Screen Title
        Text {
            text: "Device Settings"
            font.pixelSize: 28
            font.bold: true
            color: "#333333"
        }
    }

    // Content Area
    Flickable {
        id: flickable
        anchors.fill: parent
        anchors.margins: 20
        contentHeight: settingsList.height
        clip: true

        Column {
            id: settingsList
            width: flickable.width
            spacing: 20

            // Device Name
            Rectangle {
                width: parent.width
                height: 80
                radius: 10
                color: "white"
                border.color: "#cccccc"
                border.width: 1

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Text {
                        text: "Device: Smart Light"
                        font.pixelSize: 20
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }

            // Brightness Slider
            Rectangle {
                width: parent.width
                height: 100
                radius: 10
                color: "white"
                border.color: "#cccccc"
                border.width: 1

                Column {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Text {
                        text: "Brightness"
                        font.pixelSize: 18
                        color: "#333333"
                    }

                    Slider {
                        id: brightnessSlider
                        from: 0
                        to: 100
                        value: 50
                        stepSize: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        onValueChanged: console.log("Brightness set to: " + value)
                    }
                }
            }

            // Color Picker (Placeholder)
            Rectangle {
                width: parent.width
                height: 100
                radius: 10
                color: "white"
                border.color: "#cccccc"
                border.width: 1

                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Text {
                        text: "Color"
                        font.pixelSize: 18
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Rectangle {
                        width: 40
                        height: 40
                        color: "blue" // Placeholder for color
                        radius: 20
                        border.color: "#cccccc"
                        border.width: 1
                        anchors.verticalCenter: parent.verticalCenter
                        MouseArea {
                            anchors.fill: parent
                            onClicked: console.log("Open color picker (placeholder)")
                        }
                    }
                }
            }

            // Save Changes Button
            Button {
                text: "Save Changes"
                width: parent.width
                height: 50
                font.pixelSize: 18
                onClicked: {
                    console.log("Device settings saved")
                    stackView.pop()
                }
            }
        }
    }
}
