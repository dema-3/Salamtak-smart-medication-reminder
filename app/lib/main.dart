import 'package:flutter/material.dart';

void main() => runApp(const SalamtakApp());

class SalamtakApp extends StatelessWidget {
  const SalamtakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salamtak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const <_NavItem>[
      _NavItem('Main Interface', Icons.medication, MainInterfaceScreen()),
      _NavItem('Easy Mode', Icons.accessibility_new, EasyModeScreen()),
      _NavItem('Bluetooth Connection', Icons.bluetooth, BluetoothScreen()),
      _NavItem('Caregiver Dashboard', Icons.people, CaregiverScreen()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Salamtak')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, i) => ListTile(
          leading: Icon(items[i].icon),
          title: Text(items[i].title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => items[i].screen),
          ),
        ),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemCount: items.length,
      ),
    );
  }
}

class _NavItem {
  final String title;
  final IconData icon;
  final Widget screen;
  const _NavItem(this.title, this.icon, this.screen);
}

class MainInterfaceScreen extends StatelessWidget {
  const MainInterfaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Interface')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today’s Medications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _MedCard(name: 'Paracetamol', time: '9:30 AM', dose: '1 pill'),
            _MedCard(name: 'Pregabalin', time: '3:00 PM', dose: '1 pill'),
            _MedCard(name: 'Echistanid', time: '10:30 AM', dose: '2 pills'),
            const Spacer(),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Medication'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MedCard extends StatelessWidget {
  final String name;
  final String time;
  final String dose;

  const _MedCard({
    required this.name,
    required this.time,
    required this.dose,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.notifications_active),
        title: Text(name),
        subtitle: Text('$dose • $time'),
        trailing: IconButton(
          icon: const Icon(Icons.check_circle_outline),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Marked as taken (demo).')),
            );
          },
        ),
      ),
    );
  }
}

class EasyModeScreen extends StatelessWidget {
  const EasyModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easy Mode')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Press the button to confirm you took your medication',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Confirmed (demo).')),
                    );
                  },
                  child: const Text('I took my medicine'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const _HintCard(
              icon: Icons.record_voice_over,
              text: 'Voice reminders can read the medication name and time.',
            ),
          ],
        ),
      ),
    );
  }
}

class BluetoothScreen extends StatelessWidget {
  const BluetoothScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bluetooth Connection')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _HintCard(
              icon: Icons.bluetooth_searching,
              text: 'Search for nearby devices and pair the smart button.',
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.circle, size: 14),
                title: const Text('Salamtak Button'),
                subtitle: const Text('Not connected'),
                trailing: FilledButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Paired (demo).')),
                    );
                  },
                  child: const Text('Pair'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Tip: In a real app, use a BLE plugin like flutter_blue_plus and listen for the button press.',
            ),
          ],
        ),
      ),
    );
  }
}

class CaregiverScreen extends StatelessWidget {
  const CaregiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Caregiver Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Patient: Ahmed Khaled',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const _StatusRow(time: '9:00 AM', status: 'Taken', ok: true),
            const _StatusRow(time: '1:00 PM', status: 'Missed', ok: false),
            const _StatusRow(time: '6:00 PM', status: 'Upcoming', ok: true),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit_calendar),
              label: const Text('Update Schedule'),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              label: const Text('Configure Alerts'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String time;
  final String status;
  final bool ok;
  const _StatusRow({required this.time, required this.status, required this.ok});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(ok ? Icons.check_circle : Icons.cancel),
        title: Text(time),
        subtitle: Text(status),
      ),
    );
  }
}

class _HintCard extends StatelessWidget {
  final IconData icon;
  final String text;
  const _HintCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
