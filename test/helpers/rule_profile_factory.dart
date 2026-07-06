import 'package:tarotscore_v2/features/rules/factories/official_rule_profiles.dart';
import 'package:tarotscore_v2/features/rules/models/rule_profile.dart';

class RuleProfileFactory {
  const RuleProfileFactory._();

  static RuleProfile fft() {
    return OfficialRuleProfiles.fft();
  }
}