<!-- markdownlint-disable MD033 MD041 -->
<div align="center">
  <a href="https://lostsirius.github.io/tongji-course-report-latex/">
    <img src="figures/tongji-latex-readme-banner.png" width="900" alt="融合桥梁、书本与 LaTeX 标识的项目横幅">
  </a>
  <h1>同济大学通用课程报告 LaTeX 模板</h1>
  <p>一个面向同济大学各学院、各学科的现代化、易配置、非官方课程报告模板</p>
  <p>
    <a href="https://github.com/LostSirius/tongji-course-report-latex/releases/tag/v2.0.0"><img src="https://img.shields.io/badge/version-2.0.0-0b5cad" alt="Version 2.0.0"></a>
    <a href="https://github.com/LostSirius/tongji-course-report-latex/actions/workflows/test.yaml"><img src="https://github.com/LostSirius/tongji-course-report-latex/actions/workflows/test.yaml/badge.svg" alt="Build status"></a>
    <a href="https://github.com/LostSirius/tongji-course-report-latex/actions/workflows/jekyll-gh-pages.yml"><img src="https://github.com/LostSirius/tongji-course-report-latex/actions/workflows/jekyll-gh-pages.yml/badge.svg" alt="Pages status"></a>
    <a href="LICENSE"><img src="https://img.shields.io/badge/license-LPPL--1.3c-1468a0" alt="LPPL 1.3c"></a>
    <img src="https://img.shields.io/badge/engine-XeLaTeX%20%7C%20LuaLaTeX-008bce" alt="XeLaTeX and LuaLaTeX">
    <img src="https://img.shields.io/badge/maintainer-LostSirius-00a6c8" alt="Maintainer LostSirius">
  </p>
  <p><strong>中文</strong> | <a href="README-EN.md">English</a></p>
  <p><a href="https://lostsirius.github.io/tongji-course-report-latex/">项目主页</a> · <a href="https://github.com/LostSirius/tongji-course-report-latex/releases">版本下载</a></p>
</div>

可用于课程论文、大作业、实验报告、课程设计、调研报告、读书报告、实习报告和田野调查报告等场景。模板不绑定具体学院或学科，封面、报告类型和正文结构均可配置。默认示例不含真实姓名、学号或其他个人信息。

> [!IMPORTANT]
> 本项目不是同济大学官方模板，也不代表任何学院的强制格式。提交前请以任课教师、课程大纲和所在学院的最新要求为准。

## 主要特性

- 同济大学风格的通用封面和页眉页脚，正文版心左右居中且不含装订线。
- 通过 `\tongjisetup{...}` 集中填写封面元数据。
- 学院、系所、专业、学期和班级均可配置；可选字段留空后自动隐藏。
- 正文骨架兼顾理工医科、人文社科、经管法、建筑设计与艺术类写作。
- 支持公式、定理、表格、图片、算法、代码、附录和交叉引用。
- 默认使用零外部依赖的 `listings`；可选 `minted` 代码高亮。
- 支持 XeLaTeX 和 LuaLaTeX，默认使用 TeX Live 自带的 Fandol 字体。
- 可按课程要求选择 `biblatex + biber` 或 `BibTeX + gbt7714`。

## 获取与使用

### 在线使用

本项目暂未发布独立 Overleaf 模板。可以下载当前仓库 ZIP，然后在 Overleaf 中选择“New Project → Upload Project”导入。导入后请确认：

1. 主文档设为 `main.tex`。
2. 编译器设为 XeLaTeX 或 LuaLaTeX。
3. `minted=false` 时无需开启 shell escape。

### 本地使用

安装 TeX Live 2025+ 或相应版本的 MacTeX/MiKTeX，下载或克隆当前仓库，并直接打开项目根目录。推荐使用最新稳定版 TeX 发行版；遇到难以解释的宏包错误时，优先升级发行版后重新编译。

### GitHub Actions

仓库内置 Linux、macOS、Windows 三平台以及 XeLaTeX、LuaLaTeX 双引擎测试。将项目推送到 GitHub 后，Actions 会自动编译并上传 PDF Artifact。首次使用时需要在仓库设置中允许 GitHub Actions 运行。

## 快速开始

1. 在 `sections/frontcover.tex` 中填写封面：

