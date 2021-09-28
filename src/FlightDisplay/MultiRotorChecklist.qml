/****************************************************************************
 *
 *   (c) 2009-2016 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick                      2.11
import QtQuick.Controls             2.4
import QtQml.Models                 2.1

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.FactSystem    1.0
import QGroundControl.FactControls  1.0
import QGroundControl.Controls      1.0
import QGroundControl.FlightDisplay 1.0
import QGroundControl.Vehicle       1.0

Item {
    id: checklistItem
    property var model: listModel

    PreFlightCheckModel {
        id:     listModel
        PreFlightCheckGroup {
            name: qsTr("Setup checklist")

            PreFlightCheckButton {
                name:           qsTr("INSPECT")
                manualText:     qsTr("All modules and payloads secured and fully mated")
            }

            PreFlightCheckButton {
                name:           qsTr("VERIFY")
                manualText:     qsTr("Propeller blades clocked to prevent hang-up")
            }

            PreFlightCheckButton {
                name:           qsTr("RECOMMENDED")
                manualText:     qsTr("LEDs facing pilot")
            }
        }

        PreFlightCheckGroup {
            name: qsTr("Configuration checklist")

            PreFlightCheckButton {
                name:            qsTr("VERIFY")
                manualText:      qsTr("Spirit configuration settings are accurate (see configuration screen)")
            }

            PreFlightCheckButton {
                name:            qsTr("VERIFY")
                manualText:      qsTr("ONE battery mounted on top")
            }
        }

        PreFlightCheckGroup {
            name: qsTr("Mission checklist")

            PreFlightCheckButton {
                name:           qsTr("VERIFY")
                manualText:     qsTr("Wind and weather within limits")
            }

            PreFlightCheckButton {
                name:           qsTr("CHECK")
                manualText:     qsTr("Geofence settings")
            }

            PreFlightCheckButton {
                name:           qsTr("CHECK")
                manualText:     qsTr("RTL settings")
            }

            PreFlightCheckButton {
                name:           qsTr("CHECK")
                manualText:     qsTr("Mission waypoints and altitudes set correctly")
            }

        }


        PreFlightCheckGroup {
            name: qsTr("Takeoff checklist")

            PreFlightCheckButton {
                name:           qsTr("VERIFY")
                manualText:     qsTr("LEDS flashing green")
            }

            PreFlightCheckButton {
                name:           qsTr("VERIFY")
                manualText:     qsTr("Reported heading is correct")
            }

            PreFlightCheckButton {
                name:           qsTr("VERIFY")
                manualText:     qsTr("HereLink controller charged")
            }
        
            PreFlightCheckButton {
                name:           qsTr("CHECK")
                manualText:     qsTr("Current flight mode")
            }

            PreFlightBatteryCheck {
                failureVoltage:                 43
                allowFailureVoltageOverride:    false
            }

            PreFlightSensorsHealthCheck {
            }

            PreFlightGPSCheck {
                failureSatCount:       6
                allowOverrideSatCount:  true
            }
        }
    }
}


