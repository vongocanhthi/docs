import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/apps_data.dart';
import '../models/app_info.dart';

/// Trang chủ: danh sách app với link Điều khoản sử dụng và Chính sách bảo mật.
class AppListPage extends StatelessWidget {
  const AppListPage({super.key});

  Future<void> _openUrl(String url) async {
    // Relative URL (e.g. terms.html) → resolve against current origin (GitHub Pages)
    final uri = url.startsWith('http') ? Uri.parse(url) : Uri.base.resolve(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
        webOnlyWindowName: '_blank',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Điều khoản & Chính sách'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: appsData.length,
        itemBuilder: (context, index) {
          final app = appsData[index];
          return _AppCard(app: app, onOpenUrl: _openUrl);
        },
      ),
    );
  }
}

class _AppCard extends StatelessWidget {
  const _AppCard({required this.app, required this.onOpenUrl});

  final AppInfo app;
  final Future<void> Function(String url) onOpenUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              app.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _LinkChip(
                  label: 'Điều khoản sử dụng',
                  icon: Icons.description_outlined,
                  onTap: () => onOpenUrl(app.termsUrl),
                ),
                const SizedBox(width: 8),
                _LinkChip(
                  label: 'Chính sách bảo mật',
                  icon: Icons.privacy_tip_outlined,
                  onTap: () => onOpenUrl(app.privacyUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkChip extends StatelessWidget {
  const _LinkChip({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
      label: Text(label),
      onPressed: onTap,
    );
  }
}