```tex
\tongjisetup{
  report-type = {同济大学课程论文},
  title       = {报告题目},
  subtitle    = {},
  school      = {人文学院},
  department  = {},
  major       = {汉语言文学},
  course      = {课程名称},
  semester    = {2026--2027 学年第一学期},
  class       = {},
  student-id  = {学号},
  author      = {姓名},
  instructor  = {课程教师},
  date        = {\today},
}
```

1. 在 `sections/00_abstract.tex` 中填写摘要与关键词。
2. 在 `sections/01_intro.tex` 至 `sections/07_conclusion.tex` 中撰写正文。
3. 在 `bib/note.bib` 中维护参考文献，并按需启用 `main.tex` 中的参考文献配置。
4. 在 `sections/appendix.tex` 中放置问卷、访谈提纲、推导、数据说明、图版、代码等补充材料。

## 封面配置

`\tongjisetup` 支持以下键：

- `report-type`：报告类型，如“课程论文”“实验报告”“课程设计报告”。
- `title`、`subtitle`：中文标题与可选副标题。
- `title-en`、`subtitle-en`：英文标题与可选副标题。
- `school`、`department`：学院/学部与可选系所。
- `major`、`course`：专业与课程名称。
- `semester`、`class`：可选学期与班级。
- `student-id`、`author`：学号与姓名。
- `instructor`、`date`：课程教师与日期。
- `university`、`university-en`：通常无需修改的校名字段。
- `logo-path`：校徽或页眉标识文件，默认为 `figures/tongji.pdf`。

旧版的 `\school`、`\major`、`\course`、`\student`、`\thesistitle`、`\thesisadvisor` 等命令仍可使用。

## 文档类选项

在 `main.tex` 的 `\documentclass` 中配置：

```tex
\documentclass[
  oneside,              % 单面排版；双面打印可改为 twoside
  fullwidthstop=false,  % true：将中文句号“。”替换为全角点“．”
  fontset=fandol,       % 跨平台默认字体集
  times=false,          % true：西文字体使用系统 Times New Roman
  minted=false,         % true：启用 Pygments 代码高亮
]{tongjithesis}
```

- `oneside` / `twoside`：控制单双面排版。
- `fontset`：直接传递给 `ctexart`，常用值为 `fandol`、`windows`、`mac`。
- `times`：启用系统 Times New Roman；系统未安装该字体时请保持 `false`。
- `fullwidthstop`：控制中文句号样式。
- `minted`：控制代码高亮后端；默认的 `listings` 不需要外部程序。

### 字体选择

- Windows 可使用 `fontset=windows`，调用 SimSun、SimHei、KaiTi、FangSong 等系统字体。
- macOS 可使用 `fontset=mac`，调用系统中文字体。
- Overleaf、Linux 和跨平台协作推荐 `fontset=fandol`，无需额外安装字体。
- 古籍、语言学、艺术史等包含生僻字的文档，应单独检查字体覆盖范围。

常见 `report-type` 示例：

- 理工医科：实验报告、课程设计报告、项目报告、研究报告。
- 人文社科：课程论文、文献综述、读书报告、田野调查报告。
- 经管法：案例分析报告、调研报告、商业分析报告、法律检索报告。
- 建筑设计与艺术：设计说明、作品研究报告、创作报告、调研与测绘报告。
- 实践教学：实习报告、社会实践报告、创新创业项目报告。

## 正文章节

默认骨架为：

1. 概述
2. 文献、理论与材料
3. 研究或实践方法
4. 分析、实验或实践过程
5. 结果与分析
6. 讨论
7. 总结
8. 附录

章节只是通用起点，可以直接重命名、增删或重排。课程要求较短时，也可以只保留“概述—正文—总结”。

## 参考文献

`main.tex` 提供两种可选配置：

- `biblatex + biber`：功能完整，推荐用于新文档。
- `BibTeX + gbt7714`：适合已有 BibTeX 工作流。

示例默认使用 GB/T 7714 数字制样式，但不同学科可能要求作者—年份制、APA、Chicago、IEEE 或其他格式。模板不会替代课程对引用规范的要求。

## 编译

推荐 XeLaTeX；LuaLaTeX 也受支持。不支持 pdfLaTeX。

Windows：

```bat
.\make.bat thesis
```

Linux / macOS：

```bash
make
```

也可以在 VS Code / Cursor 的 LaTeX Workshop 中打开项目根目录，选择 `Recipe: latexmk (xelatex)`。

