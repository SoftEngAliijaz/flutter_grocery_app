class MyBreadcrumbItem {
  MyBreadcrumbItem({required this.name, this.route, this.active = false});

  final bool active;
  final String name;
  final String? route;
}
