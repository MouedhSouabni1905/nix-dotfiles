import Quickshell
import QtQuick
import "../themes"

Scope {
        id: root
        property bool onDate : false

        Time {
                id: timeSource
        }

        Variants {
                model: Quickshell.screens

                PanelWindow {
                        required property var modelData
                        screen: modelData
                        
                        color: Theme.topBarBg

                        anchors {
                                top: true
                                left: true
                                right: true
                        }

                        implicitHeight: 30

                        Clock {
                                anchors.centerIn: parent
                                time: root.onDate ? timeSource.date : timeSource.time
                                onClicked: root.onDate = !root.onDate
                        }

                }

        }

}
