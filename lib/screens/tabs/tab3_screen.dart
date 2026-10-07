import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatefulWidget {
  const Tab3Screen({super.key});

  @override
  State<Tab3Screen> createState() => _Tab3ScreenState();
}

class _Tab3ScreenState extends State<Tab3Screen> {
  int _score = 130;
  bool _liveTracking = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArenaSport • Stats', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_rounded, color: AppTheme.primary),
            tooltip: 'Special Registration Offer',
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.35)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stats Hub',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
                      ),
                      Icon(Icons.query_stats, color: AppTheme.primary, size: 28),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$_score',
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: AppTheme.primary),
                  ),
                  Text('Active Match Index', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => setState(() => _score += 10),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Stat'),
                        style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: () => setState(() => _liveTracking = !_liveTracking),
                        icon: Icon(_liveTracking ? Icons.pause : Icons.play_arrow),
                        label: Text(_liveTracking ? 'Live Feed' : 'Paused'),
                        style: OutlinedButton.styleFrom(foregroundColor: AppTheme.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: AppTheme.surface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.primary.withValues(alpha: 0.2),
                  child: const Icon(Icons.emoji_events, color: AppTheme.primary),
                ),
                title: const Text('Exclusive Partner Registration', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: const Text('Access exclusive live tournament matches and VIP promotions', style: TextStyle(fontSize: 12)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.primary),
                onTap: () => RoutingService.openRegistrationUrl(),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Match Schedule & Analytics', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  for (int i = 1; i <= 3; i++) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('League Match #$i', style: const TextStyle(color: AppTheme.textSecondary)),
                        Text('${2 + i} : ${i - 1} FT', style: const TextStyle(color: AppTheme.accent, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    if (i < 3) const Divider(height: 16, color: Colors.white12),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
