import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Smart Home Controller"

    // Main layout for the UI
    Rectangle {
        width: parent.width
        height: parent.height

        // A simple Text element to display a message
        Text {
            id: greeting
            text: "Welcome to SmartHome Controller!"
            anchors.centerIn: parent
            font.pixelSize: 24
        }

        // Button that changes the text when clicked
        Button {
            text: "Change Text"
            anchors.centerIn: parent
            anchors.topMargin: 20
            onClicked: {
                greeting.text = "Button clicked! SmartHome is ON!"
            }
        }
    }
}
