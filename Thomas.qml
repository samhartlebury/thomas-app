import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Canvas {
    width: 100
    height: 100

    readonly property alias timer: timer
    readonly property alias leftPupil: leftPupil
    readonly property alias rightPupil: rightPupil

    onPaint: {
        //        var ctx = getContext('2d');
        //        ctx.clearRect(0, 0, width, height);
        //        ctx.strokeStyle = "black"
        //        ctx.lineWidth = width / 100 * 2;
        //        ctx.beginPath();
        //        ctx.moveTo(midx, head.height);
        //        ctx.stroke();
    }

    Image {
        id: thomasImage
        source: "qrc:/Head-OnThomasPromo.png"
        anchors.fill: parent
    }

    Rectangle {
        id: mouth
        color: "black"
        border.color: "gray"
        border.width: parent.width / 100
        width: parent.width / 8
        height: width
        radius: width / 2
        x: parent.width / 100 * 59
        y: parent.width / 100 * 39
        visible: false
    }

    Rectangle {
        id: leftEye
        color: "white"
        width: parent.width / 15
        height: width
        radius: width / 2
        x: parent.width / 100 * 54
        y: parent.width / 100 * 28

        Rectangle {
            id: leftPupil
            color: "black"
            width: parent.width / 2
            height: width
            radius: width / 2
            x: (parent.width / 2) - (width / 2)
            y: (parent.width / 2) - (height / 2)
        }
    }
    Rectangle {
        id: rightEye
        color: "white"
        width: parent.width / 15
        height: width
        radius: width / 2
        x: parent.width / 100 * 70
        y: parent.width / 100 * 28

        Rectangle {
            id: rightPupil
            color: "black"
            width: parent.width / 2
            height: width
            radius: width / 2
            x: (parent.width / 2) - (width / 2)
            y: (parent.width / 2) - (height / 2)
        }
    }

    Timer {
        id: timer
        property real counter: 0
        property real counterInterval: 0.01;
        interval: 3; running: true; repeat: true
        onTriggered: {
            leftPupil.x = (((leftEye.width / 3)) * Math.sin(counter)) + (leftPupil.width / 2);
            leftPupil.y = (((leftEye.width / 3)) * Math.cos(counter)) + (leftPupil.width / 2);

            rightPupil.x = (((rightEye.width / 3)) * Math.cos(counter)) + (rightPupil.width / 2);
            rightPupil.y = (((rightEye.width / 3)) * Math.sin(counter)) + (rightPupil.width / 2);

            if (counterInterval > 0.2)
                mouth.visible = true;

            counter = counter + counterInterval;
        }
    }
}

