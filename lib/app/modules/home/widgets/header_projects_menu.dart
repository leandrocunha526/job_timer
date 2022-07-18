import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  final HomeController controller;
  HeaderProjectsMenu({
    required this.controller,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Container(
          height: constraints.maxHeight,
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: constraints.maxWidth * .4,
                child: DropdownButtonFormField<ProjectStatus>(
                  value: ProjectStatus.inProgress,
                  items: ProjectStatus.values
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.label)))
                      .toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    isCollapsed: true,
                  ),
                  onChanged: (status) {
                    if (status != null) {
                      controller.filter(status);
                    }
                  },
                ),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  await Modular.to.pushNamed('/project/register/');
                  controller.loadProject();
                },
                icon: const Icon(Icons.add),
                label: const Text('Novo projeto'),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
