
rule SmartThingsEdgeDriverProfile
{
    meta:
        description = "YARA rule to match SmartThings Edge Driver Profile based on YAML attributes"
        author = "Huan Bui"

    strings:
        $var_0 = "hue-motion-sensor"
        $var_1 = "main"
        $var_2 = "motionSensor"
        $var_3 = "1"
        $var_4 = "temperatureMeasurement"
        $var_5 = "1"
        $var_6 = "illuminanceMeasurement"
        $var_7 = "1"
        $var_8 = "battery"
        $var_9 = "1"
        $var_10 = "MotionSensor"
        $var_11 = "tempOffset"
        $var_12 = "True"
        $var_13 = "motionSensitivity"
        $var_14 = "Motion Sensitivity Level"
        $var_15 = "True"
        $var_16 = "motionSensitivityAvoidSTError"
        $var_17 = "enumeration"
        $var_18 = "Low"
        $var_19 = "Medium"
        $var_20 = "High"
        $var_21 = "sensitivityHigh"

    condition:
        any of them
}
