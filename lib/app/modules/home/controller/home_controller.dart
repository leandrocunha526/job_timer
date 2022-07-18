import "dart:developer";
import 'package:bloc/bloc.dart';
import "package:equatable/equatable.dart";
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/services/projects/projects_service.dart';
import "package:job_timer/app/view_models/project_model.dart";

part "home_state.dart";

class HomeController extends Cubit<HomeState>{
  final ProjectsService _projectsService;

  HomeController({required ProjectsService projectsService})
    : _projectsService = projectsService,
    super(HomeState.initial());

  Future<void> loadProject() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final projects = await _projectsService.findByStatus(state.projectFilter);
      emit(state.copyWith(status: HomeStatus.complete, projects: projects));
    } catch(e, s){
      log("Erro ao buscar projetos", error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> filter(ProjectStatus status) async {
    emit(state.copyWith(status: HomeStatus.loading, projects: []));
    final projects = await _projectsService.findByStatus(status);
    emit(state.copyWith(
      status: HomeStatus.complete,
      projects: projects,
      projectFilter: status,
    )
   );
  }
}