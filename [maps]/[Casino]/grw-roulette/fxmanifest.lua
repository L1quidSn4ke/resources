fx_version 'cerulean'
game 'gta5'
author 'FiveM Store'
description 'Roulette Casino game for QBCore Framework'
version '1.1.0'

client_scripts {	
	'client.lua',
}

ui_page 'index.html'
files {
	'index.html',
	'audio/*.wav'
} 

server_scripts {	
	'server.lua',
	'audio/*.wav'
}
