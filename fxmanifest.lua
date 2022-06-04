fx_version 'cerulean'
games { 'rdr3', 'gta5' }

ui_page 'nui/build/index.html'

client_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"client.lua"
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
	"nui/build/*",
	"nui/build/**/*"
}