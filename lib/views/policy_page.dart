import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dasz_spisac/theme/widgets/gradient_scaffold.dart';
import 'package:dasz_spisac/viewmodels/policy_viewmodel.dart';

class PolicyPage extends StatelessWidget{
  const PolicyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PolicyViewmodel(),
      child: const _PolicyPageContent(),
    );
  }
}

class _PolicyPageContent extends StatelessWidget{
  const _PolicyPageContent();

  static const String policyText = """
§1. Postanowienia Wstępne i Definicje
1. Przedmiot Regulaminu: Niniejszy Regulamin określa zasady funkcjonowania i korzystania z aplikacji mobilnej "Dasz notatki", prawa i obowiązki Użytkowników oraz Administratora, a także politykę prywatności i zasady ochrony danych osobowych.
2. Charakter Usługi: Aplikacja jest niekomercyjnym narzędziem pomocniczym, stworzonym przez studentów dla studentów, przeznaczonym wyłącznie dla społeczności akademickiej Politechniki Morskiej w Szczecinie. Celem Aplikacji jest ułatwienie procesów edukacyjnych poprzez wymianę materiałów dydaktycznych.
3. Akceptacja Warunków: Pobranie, instalacja oraz pierwsze zalogowanie do Aplikacji są równoznaczne z zapoznaniem się z treścią niniejszego Regulaminu i pełną akceptacją jego postanowień. Korzystanie z Aplikacji oznacza zawarcie umowy o świadczenie usług drogą elektroniczną na warunkach opisanych poniżej.
4. Kontakt: Oficjalnym kanałem kontaktowym z Administratorem w sprawach technicznych, zgłoszeń naruszeń oraz uwag do działania Aplikacji jest adres e-mail: 32196@s.pm.szczecin.pl oraz 32420@s.pm.szczecin.pl.

§2. Wymagania Techniczne i Procedura Weryfikacji
1. Ograniczenie Podmiotowe: Dostęp do Aplikacji jest ograniczony wyłącznie do osób posiadających status studenta Politechniki Morskiej w Szczecinie.
2. Weryfikacja Tożsamości:
2.1. Rejestracja i logowanie możliwe są wyłącznie przy użyciu aktywnego adresu poczty elektronicznej w domenie uczelnianej: @s.pm.szczecin.pl.
2.2. W celu weryfikacji autentyczności konta, system automatycznie generuje i wysyła na podany adres e-mail jednorazowy kod weryfikacyjny.
2.3. Użytkownik zobowiązany jest do przepisania otrzymanego kodu w odpowiednim polu Aplikacji. Jest to warunek konieczny do uzyskania dostępu do funkcjonalności systemu.
3. Standardy Plików:
3.1. W celu zapewnienia bezpieczeństwa i spójności danych, Aplikacja umożliwia przesyłanie wyłącznie plików o następujących rozszerzeniach: txt, docx, odt, xlsx, ods, pptx, odp.
3.2. Próba przesłania plików o innych rozszerzeniach zostanie automatycznie zablokowana przez system.
4. Transparentność Metadanych: Przy każdym udostępnionym pliku Aplikacja automatycznie publikuje informacje techniczne, w tym:
4.1. Rozmiar pliku.
4.2. Rozszerzenie pliku.
4.3. Numer albumu Użytkownika udostępniającego materiał. Użytkownik, akceptując Regulamin, wyraża zgodę na upublicznienie swojego numeru albumu w kontekście udostępnianych przez siebie materiałów, co służy budowaniu wiarygodności i odpowiedzialności w społeczności.

§3. Zasady Społeczności i Etykieta
1. Kultura Osobista: Użytkownicy zobowiązani są do przestrzegania zasad netykiety oraz wysokich standardów kultury osobistej. Wszelkie formy hejtu, mowy nienawiści, nękania, używania wulgaryzmów czy zachowań dyskryminujących są surowo zabronione i będą skutkować natychmiastowymi sankcjami.
2. Nazewnictwo Materiałów:
2.1. Użytkownik zobowiązany jest do nadawania udostępnianym plikom tytułów czytelnych, precyzyjnych i ułatwiających ich wyszukiwanie.
2.2. Zalecany format tytułu: "Przedmiot - Temat - Kierunek/Specjalność".
2.2.1. Przykład poprawnego tytułu: "Analiza matematyczna - Pochodne i całki - Informatyka".
2.3. Materiały o nazwach mylących, losowych lub nieadekwatnych do treści mogą być usuwane przez moderatorów.
3. Uczciwość Akademicka:
3.1. Aplikacja służy wyłącznie celom edukacyjnym i samokształceniowym.
3.2. Aplikacja w żadnym stopniu nie służy do oszukiwania na kolokwiach, egzaminach czy innych formach weryfikacji wiedzy.
3.3. Zabrania się udostępniania materiałów stanowiących gotowe rozwiązania zadań egzaminacyjnych w czasie trwania egzaminu, zdjęć arkuszy egzaminacyjnych wykonanych z ukrycia oraz wszelkich materiałów, których posiadanie lub rozpowszechnianie narusza Regulamin Studiów Politechniki Morskiej.

§4. Odpowiedzialność, Prawa Autorskie i Bezpieczeństwo
1. Status Administratora: Twórcy Aplikacji działają jako dostawca usług hostingu. Nie są inicjatorami przekazu, nie wybierają odbiorców przekazu oraz nie modyfikują treści przesyłanych przez Użytkowników (z wyłączeniem działań moderacyjnych wynikających ze zgłoszeń).
2. Wyłączenie Odpowiedzialności za Treść:
2.1. Twórcy Aplikacji NIE ponoszą odpowiedzialności za merytoryczną poprawność, aktualność, wartość naukową oraz kompletność udostępnianych notatek. Użytkownik korzysta z materiałów na własne ryzyko edukacyjne.
2.2. Administrator nie prowadzi uprzedniej weryfikacji wszystkich materiałów, lecz reaguje na zgłoszenia naruszeń.
3. Prawa Autorskie:
3.1. Użytkownik oświadcza, że posiada pełne prawa autorskie do udostępnianych materiałów lub posiada skuteczną prawnie zgodę twórcy.
3.2. Twórcy Aplikacji nie ponoszą odpowiedzialności za udostępnianie cudzych materiałów bez zgody autora. Wszelkie roszczenia osób trzecich z tytułu naruszenia praw autorskich kierowane będą bezpośrednio do Użytkownika, który dokonał bezprawnej publikacji.
3.3. Przypomina się, że materiały dydaktyczne udostępniane przez wykładowców są chronione prawem autorskim i ich dalsze rozpowszechnianie bez zgody może stanowić naruszenie prawa.
4. Bezpieczeństwo Cyfrowe i Wirusy:
4.1. Mimo stosowania ograniczeń co do formatów plików, Twórcy Aplikacji nie biorą odpowiedzialności, jeżeli pliki udostępniane przez Użytkowników zawierają złośliwe oprogramowanie.
4.2. Użytkownik zobowiązany jest do posiadania zaktualizowanego oprogramowania antywirusowego na urządzeniu końcowym. Pobieranie i otwieranie plików odbywa się na wyłączne ryzyko Użytkownika.
5. Dane Osobowe w Plikach:
5.1. Twórcy nie ponoszą odpowiedzialności za dane osobowe (imię, nazwisko, numer albumu, dane wrażliwe) pozostawione przez Użytkownika w treści udostępnianych plików lub w ich metadanych.
5.2. Zaleca się weryfikację i usunięcie wszelkich danych osobowych z treści plików przed ich wysłaniem do Aplikacji.

§5. Prywatność i Ochrona Danych
1. Administrator Danych: Administratorem danych osobowych Użytkowników są Twórcy Aplikacji.
2. Cel i Zakres Przetwarzania:
2.1. Adres e-mail: Przetwarzany w celu założenia konta, weryfikacji uprawnień oraz komunikacji technicznej.
2.2. Numer albumu: Przetwarzany w celu identyfikacji Użytkownika w systemie logowania oraz oznaczania autorstwa udostępnianych plików.

§6. Sankcje i Postanowienia Końcowe
1. System Sankcji: W przypadku naruszenia postanowień niniejszego Regulaminu, Administrator zastrzega sobie prawo do podjęcia następujących działań:
1.1. Trwałego usunięcia materiałów uznanych za nieodpowiednie, uszkodzone lub naruszające prawo.
1.2. Wysłania ostrzeżenia na adres e-mail Użytkownika.
1.3. Trwałej blokady konta w przypadku rażącego łamania regulaminu.
2. Zmiany Regulaminu: Administrator zastrzega sobie prawo do wprowadzania zmian w Regulaminie. O każdej zmianie Użytkownicy zostaną poinformowani stosownym komunikatem w Aplikacji.
3. Prawo Właściwe: W sprawach nieuregulowanych niniejszym Regulaminem zastosowanie mają przepisy prawa polskiego.
""";

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        body: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                      TextSpan(style: Theme.of(context).textTheme.displayLarge,
                          children: [const
                          TextSpan(text: "dasz\n"),
                            TextSpan(text: "notatki?", style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold))])
                  ),
                ),

                Expanded(child: 
                ListView(
                  children: [
                    Text.rich(
                      TextSpan(
                          children: [
                          TextSpan(text: '\nREGULAMIN ŚWIADCZENIA USŁUG W RAMACH APLIKACJI MOBILNEJ "DASZ NOTATKI"\n\n', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(text: policyText, style: Theme.of(context).textTheme.labelSmall)
                          ])
                    ),
                    Consumer<PolicyViewmodel>(
                      builder: (context, vm, child){
                        return ElevatedButton(onPressed: () => vm.onNextPressed(context), child: Text('Akceptuję'));
                      }
                    )
                  ],
                )
                )
              ],
            )
        )
    );
  }
}