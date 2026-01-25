import 'package:dasz_spisac/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';
import 'package:dasz_spisac/viewmodels/main_viewmodel.dart';
import 'package:dasz_spisac/theme/widgets/note_card.dart';
import 'package:dasz_spisac/views/add_note_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainViewmodel(),
      child: const _MainPageContent(),
    );
  }
}

class _MainPageContent extends StatelessWidget {
  const _MainPageContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewmodel>(context, listen: false);

    return GradientScaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                      controller: viewModel.searchController,
                      style: Theme.of(context).textTheme.headlineSmall,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Szukaj notatek',
                          prefixIcon: Icon(Icons.search)))),
              const SizedBox(width: 5),
              IconButton(
                icon: const Icon(CupertinoIcons.add, size: 50),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddNotePage()),
                  );
                },
              )
            ],
          ),
          Expanded(child: Consumer<MainViewmodel>(builder: (context, vm, child) {
            if (vm.notes.isEmpty) {
              return const Center(
                child: Text('Brak notatek pasujących do wyszukiwania.'),
              );
            }

            return ListView.builder(
              itemCount: vm.notes.length,
              itemBuilder: (context, index) {
                final note = vm.notes[index];
                return NoteCard(
                  note: note,
                  onDownloadTap: () async {
                    final fileName = note['file_name'];
                    
                    if(fileName != null && fileName.toString().isNotEmpty){
                      final dbService = DatabaseService();
                      final url = dbService.getFileUrl('files', fileName);
                      
                      final uri = Uri.parse(url);
                      if(await canLaunchUrl(uri)){
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }else{
                        print("Nie udało się otworzyć linku: $url");
                      }
                    }else{
                      print("Brak nazwy pliku w bazie dla tej notatki");
                    }
                    
                    SnackBar(content: Text('Kliknięto ${note['title']}'));
                  },
                );
              },
            );
          }))
        ],
      ),
    ));
  }
}