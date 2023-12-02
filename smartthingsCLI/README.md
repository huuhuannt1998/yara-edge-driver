# yara-edge-driver

The main edge driver we use in this project is zigbee-motion-sensor.

In side zigbee-motion-sensor folder, we have 3 folders: capabilities, profiles, and src

Capabilities:
I created two custom capabilities to show the min and max interval time (hiddenAttributesMin and hiddenAttributesMax). The custom capabilities are used for showing the values of minReportingInterval and minReportingInterval in the preferences.

Profiles:
The main profile I use in this project is motion-temp-battery.yml. In this project, I added two custom preferences which are minReportingInterval and maxReportingInterval
Goal: I need to make them show on the UI. When users update the min and max values in the setting, they will show on the main page of the device.

Src:
In the init.lua, I have addded handlers in order to handle the events when we change the values of minReportingInterval and maxReportingInterval
