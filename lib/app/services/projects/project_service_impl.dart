import 'package:job_timer/app/repositories/projects/project_repository.dart';
import 'package:job_timer/app/services/projects/projects_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';

import '../../entities/project.dart';
import '../../entities/project_status.dart';

class ProjectServiceImpl implements ProjectsService {
  final ProjectRepository _projectRepository;
  ProjectServiceImpl({
    required ProjectRepository projectRepository,
}) : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
        ..id = projectModel.id
        ..name = projectModel.name
        ..status = projectModel.status
        ..estimate = projectModel.estimate;
    await _projectRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectRepository.findByStatus(status);
    return projects.map(ProjectModel.fromEntity).toList();
  }
}
