
rule SmartThingsEdgeDriverSourceCode
{
    meta:
        description = "YARA rule to match SmartThings Edge Driver Source Code based on extracted identifiers"
        author = "Huan Bui"

    strings:
        $test_0 = "test"
        $require_1 = "require"
        $integration_test_2 = "integration_test"
        $capabilities_3 = "capabilities"
        $st_4 = "st"
        $data_types_5 = "data_types"
        $zigbee_6 = "zigbee"
        $zcl_clusters_7 = "zcl_clusters"
        $zcl_8 = "zcl"
        $clusters_9 = "clusters"
        $zigbee_test_utils_10 = "zigbee_test_utils"
        $t_utils_11 = "t_utils"
        $utils_12 = "utils"
        $tuya_types_13 = "tuya_types"
        $generated_14 = "generated"
        $TuyaEF00_15 = "TuyaEF00"
        $types_16 = "types"
        $profile_17 = "profile"
        $get_profile_definition_18 = "get_profile_definition"
        $normal_19 = "normal"
        $presenceSensor_20 = "presenceSensor"
        $v1_21 = "v1"
        $yaml_22 = "yaml"
        $load_all_caps_from_profile_23 = "load_all_caps_from_profile"
        $mock_parent_device_24 = "mock_parent_device"
        $mock_device_25 = "mock_device"
        $build_test_zigbee_device_26 = "build_test_zigbee_device"
        $zigbee_endpoints_27 = "zigbee_endpoints"
        $1_28 = "1"
        $id_29 = "id"
        $manufacturer_30 = "manufacturer"
        $_TZE200_ztc6ggyl_31 = "_TZE200_ztc6ggyl"
        $model_32 = "model"
        $TS0601_33 = "TS0601"
        $server_clusters_34 = "server_clusters"
        $0x0000_35 = "0x0000"
        $0xEF00_36 = "0xEF00"
        $client_clusters_37 = "client_clusters"
        $fingerprinted_endpoint_id_38 = "fingerprinted_endpoint_id"
        $0x01_39 = "0x01"
        $test_init_40 = "test_init"
        $function_41 = "function"
        $send_spell_42 = "send_spell"
        $add_test_device_43 = "add_test_device"
        $end_44 = "end"
        $register_message_test_45 = "register_message_test"
        $device_lifecycle_46 = "device_lifecycle"
        $added_47 = "added"
        $channel_48 = "channel"
        $direction_49 = "direction"
        $receive_50 = "receive"
        $message_51 = "message"
        $send_52 = "send"
        $commands_53 = "commands"
        $McuSyncTime_54 = "McuSyncTime"
        $expect_spell_55 = "expect_spell"
        $capability_56 = "capability"
        $expect_settings_57 = "expect_settings"
        $table_58 = "table"
        $style_59 = "style"
        $font_60 = "font"
        $size_61 = "size"
        $0_62 = "0"
        $6em_63 = "6em"
        $min_64 = "min"
        $width_65 = "width"
        $100_66 = "100"
        $tbody_67 = "tbody"
        $tr_68 = "tr"
        $th_69 = "th"
        $align_70 = "align"
        $left_71 = "left"
        $50_72 = "50"
        $detection_delay_73 = "detection_delay"
        $td_74 = "td"
        $fading_time_75 = "fading_time"
        $90_76 = "90"
        $far_detection_77 = "far_detection"
        $1000_78 = "1000"
        $near_detection_79 = "near_detection"
        $sensitivity_80 = "sensitivity"
        $7_81 = "7"
        $init_82 = "init"
        $From_83 = "From"
        $DP_84 = "DP"
        $presence_85 = "presence"
        $sensor_86 = "sensor"
        $DataReport_87 = "DataReport"
        $build_test_rx_88 = "build_test_rx"
        $Boolean_89 = "Boolean"
        $true_90 = "true"
        $generate_test_message_91 = "generate_test_message"
        $main_92 = "main"
        $present_93 = "present"
        $104_94 = "104"
        $illuminance_95 = "illuminance"
        $measurement_96 = "measurement"
        $Uint32_97 = "Uint32"
        $234_98 = "234"
        $illuminanceMeasurement_99 = "illuminanceMeasurement"
        $1822_100 = "1822"
        $infoChanged_101 = "infoChanged"
        $settings_102 = "settings"
        $generate_info_changed_103 = "generate_info_changed"
        $preferences_104 = "preferences"
        $normal_presenceSensor_v1_105 = "normal_presenceSensor_v1"
        $prefSensitivity_106 = "prefSensitivity"
        $4_107 = "4"
        $prefNearDetection_108 = "prefNearDetection"
        $15_109 = "15"
        $prefFarDetection_110 = "prefFarDetection"
        $85_111 = "85"
        $prefDetectionDelay_112 = "prefDetectionDelay"
        $prefFadingTime_113 = "prefFadingTime"
        $10_114 = "10"
        $DataRequest_115 = "DataRequest"
        $101_116 = "101"
        $102_117 = "102"
        $3_118 = "3"
        $2_119 = "2"

    condition:
        any of them
}
