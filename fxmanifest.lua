

shared_script '@genstore/ai_module_fg-obfuscated.lua'
shared_script '@genstore/shared_fg-obfuscated.lua'


shared_script '@gen_clientloader/resource/shared.lua'


fx_version 'cerulean'
game 'gta5'
ui_page {'html/index.html'}
lua54 "yes"
gen_clientloader {
    'config.lua',
    'client/cats.lua',
    'client/chairs.lua',
    'client/client.lua',
    'client/uwumenu.lua',
}
server_scripts {
    'config.lua',
    'server/server.lua'
}
exports {
    'GetActiveRegister',
}
