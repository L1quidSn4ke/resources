fx_version 'bodacious'
lua54 "yes"
game 'gta5'

ui_page 'build/index.html'

client_script('client.lua')

files {
	'build/vue.js',
	'build/main.js',
	'build/index.html',
	'build/style.css',
    'build/sounds/*',
}

escrow_ignore {
	"client.lua"
}

dependency '/assetpacks'
dependency '/assetpacks'