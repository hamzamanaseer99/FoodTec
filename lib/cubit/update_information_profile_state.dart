import 'package:equatable/equatable.dart';

/// Parent class for Update Profile States
abstract class UpdateInformationProfileState extends Equatable {
  const UpdateInformationProfileState();

  @override
  List<Object> get props => [];
}

/// Initial state before any action
class UpdateInformationProfileInitial extends UpdateInformationProfileState {
  const UpdateInformationProfileInitial();
}

/// Loading state when update in progress
class UpdateInformationProfileLoading extends UpdateInformationProfileState {
  const UpdateInformationProfileLoading();
}

/// Success state when update finished successfully
class UpdateInformationProfileSuccess extends UpdateInformationProfileState {
  const UpdateInformationProfileSuccess();
}

/// Failure state when update failed
class UpdateInformationProfileFailure extends UpdateInformationProfileState {
  final String errorMessage;

  const UpdateInformationProfileFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
