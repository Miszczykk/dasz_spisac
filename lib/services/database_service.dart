import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  Stream<List<Map<String, dynamic>>> getData(
    String requirements,
    String domain,
  ) {
    final stream = Supabase.instance.client
        .from(domain)
        .stream(primaryKey: ['id'])
        .order('date', ascending: false);

    return stream.map((data) {
      if (requirements.isEmpty) {
        return data;
      }

      final searchLower = requirements.toLowerCase();

      return data.where((item) {
        final title = (item['title'] ?? '').toString().toLowerCase();
        final ext = (item['extension_file'] ?? '').toString().toLowerCase();
        final idUser = (item['id_user'] ?? '').toString();
        return title.contains(searchLower) ||
            ext.contains(searchLower) ||
            idUser.contains(searchLower);
      }).toList();
    });
  }
}
