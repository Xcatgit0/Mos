local config = {}
function readFileToTable(filename)
    local file = io.open(filename, "r")
    if not file then
        print("cant open file: " .. filename)
        return nil
    end
    
    local content = file:read("*a")
    file:close()
    
    local data = load("return " .. content)
    if data then
        return data()
    else
        print("cant change format content")
        return nil
    end
end

function config.readConfig(path)
    local contents = readFileToTable(path)
    if not contents then
        return nil
    end

    local result = {}
    local keys = {}
    local values = {}

    for key, value in pairs(contents) do
        table.insert(keys, key)
        table.insert(values, value)
    end

    result.keys = keys
    result.values = values

    function result.get(key)
        for i = 1, #result.keys do
            if result.keys[i] == key then
                return result.values[i]
            end
        end
        return nil
    end
    function result.exists(key)
      
      for i = 1, #result.keys do
            if result.keys[i] == key then
                return true
            end
      end
      return false
    
    end
    function result.set(key, value)
        for i = 1, #result.keys do
            if result.keys[i] == key then
                result.values[i] == value
            end
        end

    end
    return result
end