fx_version 'cerulean'
game 'gta5'

author 'HenkW'
description 'Simple blackmarket script for ESX'
version '1.0.2'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua',
    'server/version.lua'
}

client_scripts {
    'client/main.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua' 
}
