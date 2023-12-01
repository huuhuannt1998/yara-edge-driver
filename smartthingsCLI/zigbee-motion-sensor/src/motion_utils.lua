local capabilities = require "st.capabilities"

local motion_utils = {}



local function get_pref_changed_min(device)
  local key = device:get_field(PREF_CHANGED_KEY) or ''
  local value = device:get_field(PREF_CHANGED_VALUE) or 0
  return key, value
end

local function set_pref_changed_min(device, key, value)
  device:set_field(PREF_CHANGED_KEY, key)
  device:set_field(PREF_CHANGED_VALUE, value)
end

local function get_pref_changed_max(device)
    local key = device:get_field(PREF_CHANGED_KEY) or ''
    local value = device:get_field(PREF_CHANGED_VALUE) or 0
    return key, value
  end
  
  local function set_pref_changed_max(device, key, value)
    device:set_field(PREF_CHANGED_KEY, key)
    device:set_field(PREF_CHANGED_VALUE, value)
  end