
rule YAMLEdgeDriverProfile
{
    meta:
        description = "YARA rule to match attributes in a YAML configuration"
        author = "Huan Bui"

    strings:
        $name_0 = "name"
        $name_1 = "normal-presenceSensor-v1"
        $components_2 = "components"
        $id_3 = "id"
        $id_4 = "main"
        $label_5 = "label"
        $label_6 = "Presence Sensor"
        $capabilities_7 = "capabilities"
        $id_8 = "id"
        $id_9 = "presenceSensor"
        $version_10 = "version"
        $version_11 = "1"
        $id_12 = "id"
        $id_13 = "illuminanceMeasurement"
        $version_14 = "version"
        $version_15 = "1"
        $id_16 = "id"
        $id_17 = "valleyboard16460.settings"
        $version_18 = "version"
        $version_19 = "1"
        $id_20 = "id"
        $id_21 = "signalStrength"
        $version_22 = "version"
        $version_23 = "1"
        $id_24 = "id"
        $id_25 = "refresh"
        $version_26 = "version"
        $version_27 = "1"
        $id_28 = "id"
        $id_29 = "valleyboard16460.debug"
        $version_30 = "version"
        $version_31 = "1"
        $categories_32 = "categories"
        $name_33 = "name"
        $name_34 = "Presence Sensor"
        $preferences_35 = "preferences"
        $name_36 = "name"
        $name_37 = "profile"
        $title_38 = "title"
        $title_39 = "Profile"
        $description_40 = "description"
        $description_41 = "Choose the profile  "
        $required_42 = "required"
        $required_43 = "True"
        $preferenceType_44 = "preferenceType"
        $preferenceType_45 = "enumeration"
        $definition_46 = "definition"
        $options_47 = "options"
        $normal_presenceSensor_v1_48 = "normal_presenceSensor_v1"
        $normal_presenceSensor_v1_49 = "Normal"
        $normal_presenceSensor_v2_50 = "normal_presenceSensor_v2"
        $normal_presenceSensor_v2_51 = "No illuminance"
        $normal_presenceSensor_v3_52 = "normal_presenceSensor_v3"
        $normal_presenceSensor_v3_53 = "+Battery"
        $normal_presenceSensor_v4_54 = "normal_presenceSensor_v4"
        $normal_presenceSensor_v4_55 = "+Relay"
        $generic_ef00_v1_56 = "generic_ef00_v1"
        $generic_ef00_v1_57 = "Generic"
        $default_58 = "default"
        $default_59 = "normal_presenceSensor_v1"
        $name_60 = "name"
        $name_61 = "logLevel"
        $title_62 = "title"
        $title_63 = "Log level"
        $required_64 = "required"
        $required_65 = "True"
        $preferenceType_66 = "preferenceType"
        $preferenceType_67 = "enumeration"
        $definition_68 = "definition"
        $options_69 = "options"
        $error_70 = "error"
        $error_71 = "Error"
        $warn_72 = "warn"
        $warn_73 = "Warn, Error"
        $info_74 = "info"
        $info_75 = "Info, Warn, Error"
        $debug_76 = "debug"
        $debug_77 = "Debug, Info, Warn, Error"
        $default_78 = "default"
        $default_79 = "error"
        $name_80 = "name"
        $name_81 = "manufacturer"
        $title_82 = "title"
        $title_83 = "Manufacturer"
        $description_84 = "description"
        $description_85 = "Choose the manufacturer"
        $required_86 = "required"
        $required_87 = "False"
        $preferenceType_88 = "preferenceType"
        $preferenceType_89 = "enumeration"
        $definition_90 = "definition"
        $options_91 = "options"
        $__92 = "_"
        $__93 = "Auto"
        $_TZE200_ikvncluo_94 = "_TZE200_ikvncluo"
        $_TZE200_ikvncluo_95 = "_TZE200_ikvncluo (1,104)"
        $_TZE200_ztc6ggyl_96 = "_TZE200_ztc6ggyl"
        $_TZE200_ztc6ggyl_97 = "_TZE200_ztc6ggyl (1,104)"
        $_TZE204_sxm7l9xa_98 = "_TZE204_sxm7l9xa"
        $_TZE204_sxm7l9xa_99 = "_TZE204_sxm7l9xa (105,104)"
        $_TZE204_ztc6ggyl_100 = "_TZE204_ztc6ggyl"
        $_TZE204_ztc6ggyl_101 = "_TZE204_ztc6ggyl (1,104)"
        $preferenceId_102 = "preferenceId"
        $preferenceId_103 = "reverse"
        $explicit_104 = "explicit"
        $explicit_105 = "True"
        $name_106 = "name"
        $name_107 = "prefSensitivity"
        $title_108 = "title"
        $title_109 = "Sensitivity"
        $description_110 = "description"
        $description_111 = "An integer between 0 and 9"
        $required_112 = "required"
        $required_113 = "True"
        $preferenceType_114 = "preferenceType"
        $preferenceType_115 = "integer"
        $definition_116 = "definition"
        $minimum_117 = "minimum"
        $minimum_118 = "0"
        $maximum_119 = "maximum"
        $maximum_120 = "9"
        $default_121 = "default"
        $default_122 = "7"
        $name_123 = "name"
        $name_124 = "prefNearDetection"
        $title_125 = "title"
        $title_126 = "Near Detection (cm)"
        $description_127 = "description"
        $description_128 = "A integer between 0 and 1000"
        $required_129 = "required"
        $required_130 = "True"
        $preferenceType_131 = "preferenceType"
        $preferenceType_132 = "integer"
        $definition_133 = "definition"
        $minimum_134 = "minimum"
        $minimum_135 = "0"
        $maximum_136 = "maximum"
        $maximum_137 = "1000"
        $default_138 = "default"
        $default_139 = "0"
        $name_140 = "name"
        $name_141 = "prefFarDetection"
        $title_142 = "title"
        $title_143 = "Far Detection (cm)"
        $description_144 = "description"
        $description_145 = "A integer between 0 and 1000"
        $required_146 = "required"
        $required_147 = "True"
        $preferenceType_148 = "preferenceType"
        $preferenceType_149 = "integer"
        $definition_150 = "definition"
        $minimum_151 = "minimum"
        $minimum_152 = "0"
        $maximum_153 = "maximum"
        $maximum_154 = "1000"
        $default_155 = "default"
        $default_156 = "1000"
        $name_157 = "name"
        $name_158 = "prefDetectionDelay"
        $title_159 = "title"
        $title_160 = "Detection Delay (s)"
        $description_161 = "description"
        $description_162 = "A integer between 0 and 100"
        $required_163 = "required"
        $required_164 = "True"
        $preferenceType_165 = "preferenceType"
        $preferenceType_166 = "integer"
        $definition_167 = "definition"
        $minimum_168 = "minimum"
        $minimum_169 = "0"
        $maximum_170 = "maximum"
        $maximum_171 = "100"
        $default_172 = "default"
        $default_173 = "1"
        $name_174 = "name"
        $name_175 = "prefFadingTime"
        $title_176 = "title"
        $title_177 = "Fading Time (s) !"
        $description_178 = "description"
        $description_179 = "A integer between 0 and 15000. ATTENTION: Lower values may jam the zigbee network"
        $required_180 = "required"
        $required_181 = "True"
        $preferenceType_182 = "preferenceType"
        $preferenceType_183 = "integer"
        $definition_184 = "definition"
        $minimum_185 = "minimum"
        $minimum_186 = "0"
        $maximum_187 = "maximum"
        $maximum_188 = "15000"
        $default_189 = "default"
        $default_190 = "90"
        $name_191 = "name"
        $name_192 = "dpPresenceSensorMain01"
        $title_193 = "title"
        $title_194 = "DP for Presence Sensor"
        $description_195 = "description"
        $description_196 = "Only if you want to override the default DataPoint"
        $required_197 = "required"
        $required_198 = "True"
        $preferenceType_199 = "preferenceType"
        $preferenceType_200 = "integer"
        $definition_201 = "definition"
        $minimum_202 = "minimum"
        $minimum_203 = "0"
        $maximum_204 = "maximum"
        $maximum_205 = "255"
        $default_206 = "default"
        $default_207 = "0"
        $name_208 = "name"
        $name_209 = "dpIlluminanceMeasuMain01"
        $title_210 = "title"
        $title_211 = "DP for Illuminance Measurement"
        $description_212 = "description"
        $description_213 = "Only if you want to override the default DataPoint"
        $required_214 = "required"
        $required_215 = "True"
        $preferenceType_216 = "preferenceType"
        $preferenceType_217 = "integer"
        $definition_218 = "definition"
        $minimum_219 = "minimum"
        $minimum_220 = "0"
        $maximum_221 = "maximum"
        $maximum_222 = "255"
        $default_223 = "default"
        $default_224 = "0"
        $metadata_225 = "metadata"
        $deviceType_226 = "deviceType"
        $deviceType_227 = "PresenceSensor"
        $ocfDeviceType_228 = "ocfDeviceType"
        $ocfDeviceType_229 = "x.com.st.d.sensor.presence"
        $deviceTypeId_230 = "deviceTypeId"
        $deviceTypeId_231 = "PresenceSensor"
        $mnmn_232 = "mnmn"
        $mnmn_233 = "SmartThingsCommunity"
        $owner_234 = "owner"
        $ownerType_235 = "ownerType"
        $ownerType_236 = "USER"
        $ownerId_237 = "ownerId"
        $ownerId_238 = "ea35e8c8-3aef-2f72-958b-e3ad10644043"

    condition:
        any of them
}
