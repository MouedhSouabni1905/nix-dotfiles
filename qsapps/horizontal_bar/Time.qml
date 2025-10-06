import Quickshell
import Quickshell.Io
import QtQuick

Scope {
        id: root



        readonly property string time: {
                Qt.formatDateTime(clock.date, "hh:mm AP")
        }

        readonly property string date: {
                Qt.formatDateTime(clock.date, "ddd MMM d yyyy")
        }

        SystemClock {
                id: clock
                precision: SystemClock.Seconds
        }

}
