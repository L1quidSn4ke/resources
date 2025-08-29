fx_version 'cerulean'
games { 'gta5' }
author 'The_Hs5'
description 'Simple manual transmission script for fivem servers!'
version '1.0.1'

shared_scripts {
    'config.lua'
}
client_scripts {
    'client/client.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js'
}

lua54 'yes'