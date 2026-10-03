<!-- markdownlint-disable MD033 MD041 -->
<div align="center">
  <a href="https://lostsirius.github.io/tongji-course-report-latex/">
    <img src="figures/tongji-latex-readme-banner.png" width="900" alt="Project banner combining a bridge, an open book, and the LaTeX wordmark">
  </a>
  <h1>General Tongji University Course Report LaTeX Template</h1>
  <p>A modern, configurable, unofficial report template for every Tongji University discipline</p>
  <p>
    <a href="https://github.com/LostSirius/tongji-course-report-latex/releases/tag/v2.1.0"><img src="https://img.shields.io/badge/version-2.1.0-0b5cad" alt="Version 2.1.0"></a>
    <a href="https://github.com/LostSirius/tongji-course-report-latex/actions/workflows/test.yaml"><img src="https://github.com/LostSirius/tongji-course-report-latex/actions/workflows/test.yaml/badge.svg" alt="Build status"></a>
    <a href="https://github.com/LostSirius/tongji-course-report-latex/actions/workflows/jekyll-gh-pages.yml"><img src="https://github.com/LostSirius/tongji-course-report-latex/actions/workflows/jekyll-gh-pages.yml/badge.svg" alt="Pages status"></a>
    <a href="LICENSE"><img src="https://img.shields.io/badge/license-LPPL--1.3c-1468a0" alt="LPPL 1.3c"></a>
    <img src="https://img.shields.io/badge/engine-XeLaTeX%20%7C%20LuaLaTeX-008bce" alt="XeLaTeX and LuaLaTeX">
    <img src="https://img.shields.io/badge/maintainer-LostSirius-00a6c8" alt="Maintainer LostSirius">
  </p>
  <p><a href="README.md">中文</a> | <strong>English</strong></p>
  <p><a href="https://lostsirius.github.io/tongji-course-report-latex/">Project site</a> · <a href="https://github.com/LostSirius/tongji-course-report-latex/releases">Releases</a></p>
</div>

Suitable for course papers, major assignments, laboratory reports, design projects, surveys, reading reports, internships, and fieldwork. The school, department, major, report type, and document structure are configurable. The example contains no real student name, ID, or other personal data.

> [!IMPORTANT]
> This is not an official Tongji University template and does not define mandatory formatting for any school. Always follow the latest requirements from your instructor and school.

## Features

- Generic Tongji-style cover, headers, and footers without a binding gutter.
- Centralized metadata through `\tongjisetup{...}`.
- Optional department, semester, and class fields that disappear when empty.
- A discipline-neutral outline suitable for STEM, medicine, humanities, social sciences, business, law, architecture, design, and arts.
- Equations, theorems, tables, figures, algorithms, source code, appendices, and cross-references.
- Replaceable examples of booktabs tables, grouped headers, a flowchart, subfigures, an algorithm, and code.
- Dependency-free `listings` by default, with optional `minted`.
- XeLaTeX and LuaLaTeX support with the TeX Live Fandol font set by default.
- Optional `biblatex + biber` and `BibTeX + gbt7714` workflows.

## Ways to Use

- **Overleaf:** download the repository as a ZIP, upload it as a new project, set `main.tex` as the main document, and select XeLaTeX or LuaLaTeX.
- **Local:** install TeX Live 2025+ or a corresponding MacTeX/MiKTeX release, then open the complete project root.
- **GitHub Actions:** push the project to GitHub to run the included three-platform, two-engine build matrix and download the generated PDF Artifact.

## Quick Start

Edit `sections/frontcover.tex`:

```tex
\tongjisetup{
  report-type = {Tongji University Course Report},
  title       = {Report Title},
  subtitle    = {},
  school      = {School or College},
  department  = {},
  major       = {Major},
  course      = {Course Name},
  semester    = {Fall 2026},
  class       = {},
  student-id  = {Student ID},
  author      = {Name},
  instructor  = {Instructor},
  date        = {\today},
}
```

Then:

1. Write the abstract and keywords in `sections/00_abstract.tex`.
2. Fill `sections/01_intro.tex` through `sections/07_conclusion.tex`.
3. Add references to `bib/note.bib` and enable one bibliography workflow in `main.tex`.
4. Put supplementary material in `sections/appendix.tex`.

