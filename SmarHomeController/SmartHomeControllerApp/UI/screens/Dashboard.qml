import QtQuick 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15


Rectangle {
    id:dashboard
    width: parent.width
    height: parent.height
    color: "#f0f0f0"

    Text {
        text: qsTr("Dashboard")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 24
        font.bold: true
        color: "#333333"
    }

    Flickable{
        id:flickable
        anchors.fill: parent
        contentHeight: columnLayout.height
        clip: true

        Column{
            id:columnLayout
            width: flickable.width
            spacing: 20
            anchors.margins: 20
            Rectangle{
                width: parent.width - 40
                height: 100
                radius: 10
                color: "white"

                border.color: "#cccccc"
                border.width: 1
                Row{
                    anchors.fill: parent
                    anchors.margins: 10

                }
                Image {
                    source: "file"
                    width: 60
                    height: 60

                }
                Text {
                    text: qsTr("Active Devices: 12")
                    font.pixelSize: 18
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        Rectangle{
            width: parent.width - 40
            height: 300
            radius: 10
            color: "white"

            border.color: "#cccccc"
            border.width: 1
            Row{
                anchors.fill: parent
                anchors.margins: 10

            }
            Image {
                source: "file"
                width: 60
                height: 60

            }
            Text {
                text: qsTr("Energy usagechart Placeholder")
                font.pixelSize: 18
                font.bold: true
                anchors.verticalCenter: parent.verticalCenter
                color: "#666666"
            }
        }
        Rectangle{
            width: parent.width-40
            height: 100
            radius: 10
            color: "white"
            border.color: "#cccccc"
            border.width: 1
        }
        Row{
            anchors.fill:parent
            anchors.margins: 10
            Image {

                source: "file"
                width: 60
                height: 60

            }
            Text {
                id: name
                text: qsTr("System Status:All Systems Operational")
                font.pixelSize: 18
                font.bold: true
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
