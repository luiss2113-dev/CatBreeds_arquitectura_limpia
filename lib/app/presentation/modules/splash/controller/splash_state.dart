import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool hasInternet;

  const SplashState({this.hasInternet = true});

  SplashState copyWith({
    bool? hasInternet,
  }) {
    return SplashState(
      hasInternet: hasInternet ?? this.hasInternet,
    );
  }

  @override
  List<Object?> get props => [hasInternet];
}
