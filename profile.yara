
rule SmartThingsEdgeDriverProfile
{
    meta:
        description = "YARA rule to match SmartThings Edge Driver Profile based on YAML attributes"
        author = "Huan Bui"

    strings:
        $var_0 = "motion-temp-battery"
        $var_1 = "main"
        $var_2 = "motionSensor"
        $var_3 = "1"
        $var_4 = "temperatureMeasurement"
        $var_5 = "1"
        $var_6 = "battery"
        $var_7 = "1"
        $var_8 = "firmwareUpdate"
        $var_9 = "1"
        $var_10 = "refresh"
        $var_11 = "1"
        $var_12 = "MotionSensor"
        $var_13 = "tempOffset"
        $var_14 = "True"

    condition:
        any of them
}
