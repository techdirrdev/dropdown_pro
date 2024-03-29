import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dropdown_pro/dropdown_pro.dart';

void main() {
  const MethodChannel channel = MethodChannel('dropdown_pro');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DropdownPro.platformVersion, '42');
  });
}
