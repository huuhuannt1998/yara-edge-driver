
rule YAMLEdgeDriverProfile
{
    meta:
        description = "YARA rule to match attributes in a YAML configuration"
        author = "Huan Bui"

    strings:
        $name_0 = "name"
        $name_1 = "normal-contactSensor-v1"
        $components_2 = "components"
        $id_3 = "id"
        $id_4 = "main"
        $label_5 = "label"
        $label_6 = "Contact Sensor"
        $capabilities_7 = "capabilities"
        $id_8 = "id"
        $id_9 = "contactSensor"
        $version_10 = "version"
        $version_11 = "1"
        $id_12 = "id"
        $id_13 = "signalStrength"
        $version_14 = "version"
        $version_15 = "1"
        $id_16 = "id"
        $id_17 = "refresh"
        $version_18 = "version"
        $version_19 = "1"
        $id_20 = "id"
        $id_21 = "valleyboard16460.debug"
        $version_22 = "version"
        $version_23 = "1"
        $categories_24 = "categories"
        $name_25 = "name"
        $name_26 = "Contact Sensor"
        $preferences_27 = "preferences"
        $name_28 = "name"
        $name_29 = "profile"
        $title_30 = "title"
        $title_31 = "Profile"
        $description_32 = "description"
        $description_33 = "Choose the profile"
        $required_34 = "required"
        $required_35 = "True"
        $preferenceType_36 = "preferenceType"
        $preferenceType_37 = "enumeration"
        $definition_38 = "definition"
        $options_39 = "options"
        $normal_contactSensor_v1_40 = "normal_contactSensor_v1"
        $normal_contactSensor_v1_41 = "Normal"
        $normal_contactSensor_v2_42 = "normal_contactSensor_v2"
        $normal_contactSensor_v2_43 = "+Battery"
        $generic_ef00_v1_44 = "generic_ef00_v1"
        $generic_ef00_v1_45 = "Generic"
        $default_46 = "default"
        $default_47 = "normal_contactSensor_v1"
        $name_48 = "name"
        $name_49 = "logLevel"
        $title_50 = "title"
        $title_51 = "Log level"
        $required_52 = "required"
        $required_53 = "True"
        $preferenceType_54 = "preferenceType"
        $preferenceType_55 = "enumeration"
        $definition_56 = "definition"
        $options_57 = "options"
        $error_58 = "error"
        $error_59 = "Error"
        $warn_60 = "warn"
        $warn_61 = "Warn, Error"
        $info_62 = "info"
        $info_63 = "Info, Warn, Error"
        $debug_64 = "debug"
        $debug_65 = "Debug, Info, Warn, Error"
        $default_66 = "default"
        $default_67 = "error"
        $preferenceId_68 = "preferenceId"
        $preferenceId_69 = "reverse"
        $explicit_70 = "explicit"
        $explicit_71 = "True"
        $name_72 = "name"
        $name_73 = "dpContactSensorMain01"
        $title_74 = "title"
        $title_75 = "DP for Contact Sensor"
        $description_76 = "description"
        $description_77 = "Only if you want to override the default DataPoint"
        $required_78 = "required"
        $required_79 = "True"
        $preferenceType_80 = "preferenceType"
        $preferenceType_81 = "integer"
        $definition_82 = "definition"
        $minimum_83 = "minimum"
        $minimum_84 = "0"
        $maximum_85 = "maximum"
        $maximum_86 = "255"
        $default_87 = "default"
        $default_88 = "0"
        $metadata_89 = "metadata"
        $deviceType_90 = "deviceType"
        $deviceType_91 = "ContactSensor"
        $ocfDeviceType_92 = "ocfDeviceType"
        $ocfDeviceType_93 = "x.com.st.d.sensor.contact"
        $deviceTypeId_94 = "deviceTypeId"
        $deviceTypeId_95 = "ContactSensor"
        $mnmn_96 = "mnmn"
        $mnmn_97 = "SmartThingsCommunity"
        $owner_98 = "owner"
        $ownerType_99 = "ownerType"
        $ownerType_100 = "USER"
        $ownerId_101 = "ownerId"
        $ownerId_102 = "ea35e8c8-3aef-2f72-958b-e3ad10644043"

    condition:
        any of them
}
