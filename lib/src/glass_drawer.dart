import 'package:flutter/material.dart';

import 'glass_container.dart';
import 'glass_text.dart';

class GlassDrawer extends StatelessWidget {
  const GlassDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: Drawer(
        child: GlassContainer(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.3),
                      foregroundColor: Colors.white.withOpacity(0.3),
                      radius: 30,
                      child: const Icon(
                        Icons.person,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const GlassText(
                      'Glass Drawer',
                    ),
                    const GlassText(
                      'example@example.com',
                      opacity: 0.25,
                    ),
                  ],
                ),
              ),
              ListView.separated(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: GlassText(
                      'Drawer Item ${index + 1}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    onTap: () {},
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 1.5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.white.withOpacity(0.1),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
