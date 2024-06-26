fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'HenkW'
description 'Advanced blackmarket script with ox_lib'
version '1.1.3'

server_scripts {
    'server/main.lua',
    'server/version.lua',
}

client_scripts {
    'client/main.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config.lua',
    '@es_extended/imports.lua',
}

dependencies {
    'es_extended',
    'ox_lib',
    'ox_inventory',
    'hw_utils'
}

file 'locales/*.json'

escrow_ignore {
    'config.lua',
    'fxmanifest.lua',
    'README.MD'
}