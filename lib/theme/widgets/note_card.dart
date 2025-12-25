import 'package:dasz_spisac/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Map<String, dynamic> note;
  final VoidCallback? onDownloadTap;

  const NoteCard({super.key, required this.note, this.onDownloadTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.bgFrame,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.bgExtension,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    note['extension_file'],
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textExtension,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      note['title'],
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.person_alt, size: 20),
                            Text(
                              note['id_user'].toString(),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textExtension),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.tray_arrow_down_fill, size: 20),
                            Text(
                              _formatFileSize(note['size_file'].toString()),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textExtension),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.calendar, size: 20),
                            Text(
                              _formatDate(note['date'].toString()),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textExtension),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: onDownloadTap,
                      child: Text(
                        'POBIERZ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(190, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatFileSize(dynamic rawSize) {
    double sizeInBytes = (double.tryParse(rawSize.toString()) ?? 0) / 8;

    if (sizeInBytes < 1024) {
      return '${sizeInBytes.toStringAsFixed(0)} B';
    } else if (sizeInBytes < 1024 * 1024) {
      double kb = sizeInBytes / 1024;
      return '${kb.toStringAsFixed(1)} KB';
    } else {
      double mb = sizeInBytes / (1024 * 1024);
      return '${mb.toStringAsFixed(2)} MB';
    }
  }

  String _formatDate(String dateString) {
    final DateTime date = DateTime.parse(dateString);
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }
}
