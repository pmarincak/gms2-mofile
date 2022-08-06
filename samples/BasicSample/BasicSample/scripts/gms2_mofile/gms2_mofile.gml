#region Configuration
	#macro MOFILE_INCLUDED_FILES_SUBDIRECTORY "TranslationFiles"
	#macro MOFILE_USE_WORKING_DIRECTORY true
#endregion

///@description Sets up the linkage between GML and the MoFile DLL. Should be called once at GameStart.
function MofileGameStart(){
	global.__mofile_translate = external_define("Mofile.dll","Translate",dll_cdecl,ty_string,1,ty_string);
	global.__mofile_open = external_define("Mofile.dll","LoadLanguageFile",dll_cdecl,0,1,ty_string);
}

///@description Frees the MoFile DLL. Should be called once at GameEnd.
function MofileGameEnd(){
	external_free("MoFile.dll");
}

///@description Marks the provided value as a translatable string and returns the translation from the loaded MoFile.
///				Feel free to rename this function to whatever shorthand makes the most sense. Be aware that you will need to update PoEdit grep configurations.
///@param {String} value
function _(value) {
	return external_call(global.__mofile_translate,value);
}

///@description Marks the provided value as a translatable string and returns the original value.
///				Feel free to rename this function to whatever shorthand makes the most sense. Be aware that you will need to update PoEdit grep configurations.
///@param {String} value
function _MofileMarkTranslation(value) {
	return value;
}

///@description Loads the localization file represented by the provided filename and returns whether it was successful or not.
///@param {String} filename
function MofileLoadLanguageFile(filename) {
	var dir = MOFILE_USE_WORKING_DIRECTORY ? working_directory : "";
	var path = MOFILE_INCLUDED_FILES_SUBDIRECTORY == "" ? "" : MOFILE_INCLUDED_FILES_SUBDIRECTORY + "/";
	path = dir + path + filename;

	if (!file_exists(path)){
		show_debug_message("[" + path + "] could not be found.\nCheck the filename and that MOFILE_INCLUDED_FILES_SUBDIRECTORY is configured correctly.");
		return false;
	}

	return external_call(global.__mofile_open,path);
}
