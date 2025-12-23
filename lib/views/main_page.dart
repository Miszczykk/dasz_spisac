import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';
import 'package:dasz_spisac/viewmodels/main_viewmodel.dart';

class MainPage extends StatelessWidget{
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(
    create: (_) => MainViewmodel(),
    child: const _MainPageContent(),
  );
  }
}

class _MainPageContent extends StatelessWidget{
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
                            prefixIcon: Icon(Icons.search)
                          )
                      )
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    icon: const Icon(CupertinoIcons.add, size: 50),
                    onPressed: (){},
                  )
                ],
              ),

              Expanded(
                  child: Consumer<MainViewmodel>(
                    builder: (context, vm, child){
                      if(vm.notes.isEmpty){
                        return const Center(
                          child: Text('Brak notatek pasujących do wyszukiwania.'),
                        );
                      }

                      return ListView.builder(
                        itemCount: vm.notes.length,
                        itemBuilder: (context, index){
                          final note = vm.notes[index];

                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: ListTile(
                              leading: const Icon(Icons.description),
                              title: Text(
                                note['title'],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Typ: ${note['extension_file']} | Data: ${note['date']}'),
                              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            ),
                          );
                        },
                      );
                    }
                  )
              )
            ],
          ),
        )
    );
  }
}