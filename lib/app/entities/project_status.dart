enum ProjectStatus{
  inProgress(label: 'Em progresso'),
  finished(label: 'Finalizado');
  final String label;
  const ProjectStatus({required this.label});
}
