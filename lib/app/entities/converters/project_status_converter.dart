import "package:isar/isar.dart";
import "package:job_timer/app/entities/project_status.dart";

class ProjectStatusConverter extends TypeConverter<ProjectStatus, int>{
  const ProjectStatusConverter();
  @override
  ProjectStatus fromIsar(int statusIndex){
    return ProjectStatus.values[statusIndex];
  }
  @override
  int toIsar(ProjectStatus object){
    return object.index;
  }
}