<p><img src="img/logo.png" alt="practice-duck logo" width="72" height="72"></p>

# practice-duck

<p><picture><source media="(prefers-color-scheme: dark)" srcset="img/header-dark.png"><img src="img/header.png" alt="A man with headphones stands in an old bathtub and sings from a sheet of music, a rubber duck floats beside him" width="100%"></picture></p>

English | [Deutsch](README.de.md)

## One score. Practice material for every part.

This is primarily a code experiment.

practice-duck is a plugin for Claude. Given the score of a **choir or an instrument ensemble** (PDF, scan, photo, MusicXML or export from notation software), it produces one ZIP with **scores and MP3 recordings for every part**: in three stages (solo, with accompaniment, together with the other parts) and in two sounds (choir or ensemble, and piano). The AI agent transcribes the score, proofreads it twice and checks the audio technically.

This repository holds the **releases** only. The source code and the website are private.

### What comes out

One ZIP with
- practice audio (MP3) and MIDI per part: solo, with accompaniment, in the choir or ensemble, plus tutti; in choir or ensemble sound and in piano sound; normal and slowed down
- tags in every MP3 and one album cover per piece, the same for all parts
- one ready-made ZIP per part, a guide for the director of the choir or ensemble, a check log and a correction log
- a start page (`Start.html`) that works with a double click, no server needed

### Download and install

1. Download `practice-duck.plugin` from the [latest release](https://github.com/vbth/practice-duck-plugin/releases/latest).
2. Upload the file in Claude (plugin settings).
3. Start the skill `new` and attach the score (PDF, photo, scan, MusicXML or export). If you are unsure about anything, ask the skill `help`.
4. Answer the questions: rights first, then title, melody part, seating, tempo and layouts.
5. Download the finished ZIP, unzip it and open `Start.html`.

Each release also carries the example packages (ZIP) for the German and the English example piece, "Alle meine Entchen" and "All My Ducklings".

### Requirements

Python with the packages the plugin lists, FluidSynth, ffmpeg, poppler and a soundfont (MuseScore General, or GeneralUser GS 2.0.3 beta by S. Christian Collins under its own licence). At the start the skill `setup` checks the installation and asks before it installs anything.

### Rights

Before it processes a score, the plugin asks whether the score is public domain, licensed, the user's own work or unclear, and notes the answer in the README of the package. It gives no legal advice, does not check the answer and grants no rights. Whether a score may be processed and passed on depends on its copyright and licence, and the responsibility lies with the user. The licence of the plugin says nothing about the rights to the score.

### Limits

- The AI agent does not hear the audio; it is tested technically (duration against the MIDI, gaps, clipping, loudness, stereo).
- Accidentals, rhythm and signs are read from image crops and proofread twice, not measured. Spot-check real pieces.
- DIN A4 only.

### AI marking

Everything the plugin creates is marked as created with AI assistance: the EU label "AI" and the note "Created with AI assistance." in the footer of every PDF and in the metadata of MP3, MIDI, MusicXML and PDF. The music itself does not come from the AI: the notes follow the source, the sound is software synthesis. Compare the notes and the music with the source before use.

### Licence

PolyForm Noncommercial License 1.0.0, full text in [`LICENSE.md`](LICENSE.md). Third-party components and their licences: [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).

<picture><source media="(prefers-color-scheme: dark)" srcset="img/ai-basic-dark.svg"><img src="img/ai-basic.svg" alt="AI" height="18" align="absmiddle"></picture> 2026 Created with AI assistance.
