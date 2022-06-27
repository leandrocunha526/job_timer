enum ProjectStatus{
  in_progress(label: 'In progress'),
  finished(label: 'label');
  final String label;
  const ProjectStatus({required this.label});
}
