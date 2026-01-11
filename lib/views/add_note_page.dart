import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';
import 'package:dasz_spisac/viewmodels/add_note_viewmodel.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddNoteViewModel(),
      child: const _AddNotePageContent(),
    );
  }
}

class _AddNotePageContent extends StatelessWidget {
  const _AddNotePageContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddNoteViewModel>(context);

    return GradientScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Dodaj notatkę',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextField(
                controller: viewModel.titleController,
                decoration: const InputDecoration(
                  labelText: 'Tytuł notatki',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: viewModel.extensionController,
                decoration: const InputDecoration(
                  labelText: 'Rozszerzenie (np. PDF, DOCX)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.insert_drive_file),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: viewModel.isLoading
                    ? null
                    : () async {
                        final success = await viewModel.addNote();
                        if (context.mounted) {
                          if (success) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Dodano notatkę!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Wystąpił błąd lub puste pola')),
                            );
                          }
                        }
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: viewModel.isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        'DODAJ',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}