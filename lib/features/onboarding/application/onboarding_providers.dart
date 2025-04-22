import 'package:amar_thikana/features/onboarding/data/onboarding_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Provides the OnboardingRepository instance
final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return OnboardingRepository();
});

// Optional: Provider to directly check the completion status (FutureProvider)
// This handles the async nature cleanly.
final isOnboardingCompleteProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(onboardingRepositoryProvider);
  return repository.isOnboardingComplete();
});