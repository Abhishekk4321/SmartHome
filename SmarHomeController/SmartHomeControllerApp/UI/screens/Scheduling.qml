import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: schedulingScreen
    width: 640
    height: 480
    color: "#f9f9f9"

    // Header Section
    RowLayout {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        spacing: 10

        Button {
            text: "Back"
            onClicked: stackView.pop()
        }

        Text {
            text: "Device Scheduling"
            font.pixelSize: 24
            font.bold: true
            color: "#333333"
        }
    }

    // Content Area
    Flickable {
        id: contentArea
        anchors.fill: parent
        anchors.margins: 20
        contentHeight: scheduleList.height
        clip: true

        Column {
            id: scheduleList
            width: parent.width
            spacing: 20

            // Schedule Header
            Text {
                text: "Schedules for: Living Room Light"
                font.pixelSize: 18
                font.bold: true
                color: "#333333"
            }

            // Existing Schedules
            Repeater {
                model: ListModel {
                    id: scheduleModel
                    ListElement { time: "07:00 AM"; action: "Turn On" }
                    ListElement { time: "11:00 PM"; action: "Turn Off" }
                }

                delegate: Rectangle {
                    width: parent.width
                    height: 60
                    radius: 10
                    color: "white"
                    border.color: "#cccccc"
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Text {
                            text: time
                            font.pixelSize: 16
                            color: "#333333"
                        }

                        Text {
                            text: action
                            font.pixelSize: 16
                            color: "#555555"
                        }

                        Button {
                            text: "Delete"
                            Layout.alignment: Qt.AlignRight
                            onClicked: {
                                scheduleModel.remove(index);
                            }
                        }
                    }
                }
            }

            // Add Schedule Button
            Button {
                text: "Add New Schedule"
                Layout.fillWidth: true
                font.pixelSize: 18
                onClicked: addScheduleDialog.open()
            }
        }
    }

    // Add Schedule Dialog
    Dialog {
        id: addScheduleDialog
        modal: true
        title: "Add New Schedule"
        standardButtons: Dialog.Ok | Dialog.Cancel

        contentItem: ColumnLayout {
            spacing: 10
            width: parent.width - 40

            // Time Picker Using SpinBoxes
            RowLayout {
                spacing: 10
                Label {
                    text: "Time:"
                }

                // Hour Spinner
                SpinBox {
                    id: hourSpinBox
                    from: 0
                    to: 23
                    stepSize: 1
                    value: 12
                    width: 60
                }

                Text { text: ":" }

                // Minute Spinner
                SpinBox {
                    id: minuteSpinBox
                    from: 0
                    to: 59
                    stepSize: 1
                    value: 0
                    width: 60
                }

                ComboBox {
                    id: amPmComboBox
                    model: ["AM", "PM"]
                    currentIndex: 0
                    width: 60
                }
            }

            // Action Picker
            RowLayout {
                spacing: 10
                Label {
                    text: "Action:"
                }
                ComboBox {
                    id: actionPicker
                    model: ["Turn On", "Turn Off", "Dim", "Custom Action"]
                }
            }
        }

        onAccepted: {
            // Format the time in hh:mm AM/PM format
            var hour = hourSpinBox.value;
            var minute = minuteSpinBox.value;
            var ampm = amPmComboBox.currentText;

            // Adjust for 12-hour format
            if (ampm === "PM" && hour !== 12) {
                hour += 12;
            } else if (ampm === "AM" && hour === 12) {
                hour = 0;
            }

            var time = Qt.formatTime(Qt.time(hour, minute), "hh:mm AP");

            scheduleModel.append({
                time: time,
                action: actionPicker.currentText
            });
        }
    }
}
