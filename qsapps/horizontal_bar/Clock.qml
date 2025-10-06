import QtQuick
import Quickshell
import QtQuick.Controls

Button {
        id: root
        required property string time

        contentItem: Text {
                text: root.time
                font.family: "Noto" 
                font.bold: true
                color: "#6799fc"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 120
                implicitHeight: 28
                border.color: "#6799fc"
                border.width: 2
                radius: 3
                color: "#4000a8"
            }
        }
