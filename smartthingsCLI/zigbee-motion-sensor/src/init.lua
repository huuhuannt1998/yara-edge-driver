-- Copyright 2022 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
local capabilities = require "st.capabilities"
local ZigbeeDriver = require "st.zigbee"
local battery_defaults = require "st.zigbee.defaults.battery_defaults"
local detectMin = capabilities["stse.detectionMin"]
local detectMax = capabilities["stse.detectionMax"]
local aqara_utils = require "motion_utils"

local battery_table = {
  [2.80] = 100,
  [2.70] = 100,
  [2.60] = 100,
  [2.50] = 90,
  [2.40] = 90,
  [2.30] = 70,
  [2.20] = 70,
  [2.10] = 50,
  [2.00] = 50,
  [1.90] = 30,
  [1.80] = 30,
  [1.70] = 15,
  [1.60] = 1,
  [1.50] = 0
}

-- local function interval_check_handler(driver, device)
--   local minInterval = device.preferences.minReportingInterval
--   local maxInterval = device.preferences.maxReportingInterval

--   if minInterval < 30 or maxInterval > 3600 then
--     -- Replace the following line with your desired error handling approach
--     device:send("Reporting interval is out of acceptable range")
--   end
-- end

-- -- Function to handle changes in preferences
-- local function preferences_changed_handler(driver, device, event, args)
--   if args.old_st_store.preferences.minReportingInterval ~= device.preferences.minReportingInterval then
--     driver:log("minReportingInterval changed to: " .. tostring(device.preferences.minReportingInterval))
--     interval_check_handler(driver, device)  -- Call interval check here
--   end

--   if args.old_st_store.preferences.maxReportingInterval ~= device.preferences.maxReportingInterval then
--     driver:log("maxReportingInterval changed to: " .. tostring(device.preferences.maxReportingInterval))
--     interval_check_handler(driver, device)  -- Call interval check here
--   end
-- end

-- local function init_handler(driver, device)
--   battery_defaults.enable_battery_voltage_table(device, battery_table)
-- end

-- local smartthings_motion = {
--   NAME = "SmartThings Motion Sensor",
--   lifecycle_handlers = {
--     init = init_handler,
--     check_interval = interval_check_handler,
--     preferences_changed = preferences_changed_handler
--   },
--   can_handle = function(opts, driver, device, ...)
--     return device:get_manufacturer() == "SmartThings"
--   end
-- }

-- https://github.com/SmartThingsCommunity/SmartThingsEdgeDrivers/blob/fb05027f64b7c866c8f54e821a7c7a717f4e3eb1/drivers/SmartThings/zigbee-motion-sensor/src/aqara/aqara_utils.lua
-- SmartThingsEdgeDrivers/drivers/SmartThings/zigbee-motion-sensor/src/aqara/aqara_utils.lua
-- Get min and max Interval // Apply this code 12/01

local function get_pref_min(device)
  return device:get_field(device.preferences.minReportingInterval)
end

local function set_pref_min(device,value)
  device:set_field(device.preferences.minReportingInterval, value)
end

local function get_pref_max(device)
    return device:get_field(device.preferences.maxReportingInterval)
end
  
local function set_pref_max(device, value)
    device:set_field(device.preferences.maxReportingInterval, value)
end 
-- End get min max

local detectionMin = capabilities["stse.detectionMin"]
local setDetectionMin = "setDetectionMin"

local detectionMax = capabilities["stse.detectionMax"]
local setDetectionMax = "setDetectionMax"

print("Checkpoint 1 - Min 1:", detectionMin)
-- Handler to check reporting intervals
local function interval_check_handler(driver, device)
  local minInterval = device.preferences.minReportingInterval
  local maxInterval = device.preferences.maxReportingInterval

  print("Checkpoint 2 - Min 2:", minInterval)

  if minInterval < 30 or maxInterval > 3600 then
    driver:log("Error: Reporting interval is out of acceptable range")
    -- You can add additional error handling here if needed
  end
end

-- Function to handle changes in preferences
local function preferences_changed_handler(driver, device, event, args)
  if args.old_st_store.preferences.minReportingInterval ~= device.preferences.minReportingInterval then
    driver:log("minReportingInterval changed to: " .. tostring(device.preferences.minReportingInterval))
    interval_check_handler(driver, device)  -- Call interval check here
  end

  if args.old_st_store.preferences.maxReportingInterval ~= device.preferences.maxReportingInterval then
    driver:log("maxReportingInterval changed to: " .. tostring(device.preferences.maxReportingInterval))
    interval_check_handler(driver, device)  -- Call interval check here
  end
end

-- Initialization handler
local function init_handler(driver, device)
  battery_defaults.enable_battery_voltage_table(device, battery_table)
  interval_check_handler(driver, device)  -- Call interval check during initialization
end

-- Main device handler
local smartthings_motion = {
  NAME = "SmartThings Motion Sensor",
  lifecycle_handlers = {
    init = init_handler,
    infoChanged = preferences_changed_handler
  },
  can_handle = function(opts, driver, device, ...)
    return device:get_manufacturer() == "SmartThings"
  end
}

return smartthings_motion