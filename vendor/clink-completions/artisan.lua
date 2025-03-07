local function generate_artisan_commands()
    local handle = io.popen('php artisan list --format=json 2>nul')
    local result = handle:read('*a')
    handle:close()
    
    if not result or result == "" then
        return {}
    end

    local cmder_root = os.getenv('CMDER_ROOT') or 'C:\\cmder'
    local json = loadfile(cmder_root..'\\vendor\\json.lua')()
    
    local ok, data = pcall(json.decode, result)
    if not ok then
        return {}
    end

    local commands = {}

    local function extract_commands(cmds)
        for _, cmd in ipairs(cmds) do
            if cmd.commands then
                extract_commands(cmd.commands)
            else
                table.insert(commands, cmd.name)
            end
        end
    end

    extract_commands(data.commands)
    
    return commands
end

local function artisan_complete()
    local line = rl_state.line_buffer
    if line:match('^artisan%s+.*') or line:match('php%s+artisan%s+.*') then
        local handle = io.popen('php artisan list --raw 2>nul')
        for cmd in handle:lines() do
            local name = cmd:match("^%S+")
            if name then
                clink.add_match(name)
            end
        end
        handle:close()
    end
end

clink.register_match_generator(artisan_complete, 1)