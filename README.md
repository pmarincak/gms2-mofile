
# gms2-mofile
MoFile loader for Gamemaker Studio 2.3+

## Table of Contents

 1. [Requirements](#requirements)
 2. [Download](#download)
 3. [Maintainers & Contribution](#maintainers--contribution)
 4. [Samples](#samples)
 5. [Setup](#setup)
 6. [Configuration](#configuration)
 7. [Pulling Translation Strings From Code](#pulling-translation-strings-from-code)
 8. [API](#api)

## Requirements

|| Supported Version |
|--|--|
| Gamemaker Studio 2 | v2.3.0.x |

## Download

 1. Download the [exported local package](https://github.com/pmarincak/gms2-mofile/blob/main/export/com.package.gmlmofile.yymps)
 2. Select Tools > Import Local Package
 3. Navigate to the saved package and select import
 4. Import all resources

## Maintainers & Contribution
This package is maintained by [Paige Marincak](https://twitter.com/paigemarincak/). To contribute, please fork the repo and make pull requests.

## Samples
Samples can be viewed [here](https://github.com/pmarincak/gms2-mofile/tree/main/samples).

## Setup
### PoEdit Files
1. Create a folder in your datafiles called **TranslationFiles**. 
2. Copy the [sample.po and sample.mo](https://github.com/pmarincak/gms2-mofile/tree/main/samples/BasicSample/BasicSample/datafiles/TranslationFiles) files from the sample to the new folder.

### GML
1. Add **MofileGameStart()** to the GameStart of an object that is created at the start of the game.
2. Add  **MofileGameEnd()** to the GameEnd of an object that is destroyed at the end of the game.
3. Load your mofile at any point after MofileGameStart using **MofileLoadLanguageFile("sample.mo")**

## Configuration

### GML
|Variable Name| Default Value | Description |
|--|--|--|
| MOFILE_INCLUDED_FILES_SUBDIRECTORY | "TranslationFiles" | Path to datafiles subdirectory where the mofiles are stored at runtime.
| MOFILE_USE_WORKING_DIRECTORY| true | Whether to preface MOFILE_INCLUDED_FILES_SUBDIRECTORY  with the [working_directory](https://manual.yoyogames.com/GameMaker_Language/GML_Reference/File_Handling/File_Directories/working_directory.htm) or not.

### Translation Functions
If you would like to rename **_** or **_MofileMarkTranslation**:

 1. Rename the functions as preferred in the code. Example: **TL** and **TL_Marker**.
 2. Open your Po File. (i.e. sample.po) Recommend using [PoEdit](https://poedit.net/).
 3. Translation > Properties > Sources keywords
 4. Change "_" to "TL" and "_MofileMarkTranslation" to "TL_Marker"
 5. Press Ok.

## Pulling Translation Strings From Code

 1. Open your Po File. (i.e. sample.po) Recommend using [PoEdit](https://poedit.net/) or [Online PO editor](https://pofile.net/free-po-editor).
 2. Press **Update From Code**
 3. New strings added and removed will be visible
 4. Save to generate a new MoFile.

## API
### MofileGameStart
Sets up the linkage between GML and the MoFile DLL. Should be called once at GameStart.

### MofileGameEnd
Frees the MoFile DLL. Should be called once at GameEnd.

### _
Marks the provided value as a translatable string and returns the translation from the loaded MoFile. Feel free to rename this function to whatever shorthand makes the most sense. Be aware that you will need to update PoEdit grep configurations.

    @param {String} value

### _MofileMarkTranslation
Marks the provided value as a translatable string and returns the original value. Feel free to rename this function to whatever shorthand makes the most sense. Be aware that you will need to update PoEdit grep configurations.

    @param {String} value

### MofileLoadLanguageFile
Loads the localization file represented by the provided filename and returns whether it was successful or not.

    @param {String} filename
