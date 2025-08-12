helpers = {}

function helpers.table_to_string(t, indent, visited)
  visited = visited or {} -- Track visited tables to avoid circular references
  indent = indent or 0 -- Current indentation level
  local indent_str = string.rep("  ", indent)
  local result = {} -- Store parts of the string

  -- Handle non-table values
  if type(t) ~= "table" then
    return indent_str .. tostring(t)
  end

  -- Check for circular references
  if visited[t] then
    return indent_str .. "<circular reference>"
  end
  visited[t] = true

  -- Start building the table string
  table.insert(result, indent_str .. "{")

  local next_indent = indent + 1

  -- 1. Print array-like sequential elements (keys 1, 2, ..., n)
  for i = 1, #t do
    local value = t[i]
    local value_str
    if type(value) == "table" then
      value_str = table_to_string(value, next_indent, visited)
    else
      value_str = tostring(value)
    end
    table.insert(result, string.rep("  ", next_indent) .. value_str)
  end

  -- 2. Print non-sequential key-value pairs
  for key, value in pairs(t) do
    -- Skip keys already printed in the array section
    if type(key) ~= "number" or key < 1 or key > #t or math.floor(key) ~= key then
      local key_str
      -- Format the key appropriately
      if type(key) == "string" and string.match(key, "^[%a_][%w_]*$") then
        key_str = key .. " = "
      else
        key_str = "[" .. tostring(key) .. "] = "
      end

      -- Format the value
      local value_str
      if type(value) == "table" then
        value_str = table_to_string(value, next_indent, visited)
      else
        value_str = tostring(value)
      end

      table.insert(result, string.rep("  ", next_indent) .. key_str .. value_str)
    end
  end

  table.insert(result, indent_str .. "}")
  visited[t] = nil -- Clean up for other branches of recursion

  -- Combine all parts into a single string
  return table.concat(result, "\n")
end

return helpers
