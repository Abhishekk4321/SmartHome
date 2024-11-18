import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: securityAlertsScreen
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
            text: "Security & Alerts"
            font.pixelSize: 24
            font.bold: true
            color: "#333333"
        }
    }

    // Alerts Section
    Flickable {
        id: alertsList
        anchors.fill: parent
        anchors.margins: 20
        contentHeight: alertsContent.height
        clip: true

        Column {
            id: alertsContent
            width: parent.width
            spacing: 15

            // Example Alerts
            Repeater {
                model: ListModel {
                    ListElement { timestamp: "2024-11-18 14:30"; message: "Motion detected in the living room." }
                    ListElement { timestamp: "2024-11-18 12:15"; message: "Front door unlocked." }
                    ListElement { timestamp: "2024-11-17 22:45"; message: "Window sensor triggered in the bedroom." }
                }
                delegate: Rectangle {
                    width: parent.width
                    height: 80
                    color: "white"
                    radius: 10
                    border.color: "#cccccc"
                    border.width: 1

                    Column {
                        anchors.fill: parent
                        anchors.margins: 10

                        Text {
                            text: timestamp
                            font.pixelSize: 14
                            color: "#777777"
                        }

                        Text {
                            text: message
                            font.pixelSize: 16
                            color: "#333333"
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
    }

    // Action Buttons
    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        spacing: 20

        // Clear Alerts
        Button {
            text: "Clear Alerts"
            onClicked: {
                alertsContent.children.forEach(item => item.destroy())
                console.log("All alerts cleared.")
            }
        }

        // Security Settings Button
        Button {
            text: "Manage Security Settings"
            onClicked: {
                stackView.push("screens/SecuritySettings.qml")
                console.log("Navigating to Security Settings.")
            }
        }
    }
}
