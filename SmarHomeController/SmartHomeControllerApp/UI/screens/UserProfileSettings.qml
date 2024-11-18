import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: userProfileSettings
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
            text: "User Profile & Settings"
            font.pixelSize: 24
            font.bold: true
            color: "#333333"
        }
    }

    // Content Area
    Flickable {
        id: contentFlickable
        anchors.fill: parent
        anchors.margins: 20
        contentHeight: contentColumn.height
        clip: true

        Column {
            id: contentColumn
            width: contentFlickable.width
            spacing: 15

            // Profile Section
            Rectangle {
                width: parent.width
                height: 100
                radius: 10
                color: "white"
                border.color: "#cccccc"
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    spacing: 10
                    anchors.margins: 10

                    Image {
                        source: "qrc:/qml/assets/profile_icon.png" // Placeholder profile icon
                        width: 50
                        height: 50
                    }

                    Column {
                        Text {
                            text: "John Doe"
                            font.pixelSize: 18
                            font.bold: true
                            color: "#333333"
                        }

                        Text {
                            text: "johndoe@example.com"
                            font.pixelSize: 14
                            color: "#777777"
                        }
                    }
                }
            }

            // Change Password Button
            Button {
                text: "Change Password"
                width: parent.width
                height: 50
                font.pixelSize: 16
                onClicked: {
                    console.log("Navigating to Change Password screen")
                    stackView.push("screens/ChangePassword.qml")
                }
            }

            // Notification Preferences
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
                        text: "Notification Preferences"
                        font.pixelSize: 18
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Button {
                        text: "Edit"
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: {
                            console.log("Navigating to Notification Preferences screen")
                            stackView.push("screens/NotificationPreferences.qml")
                        }
                    }
                }
            }

            // App Preferences
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
                        text: "App Preferences"
                        font.pixelSize: 18
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Button {
                        text: "Edit"
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: {
                            console.log("Navigating to App Preferences screen")
                            stackView.push("screens/AppPreferences.qml")
                        }
                    }
                }
            }
        }
    }

    // Logout Button
    Button {
        text: "Logout"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        width: parent.width - 40
        height: 50
        font.pixelSize: 18
        onClicked: {
            console.log("User logged out")
            stackView.replace("screens/Login.qml")
        }
    }
}
