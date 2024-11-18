import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Rectangle {
    id: wifiSettingsScreen
    width: 640
    height: 480
    color: "#f9f9f9"

    // Header
    Text {
        text: "Wi-Fi Configuration"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 24
        font.bold: true
        color: "#333333"
    }

    // Wi-Fi Network List
    ListView {
        id: wifiList
        width: parent.width - 40
        height: parent.height - 180
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 80
        spacing: 10

        model: ListModel {
            ListElement { ssid: "Network_1"; signalStrength: "Strong" }
            ListElement { ssid: "Network_2"; signalStrength: "Medium" }
            ListElement { ssid: "Network_3"; signalStrength: "Weak" }
        }

        delegate: Rectangle {
            width: parent.width
            height: 50
            radius: 8
            color: "white"
            border.color: "#cccccc"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                spacing: 10
                anchors.margins: 10

                Text {
                    text: ssid
                    font.pixelSize: 16
                    color: "#333333"
                }

                Text {
                    text: "(" + signalStrength + ")"
                    font.pixelSize: 14
                    color: "#777777"
                    anchors.verticalCenter: parent.verticalCenter
                }

                Button {
                    text: "Connect"
                    Layout.alignment: Qt.AlignRight
                    onClicked: {
                        console.log("Connecting to: " + ssid)
                        // Navigate to the password input screen or directly connect
                    }
                }
            }
        }
    }

    // Add Network Button
    Button {
        id: addNetworkButton
        text: "Add Network"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 60
        onClicked: {
            console.log("Navigating to Add New Network Screen")
        }
    }

    // Back Button
    Button {
        id: backButton
        text: "Back"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        onClicked: {
            console.log("Navigating back to Settings Screen")
        }
    }
}
