import 'package:material_ui/material_ui.dart';

void main() => runApp(const KartuNamaApp());

class KartuNamaApp extends StatelessWidget {
  const KartuNamaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartu Nama Digital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D32)),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          brightness: Brightness.dark,
        ),
      ),
      home: const HalamanProfil(),
    );
  }
}

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  // Tantangan 3: menampilkan SnackBar "Disalin" (tanpa benar-benar menyalin)
  void _tampilkanDisalin(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Disalin')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Kartu Nama Digital')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 56,
              backgroundColor: skema.primaryContainer,
              child: Text('DA', style: teks.headlineMedium),
            ),
            const SizedBox(height: 16),
            Text('Dea Anggraini', style: teks.headlineSmall),
            Text(
              'Mahasiswa Ilmu Komputer · UNIMED',
              style: teks.bodyMedium?.copyWith(color: skema.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            const Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('UI/UX')),
              ],
            ),
            const SizedBox(height: 16),
            // "const" dihapus dari Card karena onTap berisi fungsi
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text('deang@gmail.com'),
                    onTap: () => _tampilkanDisalin(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.phone_outlined),
                    title: const Text('+62 812-0000-0000'),
                    onTap: () => _tampilkanDisalin(context),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: const Text('Medan, Sumatera Utara'),
                    onTap: () => _tampilkanDisalin(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const TombolIkuti(),
          ],
        ),
      ),
    );
  }
}

class TombolIkuti extends StatefulWidget {
  const TombolIkuti({super.key});

  @override
  State<TombolIkuti> createState() => _TombolIkutiState();
}

class _TombolIkutiState extends State<TombolIkuti> {
  bool _diikuti = false;
  int _pengikut = 128;

  void _ubah() {
    setState(() {
      _diikuti = !_diikuti;
      _pengikut += _diikuti ? 1 : -1;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _diikuti ? 'Anda mengikuti Dea Anggraini' : 'Batal mengikuti',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$_pengikut pengikut'),
        const SizedBox(height: 8),
        _diikuti
            ? OutlinedButton.icon(
                onPressed: _ubah,
                icon: const Icon(Icons.check),
                label: const Text('Diikuti'),
              )
            : FilledButton.icon(
                onPressed: _ubah,
                icon: const Icon(Icons.person_add),
                label: const Text('Ikuti'),
              ),
      ],
    );
  }
}