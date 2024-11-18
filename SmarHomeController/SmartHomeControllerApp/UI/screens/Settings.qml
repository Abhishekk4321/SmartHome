import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Rectangle {
    id: settingsScreen
    width: 640
    height: 480
    color: "#f9f9f9" // Light background color

    // Header
    Text {
        text: "Settings"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 24
        font.bold: true
        color: "#333333"
    }

    // Settings Options
    ColumnLayout {
        id: settingsLayout
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15
        anchors.topMargin: 80

        // Wi-Fi Settings
        Rectangle {
            Layout.fillWidth: true
            height: 100
            radius: 10
            color: "white"
            border.color: "#cccccc"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10

                Image {
                    source: "qrc:/qml/assets/wifi.png" // Wi-Fi icon
                    width: 50
                    height: 50
                }

                Text {
                    text: "Wi-Fi Settings"
                    font.pixelSize: 18
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }

                Button {
                    text: "Configure"
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: {
                        mainStackView.push(Qt.resolvedUrl("qrc:/screens/WifiSetting.qml"))
                    }
                }
            }
        }

        // Notification Settings
        Rectangle {
            Layout.fillWidth: true
            height: 100
            radius: 10
            color: "white"
            border.color: "#cccccc"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10

                Image {
                    source: "qrc:/qml/assets/notifications.png" // Notifications icon
                    width: 50
                    height: 50
                }

                Text {
                    text: "Notification Preferences"
                    font.pixelSize: 18
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }

                Button {
                    text: "Edit"
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: {
                        console.log("Navigating to Notification Preferences")
                    }
                }
            }
        }

        // User Preferences
        Rectangle {
            Layout.fillWidth: true
            height: 100
            radius: 10
            color: "white"
            border.color: "#cccccc"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10

                Image {
                    source: "qrc:/qml/assets/user_preferences.png" // User Preferences icon
                    width: 50
                    height: 50
                }

                Text {
                    text: "User Preferences"
                    font.pixelSize: 18
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }

                Button {
                    text: "Edit"
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: {
                        console.log("Navigating to User Preferences")
                    }
                }
            }
        }
    }

    // Save Button
    Button {
        id: saveButton
        text: "Save Changes"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        onClicked: {
            console.log("Settings saved successfully.")
        }
    }
}