Supported metadata keys include `report-type`, `title`, `subtitle`, `title-en`, `subtitle-en`, `school`, `department`, `major`, `course`, `semester`, `class`, `student-id`, `author`, `instructor`, `date`, and `logo-path`. Legacy commands from version 1.x remain available.

## Class Options and Fonts

```tex
\documentclass[
  oneside,
  fullwidthstop=false,
  fontset=fandol,
  times=false,
  minted=false,
]{tongjithesis}
```

Use `twoside` for two-sided output. `fontset=fandol` is recommended for Overleaf, Linux, and cross-platform collaboration; Windows and macOS users may choose `fontset=windows` or `fontset=mac`. Set `times=true` only when Times New Roman is installed. Keep `minted=false` unless Pygments highlighting is required.

## Default Outline

1. Introduction and scope
2. Literature, theory, and materials
3. Research or practice methods
4. Analysis, experiment, or practice process
5. Results and analysis
6. Discussion
7. Conclusion
8. Appendices

The outline is only a starting point and may be freely renamed, shortened, or reordered.

The sample body includes a three-line table, a grouped header, a flowchart, side-by-side subfigures, an equation, an algorithm, and a code listing. Table captions sit above the table; figure captions sit below the figure. Place image files in `figures/` and include them with `\includegraphics[width=\linewidth]{...}`. The sample schemes and scores are placeholders and should be replaced before submission.

## Bibliography

`main.tex` enables `biblatex + biber` with `gb7714-2025`. Sample entries live in `bib/note.bib` and are cited from the text. To use traditional BibTeX instead, comment out the biblatex setup and `\printbibliography`, then enable method B. Use `gb7714-2015` when a course still requires the 2015 edition. Other disciplines may require an author-year, APA, Chicago, or IEEE style.

## Build

XeLaTeX is recommended; LuaLaTeX is also supported. pdfLaTeX is not supported.

Windows:

```bat
.\make.bat thesis
```

Linux / macOS:

```bash
make
```

You can also build with LaTeX Workshop using `Recipe: latexmk (xelatex)`.

`minted=false` is the default and requires neither Python nor `-shell-escape`. To use Pygments highlighting, set `minted=true`, install Pygments, and explicitly enable shell escape:

```bash
# Linux / macOS
make EXTRA_LATEXMK_OPT=-shell-escape

# Windows PowerShell
$env:EXTRA_LATEXMK_OPT="-shell-escape"; .\make.bat thesis
```

## Provenance and References

This repository is a derived work based on:

- [TJ-CSCCG/TongjiThesis](https://github.com/TJ-CSCCG/TongjiThesis), from which this project's initial code and repository structure were derived.

The generalization work also consulted the public interfaces, repository organization, and documentation practices of the following projects. Apart from the upstream project above, no direct code copying from these reference projects is claimed:

- [jweihe/UCAS_Latex_Template](https://github.com/jweihe/UCAS_Latex_Template)
- [nju-lug/NJUrepo](https://github.com/nju-lug/NJUrepo)
- [tuna/thuthesis](https://github.com/tuna/thuthesis)
- [sjtug/SJTUThesis](https://github.com/sjtug/SJTUThesis)
- [stone-zeng/fduthesis](https://github.com/stone-zeng/fduthesis)

See [NOTICE.md](NOTICE.md) for the complete provenance, license, and modification notice.

The bridge-and-book artwork in the banner was created with assistance from an OpenAI GPT image generation model. The LaTeX wordmark was rendered with the standard `\LaTeX` typesetting command. This is an unofficial project identity, not the Tongji University seal, and must not be used to imply official endorsement.

Suggested citation:

> LostSirius. *General Tongji University Course Report LaTeX Template*, version 2.1.0, 2026.

For template research, redistribution, or derivative development, please also acknowledge the upstream `TJ-CSCCG/TongjiThesis` project.

## License

This project remains licensed under the LaTeX Project Public License 1.3c. See [LICENSE](LICENSE). Original copyright and provenance notices are preserved in the class file and [NOTICE.md](NOTICE.md). The modified version is maintained by LostSirius.
