import QtQuick 2.5
import QtQuick.Controls 1.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Thomas")

    Thomas {
        id: thomas
        width: parent.width < parent.height ? parent.width : parent.height
        height: parent.width < parent.height ? parent.width : parent.height
        anchors.centerIn: parent

        MouseArea {
            anchors.fill: parent
            onPressed: thomas.timer.counterInterval = thomas.timer.counterInterval * 1.1;
        }
    }
}

