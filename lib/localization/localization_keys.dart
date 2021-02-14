import 'package:flutter_translate_annotations/flutter_translate_annotations.dart';

part 'localization_keys.g.dart';

const String localizedAssetsPath = 'assets/i18n';

@TranslateKeysOptions(
  path: localizedAssetsPath,
  caseStyle: CaseStyle.titleCase,
  separator: "_",
)
class _$LocalizationKeys {}
