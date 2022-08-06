#include "stdafx.h"
#include "Mofile.h"
#include "moFileReader.h"
using namespace moFileLib;

MOFILE_API int nMofile=0;

MOFILE_API int fnMofile(void)
{
	return 42;
}

CMofile::CMofile()
{
	return;
}

#define export extern "C" __declspec(dllexport)

std::string translatedString;

export const char* Translate(const char* id){
	translatedString = _(id);
	return translatedString.c_str();
}

export double LoadLanguageFile(const char* file){
	moFileReader::eErrorCode error = moFileLib::moFileReader::EC_SUCCESS;
	moFileReaderSingleton::GetInstance().ClearTable();
	error = moFileReaderSingleton::GetInstance().ReadFile(file);
	return error;
}

export double GetTotalNumberOfTranslations() {
	return ((double) moFileGetNumStrings()) - 1.0;
}

export const char* GetTranslationForNumber(const double num) {
	translatedString = moFileReaderSingleton::GetInstance().LookupByNum((int) num);
	return translatedString.c_str();
}

export const char* GetKeyForNumber(const double num) {
	translatedString = moFileReaderSingleton::GetInstance().LookupKeyByNum((int)num);
	return translatedString.c_str();
}