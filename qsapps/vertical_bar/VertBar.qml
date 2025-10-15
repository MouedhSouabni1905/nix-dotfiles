import Quickshell
import QtQuick
import "../themes"

Scope {
        id: root

        Variants {
                model: Quickshell.screens

                PanelWindow {
                        required property var modelData
                        screen: modelData
                        
                        color: Theme.sideBarBg

                        anchors {
                                top: true
                                left: true
                                right: false
                                bottom: true
                        }

                        implicitWidth: 50

                }

        }

}
