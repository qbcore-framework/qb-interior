fx_version 'cerulean'
game 'gta5'

description 'QB-Interior'
version '1.1.0'

this_is_a_map 'yes'

client_scripts {
	'client/main.lua',
	'client/optional.lua'
}

shared_scripts {
    'config.lua',
}

files {
	'starter_shells_k4mb1.ytyp'
}

-- Default (included)
data_file 'DLC_ITYP_REQUEST' 'starter_shells_k4mb1.ytyp'

lua54 'yes'
