// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
// ignore: implementation_imports
import 'package:intl/src/intl_helpers.dart';

final _$en = $en();

class $en extends MessageLookupByLibrary {
  get localeName => 'en';
  
  final messages = {
		"appTitle" : MessageLookupByLibrary.simpleMessage("Clutter"),
		"settingTitle" : MessageLookupByLibrary.simpleMessage("Settings"),
		"aboutTitle" : MessageLookupByLibrary.simpleMessage("About"),
		"aboutGithubContent" : MessageLookupByLibrary.simpleMessage("Fork it on Github"),
		"aboutDescription" : MessageLookupByLibrary.simpleMessage("Clutter is built using Flutter SDK. It demonstrates various flutter examples."),

  };
}

final _$ne = $ne();

class $ne extends MessageLookupByLibrary {
  get localeName => 'ne';
  
  final messages = {
		"appTitle" : MessageLookupByLibrary.simpleMessage("अव्यवस्था"),
		"settingTitle" : MessageLookupByLibrary.simpleMessage("Settings"),
		"aboutTitle" : MessageLookupByLibrary.simpleMessage("बारे"),
		"aboutGithubContent" : MessageLookupByLibrary.simpleMessage("यसलाई Github मा फोर्क गर्नुहोस्"),
		"aboutDescription" : MessageLookupByLibrary.simpleMessage("Clutter Flutter SDK प्रयोग गरेर बनाइएको हो। यसले विभिन्न फ्लटर उदाहरणहरू देखाउँछ।"),

  };
}

final _$es = $es();

class $es extends MessageLookupByLibrary {
  get localeName => 'es';
  
  final messages = {
		"appTitle" : MessageLookupByLibrary.simpleMessage("Desorden"),
		"settingTitle" : MessageLookupByLibrary.simpleMessage("Settings"),
		"aboutTitle" : MessageLookupByLibrary.simpleMessage("Acerca de"),
		"aboutGithubContent" : MessageLookupByLibrary.simpleMessage("bifurcarlo en Github"),
		"aboutDescription" : MessageLookupByLibrary.simpleMessage("Clutter se crea con Flutter SDK. Demuestra varios ejemplos de aleteo."),

  };
}



typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
	"en": () => Future.value(null),
	"ne": () => Future.value(null),
	"es": () => Future.value(null),

};

MessageLookupByLibrary? _findExact(localeName) {
  switch (localeName) {
    case "en":
        return _$en;
    case "ne":
        return _$ne;
    case "es":
        return _$es;

    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
      localeName,
          (locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? Future.value(false) : lib());

  initializeInternalMessageLookup(() => CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);

  return Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(locale) {
  var actualLocale = Intl.verifiedLocale(locale, _messagesExistFor,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}

// ignore_for_file: unnecessary_brace_in_string_interps
