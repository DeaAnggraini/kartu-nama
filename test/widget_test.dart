import 'package:flutter_test/flutter_test.dart';
import 'package:kartu_nama/main.dart';

void main() {
  testWidgets('Tombol Ikuti menambah jumlah pengikut', (tester) async {
    await tester.pumpWidget(const KartuNamaApp());

    expect(find.text('Dea Anggraini'), findsOneWidget);
    expect(find.text('128 pengikut'), findsOneWidget);

    await tester.ensureVisible(find.text('Ikuti'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ikuti'));
    await tester.pump();

    expect(find.text('129 pengikut'), findsOneWidget);
    expect(find.text('Diikuti'), findsOneWidget);
  });
}