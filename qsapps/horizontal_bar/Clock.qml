import QtQuick
import Quickshell
import QtQuick.Controls
import "../themes"

Button {
        id: root
        required property string time

        contentItem: Text {
                text: root.time
                font.family: "Noto" 
                font.bold: true
                color: Theme.textColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: MouseArea {
                hoverEnabled: true
                onEntered: rect.color = Theme.topBarButton
                onExited: rect.color = Theme.topBarBg
                implicitWidth: 120
                implicitHeight: 25

                Rectangle {
                                id: rect
                                implicitWidth: 120
                                implicitHeight: 25
                                radius: 3
                                color: Theme.topBarBg
                }

        }
}
