var spacing = 20;

// Untranslated
draw_text(0, 0, "Hello World! This is an untranslated string!");

// Translated Inline
draw_text(0, spacing, _("HELLO_WORLD_TRANSLATED"));

// Translation Marker
// Useful for marking common strings in one place and saving their value to load the translation later.
var marker = _MofileMarkTranslation("MARKER");
draw_text(0, spacing * 2, "This is a raw translation marker key: " + marker);

// Translate the marker
draw_text(0, spacing * 3, _(marker));