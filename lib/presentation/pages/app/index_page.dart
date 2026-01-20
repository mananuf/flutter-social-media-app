import 'package:flutter/material.dart';
import 'package:view_social/presentation/widget_tree.dart';
import 'package:view_social/presentation/widgets/navbar_widget.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WidgetTree()),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}