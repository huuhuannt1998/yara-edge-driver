-- Load SmartThings modules
local capabilities = require "st.capabilities"
local Driver = require "st.driver"
local zigbee_handlers = require "st.zigbee".zigbee_handlers
local battery_utils = require "st.zigbee.defaults.battery_defaults"  
local minInterValue = capabilities["app.minReportingInterval"]
local maxInterValue = capabilities["app.maxReportingInterval"]


local minReportingIntervalCapability = capabilities["app.minReportingInterval"]

print("Min reporting interval: " .. require("st.utils").stringify(minReportingIntervalCapability))


-- Battery percentage table
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

-- Custom capability definitions
local detectionMaxCapability = capabilities["stse.detectionMax"]
local detectionMinCapability = capabilities["stse.detectionMin"]

local minReportingIntervalCapability = capabilities["app.minReportingInterval"]
local maxReportingIntervalCapability = capabilities["app.maxReportingInterval"]

-- Handlers for min/max reporting interval capabilities
local function handleMinReportingInterval(driver, device, command)
  local value = command.args.value  
  device:emit_event(minReportingIntervalCapability.minInterval(value))
end

local function handleMaxReportingInterval(driver, device, command)
  local value = command.args.value
  device:emit_event(maxReportingIntervalCapability.maxInterval(value)) 
end

-- Utility function to handle detection frequency change
local function handleDetectionFrequency(device, value, isMax)
  -- Implementation to set the detection frequency
  -- `isMax` indicates whether it's for max or min interval
  -- Update the device state and perform necessary actions
  local attribute = isMax and detectionMaxCapability.attributes.detectionFrequency or detectionMinCapability.attributes.detectionFrequency
  device:emit_event(attribute({ value = value, unit = isMax and "max" or "min" }))
end

-- Handlers for custom capabilities
local function handleDetectionMax(driver, device, command)
  local maxValue = command.args.value
  handleDetectionFrequency(device, maxValue, true)
end

local function handleDetectionMin(driver, device, command)
  local minValue = command.args.value
  handleDetectionFrequency(device, minValue, false)
end

-- Handler for when a device is added to the SmartThings ecosystem
function device_added(driver, device)
  device:emit_event(minReportingIntervalCapability.minInterval(30)) 
  device:emit_event(maxReportingIntervalCapability.maxInterval(3600))
end

-- Handler for when a device is removed from the SmartThings ecosystem
local function device_removed(driver, device)
  print("Device removed: " .. device.id)
end

-- Handler for when a device is initialized
function device_init(driver, device)
  device:emit_event(minReportingIntervalCapability.minInterval(30))
  device:emit_event(maxReportingIntervalCapability.maxInterval(3600)) 
end

-- Handler for configuring the device - typically used for Zigbee or Z-Wave devices
local function device_doconfigure(driver, device)
  print("Configuring device: " .. device.id)
  -- Example for a Zigbee device: device:configure()
end


function handleMinReportingInterval(driver, device, command)

  local current = device:get_field(minReportingIntervalCapability.minInterval)
  
  print("Previous min interval: " .. current)

  local value = command.args.value   
  device:emit_event(minReportingIntervalCapability.minInterval(value))

end

function handleMaxReportingInterval(driver, device, command)

  local current = device:get_field(maxReportingIntervalCapability.maxInterval)
  
  print("Previous max interval: " .. current)

  local value = command.args.value   
  device:emit_event(maxReportingIntervalCapability.maxInterval(value))

end

-- Driver Template
local driver_template = {
  supported_capabilities = {
    detectionMaxCapability,
    detectionMinCapability,
    -- ... other capabilities ...
  },
  zigbee_handlers = zigbee_handlers,
  lifecycle_handlers = {
    added = device_added,
    removed = device_removed,
    init = device_init,
    doConfigure = device_doconfigure,
  },
  capability_handlers = {
    [detectionMaxCapability.ID] = {
      [detectionMaxCapability.commands.setDetectionMax.NAME] = handleDetectionMax
    },
    [detectionMinCapability.ID] = {
      [detectionMinCapability.commands.setDetectionMin.NAME] = handleDetectionMin
    },
    [minReportingIntervalCapability.ID] = {
      [minReportingIntervalCapability.commands.setMinInterval.NAME] = handleMinReportingInterval  
    },
    [maxReportingIntervalCapability.ID] = {
      [maxReportingIntervalCapability.commands.setMaxInterval.NAME] = handleMaxReportingInterval
    } 
    -- ... handlers for other capabilities ...
  }
}

-- Driver initialization
local driver = Driver("my_driver", driver_template)
driver:run()

