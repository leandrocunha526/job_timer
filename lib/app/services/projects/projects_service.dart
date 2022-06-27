import 'package:job_timer/app/entities/project_status.dart';

import '../../view_models/project_model.dart';

abstract class ProjectsService {
  Future<void> register(ProjectModel projectModel);
  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
}
