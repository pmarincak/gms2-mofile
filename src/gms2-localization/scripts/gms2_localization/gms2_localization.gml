#region Configuration
	#macro LOCALIZATION_INCLUDED_FILES_SUBDIRECTORY "TranslationFiles"
	#macro LOCALIZATION_USE_WORKING_DIRECTORY true
#endregion

///@description Sets up the linkage between GML and the localization DLL. Should be called once at GameStart.
function LocalizationGameStart(){
	global.__localization_translate = external_define("Mofile.dll","Translate",dll_cdecl,ty_string,1,ty_string);
	global.__localization_open = external_define("Mofile.dll","LoadLanguageFile",dll_cdecl,0,1,ty_string);
}

///@description Frees the localization DLL. Should be called once at GameEnd.
function LocalizationGameEnd(){
	external_free("MoFile.dll");
}

///@description Marks the provided value as a translatable string and returns the translation from the Mofiles.
///@param {String} value
function _(value) {
	return external_call(global.__localization_translate,value);
}

///@description Marks the provided value as a translatable string and returns the original value.
///@param {String} value
function _LocalizationMarkTranslation(value) {
	return value;
}

///@description Loads the localization file represented by the provided filename.
///@param {String} filename
function LocalizationLoadLanguageFile(filename) {
	var dir = LOCALIZATION_USE_WORKING_DIRECTORY ? working_directory : "";
	var path = LOCALIZATION_INCLUDED_FILES_SUBDIRECTORY == "" ? "" : LOCALIZATION_INCLUDED_FILES_SUBDIRECTORY + "/";
	path = dir + path + filename;

	if (!file_exists(path)){
		show_debug_message("[" + path + "] could not be found.\nCheck the filename and that GMS2_LOCALIZATION_INCLUDED_FILES_SUBDIRECTORY is configured correctly.");
		return;
	}

	return external_call(global.__localization_open,path);
}
