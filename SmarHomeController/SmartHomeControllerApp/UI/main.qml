import QtQuick 2.15
import QtQuick.Controls 2.15


ApplicationWindow
{
    id :appWindow
    visible: true
    width: 1024
    height: 768
    title: "Smart Home Controller"

    property bool isMaterialTheme: true
    property var accentColor: isMaterialTheme ? "#448AFF":  "#3A99D9"

    //Header

    Rectangle
    {
        id:header
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
    }
    Drawer{
        id:navDrawer
        width: 250
        edge: Qt.LeftEdge
        modal: true
        Column
        {
            spacing: 10
            anchors.fill: parent
            anchors.margins: 20
            Label{
                text: "Navigation";
                font.bold: true
            }
            Button
            {
                text: "Dashboard"
                onClicked: mainStackView.push(Qt.resolvedUrl("screens/Dashboard.qml"))
            }

            Button
            {
                text: "Settings"
                onClicked: mainStackView.push(Qt.resolvedUrl("screens/settings.qml"))
            }

            Button
            {
                text: "Devices"
                onClicked: mainStackView.push(Qt.resolvedUrl("screens/devices.qml"))
            }
            Button
            {
                text: "Logs"
                onClicked: mainStackView.push(Qt.resolvedUrl("screens/logs.qml"))
            }
        }
    }
    StackView{
        id:mainStackView
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        initialItem: Qt.resolvedUrl("screens/Dashboard.qml")
    }
    Button{
        id:menuButton
        text: "="
        anchors.left: parent.left
        anchors.top: header.top
        width: 50
        height: 50
        onClicked: navDrawer.open()
    }
}