默认 `minted=false`，无需 Python 和 `-shell-escape`。如需 Pygments 高亮，将 `main.tex` 中的选项改为 `minted=true`、安装 Pygments，并显式开启 shell escape：

```bash
# Linux / macOS
make EXTRA_LATEXMK_OPT=-shell-escape

# Windows PowerShell
$env:EXTRA_LATEXMK_OPT="-shell-escape"; .\make.bat thesis
```

## 常见问题

### 找不到 `tongjithesis.cls`

请打开完整项目根目录，而不是单独打开 `main.tex`。本项目通过 `.latexmkrc` 将 `style/` 加入 TeX 搜索路径。

### 中文字体缺失或显示异常

优先使用默认的 `fontset=fandol`。若使用 `windows` 或 `mac`，请确认对应系统字体已经安装，并在安装新字体后刷新字体缓存。

### 参考文献没有生成

确认已经在 `main.tex` 中启用一种且仅一种参考文献方案，并运行完整的 `latexmk` 构建。使用 `biblatex` 时需要 biber；使用传统方案时需要 BibTeX。

### `minted` 报错

确认 Python 和 Pygments 可用，且编译命令显式包含 `-shell-escape`。如果不需要复杂代码高亮，保持 `minted=false` 即可。

### 格式与学院要求不一致

本项目提供通用起点，不替代课程或学院规范。请优先修改封面元数据和章节结构；如果需要改变页边距、字号或页眉样式，再调整 `style/tongjithesis.cls`。

## 目录结构

```text
.
├── main.tex                 # 主入口
├── sections/                # 封面、摘要、正文与附录
├── style/
│   ├── tongjithesis.cls     # 文档类与排版逻辑
│   └── tongjithesis.cfg     # 默认元数据
├── figures/                 # 图片与校徽资源
│   ├── tongji.pdf           # 上游提供的封面/页眉示例标识
│   └── tongji-latex-readme-banner.png # README 横向项目标识
├── bib/note.bib             # 参考文献数据库
├── NOTICE.md                # 来源、改动和第三方声明
├── CHANGELOG.md             # 版本变化
├── SECURITY.md              # 安全报告与 shell escape 说明
└── CITATION.cff             # GitHub 引用元数据
```

## 来源、参考与引用

本项目是派生作品，基础代码来源于：

- [TJ-CSCCG/TongjiThesis](https://github.com/TJ-CSCCG/TongjiThesis)：本项目的初始代码与仓库结构由此派生。

本次通用化重构还参考了以下公开项目的接口设计、仓库组织和文档实践；除上述基础项目外，未声明直接复制这些项目的代码：

- [jweihe/UCAS_Latex_Template](https://github.com/jweihe/UCAS_Latex_Template)：通用课程大作业模板；参考其“主文件 + 样式 + 图片 + 文献”的易用组织。
- [nju-lug/NJUrepo](https://github.com/nju-lug/NJUrepo)：通用作业/实验报告模板；参考其多场景报告定位。
- [tuna/thuthesis](https://github.com/tuna/thuthesis)：参考成熟高校模板的版本、发布和维护说明。
- [sjtug/SJTUThesis](https://github.com/sjtug/SJTUThesis)：参考 XeLaTeX/LuaLaTeX 与 UTF-8 使用说明。
- [stone-zeng/fduthesis](https://github.com/stone-zeng/fduthesis)：参考集中式键值配置接口。

完整的派生关系、许可证和改动说明见 [NOTICE.md](NOTICE.md)。

README 顶部横幅的桥梁、书本底图由 OpenAI GPT 图像生成模型辅助创作，LaTeX 字标由标准 `\LaTeX` 排版命令渲染。它属于本修改版的非官方项目视觉元素，不是同济大学校徽，也不应被用于暗示学校官方认可。

如在论文、课程项目或再发布版本中需要引用本项目，可使用仓库的 `CITATION.cff`，或写作：

> LostSirius. *同济大学通用课程报告 LaTeX 模板*, version 2.0.0, 2026.

若你的工作涉及模板本身的研究、再开发或发布，也请同时注明基础项目 `TJ-CSCCG/TongjiThesis`。

## 许可证

本项目沿用 LaTeX Project Public License 1.3c，见 [LICENSE](LICENSE)。原项目版权和来源声明保留在文档类及 [NOTICE.md](NOTICE.md) 中。修改版由 LostSirius 维护。
