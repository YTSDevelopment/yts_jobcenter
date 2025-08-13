fx_version 'cerulean'
game 'gta5'

author 'YTS Development'
description 'yts_jobcenter'
version '1.0.0'
lua54 'yes'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page 'index.html'

files {
    'index.html'
}

dependencies {
    'es_extended',
    'ox_target',
    'ox_lib'
}