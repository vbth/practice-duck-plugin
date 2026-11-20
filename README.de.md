<p><img src="img/logo.png" alt="practice-duck logo" width="72" height="72"></p>

# practice-duck

<p><picture><source media="(prefers-color-scheme: dark)" srcset="img/header-dark.png"><img src="img/header.png" alt="Ein Mann mit Kopfhörern steht in einer alten Badewanne und singt vom Notenblatt, neben ihm schwimmt eine Quietscheente" width="100%"></picture></p>

[English](README.md) | Deutsch

## Eine Partitur. Übematerial für jede Stimme.

Das ist vor allem ein Code-Experiment.

practice-duck ist ein Plugin für Claude. Aus der Partitur eines **Chors oder Instrumentalensembles** (PDF, Scan, Foto, MusicXML oder Export aus einem Notensatzprogramm) entsteht ein ZIP mit **Noten und MP3-Aufnahmen für jede Stimme**: in drei Stufen (allein, mit Begleitung, zusammen mit den anderen Stimmen) und in zwei Klängen (Chor oder Ensemble, und Klavier). Die KI transkribiert die Partitur, liest sie zweimal Korrektur und prüft das Audio technisch.

Dieses Repository enthält nur die **Releases**. Quellcode und Website sind privat.

### Was dabei herauskommt

Ein ZIP mit
- Übe-Audio (MP3) und MIDI je Stimme: allein, mit Begleitung, im Chor oder Ensemble, dazu Tutti; im Chor- oder Ensembleklang und im Klavierklang; normal und verlangsamt
- Tags in jeder MP3 und ein Albumcover je Stück, für alle Stimmen gleich
- je ein fertiges ZIP pro Stimme, eine Anleitung für die Chor- oder Ensembleleitung, ein Prüfprotokoll und ein Korrekturprotokoll
- einer Startseite (`Start.html`), die per Doppelklick funktioniert, ohne Server

### Herunterladen und installieren

1. Lade `practice-duck.plugin` aus dem [aktuellen Release](https://github.com/vbth/practice-duck-plugin/releases/latest) herunter.
2. Lade die Datei in Claude hoch (Plugin-Einstellungen).
3. Starte den Skill `new` und hänge die Partitur an (PDF, Foto, Scan, MusicXML oder Export). Bei Fragen hilft der Skill `help`.
4. Beantworte die Fragen: zuerst die Rechte, dann Titel, Melodiestimme, Sitzordnung, Tempo und Layouts.
5. Lade das fertige ZIP herunter, entpacke es und öffne `Start.html`.

Jedes Release enthält auch die Beispielpakete (ZIP) für das deutsche und das englische Beispielstück, „Alle meine Entchen“ und „All My Ducklings“.

### Voraussetzungen

Python mit den Paketen, die das Plugin auflistet, FluidSynth, ffmpeg, Poppler und eine Soundfont (MuseScore General oder GeneralUser GS 2.0.3 beta von S. Christian Collins unter eigener Lizenz). Zu Beginn prüft der Skill `setup` die Installation und fragt, bevor er etwas installiert.

### Rechte

Bevor das Plugin eine Partitur verarbeitet, fragt es, ob sie gemeinfrei, lizenziert, dein eigenes Werk oder unklar ist, und hält die Antwort in der README des Pakets fest. Es gibt keine Rechtsberatung, prüft die Antwort nicht und räumt keine Rechte ein. Ob eine Partitur verarbeitet und weitergegeben werden darf, hängt von ihrem Urheberrecht und ihrer Lizenz ab; die Verantwortung liegt bei dir. Die Lizenz des Plugins sagt nichts über die Rechte an der Partitur.

### Grenzen

- Die KI hört das Audio nicht; es wird technisch geprüft (Dauer gegen das MIDI, Lücken, Übersteuerung, Lautheit, Stereo).
- Vorzeichen, Rhythmus und Zeichen werden aus Bildausschnitten gelesen und zweimal Korrektur gelesen, nicht gemessen. Prüfe echte Stücke stichprobenartig.
- Nur DIN A4.

### KI-Kennzeichnung

Alles, was das Plugin erzeugt, ist als mit KI-Unterstützung erstellt gekennzeichnet: das EU-Label „AI“ und der Hinweis „Created with AI assistance.“ in der Fußzeile jedes PDFs und in den Metadaten von MP3, MIDI, MusicXML und PDF. Die Musik selbst stammt nicht von der KI: Die Noten folgen der Vorlage, der Klang ist Software-Synthese. Vergleiche Noten und Musik vor der Verwendung mit der Vorlage.

### Lizenz

PolyForm Noncommercial License 1.0.0, Volltext in [`LICENSE.md`](LICENSE.md). Komponenten Dritter und ihre Lizenzen: [`THIRD_PARTY_NOTICES.de.md`](THIRD_PARTY_NOTICES.de.md).

<picture><source media="(prefers-color-scheme: dark)" srcset="img/ai-basic-dark.svg"><img src="img/ai-basic.svg" alt="AI" height="18" align="absmiddle"></picture> 2026 mit KI-Unterstützung erstellt.
