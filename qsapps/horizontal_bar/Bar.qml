import Quickshell
import QtQuick

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
                        
                        color: "#4000a8"

                        margins {
                                top: 3
                                left: 3
                                right: 3
                                bottom: 3
                        }


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
