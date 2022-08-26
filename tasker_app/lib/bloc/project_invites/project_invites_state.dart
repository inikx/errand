part of 'project_invites_cubit.dart';

@immutable
abstract class ProjectInvitesState {
  var projects;
}

class ProjectInvitesInitial extends ProjectInvitesState {}

class ProjectInvitesLoaded extends ProjectInvitesState {
  final List<Project> projects;

  ProjectInvitesLoaded(this.projects);
}

class ProjectInvitesUpdated extends ProjectInvitesState {}

class ProjectInvitesLoadingError extends ProjectInvitesState {}
