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
                name:           qsTr("INSPECT ASSEMBLY")
                manualText:     qsTr("All modules and payloads secured and click rings fully mated")
            }

            PreFlightCheckButton {
                name:           qsTr("VERIFY PROPELLERS")
                manualText:     qsTr("Blades clocked to prevent hang-up")
            }

            PreFlightCheckButton {
                name:           qsTr("ORIENT VEHICLE")
                manualText:     qsTr("Orient vehicle so LEDs face the pilot")
            }
        }

        PreFlightCheckGroup {
            name: qsTr("Configuration checklist")

            PreFlightCheckButton {
                name:            qsTr("VERIFY SETTINGS")
                manualText:      qsTr("Spirit configuration settings are accurate (see configuration screen)")
            }

            PreFlightCheckButton {
                name:            qsTr("CONFIRM BATTERY ON TOP")
                manualText:      qsTr("At least ONE battery mounted on top")
            }
        }

        PreFlightCheckGroup {
            name: qsTr("Mission checklist")

            PreFlightCheckButton {
                name:           qsTr("CHECK METEO")
                manualText:     qsTr("Wind and weather within limits")
            }

            PreFlightCheckButton {
                name:           qsTr("CHECK GEOFENCE")
                manualText:     qsTr("Correct distance and altitude")
            }

            PreFlightCheckButton {
                name:           qsTr("CHECK RTL/FAILSAFES")
                manualText:     qsTr("")
            }

            PreFlightCheckButton {
                name:           qsTr("CHECK MISSION")
                manualText:     qsTr("Waypoints and altitudes set correctly")
            }

        }


        PreFlightCheckGroup {
            name: qsTr("Takeoff checklist")

            PreFlightCheckButton {
                name:           qsTr("LEDs FLASH GREEN")
                manualText:     qsTr("")
            }

            PreFlightCheckButton {
                name:           qsTr("VERIFY VEHICLE HEADING")
                manualText:     qsTr("Reported heading is correct")
            }

            PreFlightCheckButton {
                name:           qsTr("VERIFY CONTROLLER BATTERY")
                manualText:     qsTr("HereLink controller charged")
            }
        
            PreFlightCheckButton {
                name:           qsTr("CHECK FLIGHT MODE")
                manualText:     qsTr("Current flight mode set as expected")
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


