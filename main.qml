import QtQuick 2.13
import QtQuick.Window 2.13

import QtQuick.Controls 2.13
import QtQuick.Shapes 1.13

Window {
    width: 480
    height: 640
    visible: true

    PathView {
        id: pathView

        width: parent.width
        height: width

        anchors {
            bottom: parent.bottom
            left: parent.left
        }

        pathItemCount: 10
        model: 20
        snapMode: PathView.NoSnap

        delegate: Rectangle {
            width: 100
            height: 100
            border.color: "black"
            border.width: 1
            color: "yellow"

            rotation: PathView.itemRotation

            Text {
                anchors.centerIn:  parent
                text: "test " + index
            }
        }

        path: Path {
            PathAttribute {name: "itemRotation"; value: -45}
            PathAngleArc {
                centerX: pathView.x
                centerY: pathView.y + pathView.height
                radiusX: pathView.width
                radiusY: radiusX
                startAngle: -135
                sweepAngle: 180
            }
            PathAttribute {name: "itemRotation"; value: 135}

        }
    }
}
