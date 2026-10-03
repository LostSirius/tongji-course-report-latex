%!TEX root = ../main.tex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tongjithesis -- General Course Report Template for Tongji University
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tongjithesis}[2026/10/04 v2.1.0 Modified General Tongji University Course Report Class]

%% TongjiThesis (formerly tongji-undergrad-thesis)
%% Copyright 2023-2025 TJ-CSCCG
%% Copyright 2026 LostSirius (modifications)
% This file is a modified derivative of TJ-CSCCG/TongjiThesis.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "maintained".
%
% The Current Maintainer of this modified work is LostSirius.
%
% This modified work consists of style/tongjithesis.cls,
% style/tongjithesis.cfg, and the example files distributed with this
% repository. See NOTICE.md for provenance and modification details.
% It is derived from https://github.com/TJ-CSCCG/TongjiThesis.

% ==========================================
% Option Declaration
% ==========================================
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=tongjithesis,
  prefix=tongjithesis@,
  setkeys=\kvsetkeys
}

% Define fullwidthstop option (default is false)
\DeclareBoolOption[false]{fullwidthstop}
% Define times option (default is false)
\DeclareBoolOption[false]{times}
% Define minted option (default is false for zero-dependency builds)
\DeclareBoolOption[false]{minted}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessKeyvalOptions*

% ==========================================
% Class Loading
% ==========================================
% 加载 ctexart 类，有关该类简单说明，see https://www.overleaf.com/learn/latex/Chinese
% 该类提供包括但不限于 \heiti \zihao 等指令
\LoadClass[UTF8,a4paper]{ctexart}

\RequirePackage{xcolor}

% ==========================================
% Required Packages
% ==========================================
% Page layout
\setlength{\headheight}{34pt}
\RequirePackage[a4paper,top=4.2cm,bottom=2.7cm,left=2.55cm,right=2.55cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

% Typography and text formatting
\RequirePackage[T1]{fontenc}
\RequirePackage{setspace}
\RequirePackage{enumerate}
\RequirePackage[inline]{enumitem}
\RequirePackage{circledsteps}
\RequirePackage{ulem}
\RequirePackage{calc}
\RequirePackage{etoolbox}
\RequirePackage{hologo}
\RequirePackage[super,negative]{nth}
\RequirePackage{graphicx}

% Table of contents
\RequirePackage[titles,subfigure]{tocloft}

% Mathematics
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,amscd}
\makeatletter
\iftongjithesis@times
  \RequirePackage{fontspec}%
  \setmainfont{Times New Roman}%
\else
  \RequirePackage{newtxtext,newtxmath}%
\fi
\makeatother

\RequirePackage{upgreek}

% Tables and figures
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{dcolumn}
\RequirePackage{longtable}
\RequirePackage{threeparttable}
\RequirePackage{threeparttablex}
\RequirePackage{subcaption}
\RequirePackage{cases}
\RequirePackage{extarrows}

% Algorithms and code listings
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}

% Always load listings package first (mandatory)
\RequirePackage{listings}
\definecolor{bg}{HTML}{F7F7F7}
\definecolor{commentcolor}{HTML}{000000}
\definecolor{stringcolor}{HTML}{000000}
\definecolor{keywordcolor}{HTML}{000000}
\lstset{
  frame=single,
  framerule=0.4pt,
  rulecolor=\color{black!45},
  backgroundcolor=\color{bg},
  basicstyle=\zihao{-5}\ttfamily,
  keywordstyle=\color{keywordcolor}\bfseries,
  commentstyle=\color{commentcolor}\itshape,
  stringstyle=\color{stringcolor},
  numbers=left,
  numberstyle=\tiny\color{black!45},
  numbersep=8pt,
  breaklines=true,
  columns=fullflexible,
  keepspaces=true,
  showstringspaces=false,
  captionpos=b,
  aboveskip=10pt,
  belowskip=6pt,
  xleftmargin=2.4em,
  framexleftmargin=0.5em,
  tabsize=4,
  escapeinside=||
}
\renewcommand{\lstlistingname}{代码}
\renewcommand{\lstlistlistingname}{代码列表}

% Conditionally load minted package (optional)
\makeatletter
\iftongjithesis@minted
  \RequirePackage[section]{minted}
  \setminted{linenos,
    bgcolor=bg,
    fontsize=\small,
    breaklines,
    mathescape,
    escapeinside=||}
  \renewcommand{\listingscaption}{代码}

  % When using minted, DO NOT redefine the listing environment
  % It's already defined by the minted package
\else
  % When not using minted, create compatibility layer
  \newenvironment{listing}[1][]{%
    \begin{figure}[#1]%
  }{%
    \end{figure}%
  }

  % Define a fake minted environment that forwards to listings
  \newenvironment{minted}[2][]{%
    \begin{lstlisting}[language=#2,#1]%
  }{%
    \end{lstlisting}%
  }

  % Define inputminted command
  \newcommand{\inputminted}[3][]{\lstinputlisting[language=#2,#1]{#3}}
\fi
\makeatother

\RequirePackage{tcolorbox}
\RequirePackage{verbatim}

% Add enhanced verbatim support (no Python dependency)
\RequirePackage{fancyvrb}  % Enhanced verbatim environments
\fvset{
  frame=single,
  numbers=left,
  fontsize=\small,
  baselinestretch=1,
  tabsize=4
}

% Cross-referencing and hyperlinks
\RequirePackage[colorlinks,allcolors=black,unicode=true,bookmarksnumbered=true]{hyperref}
\RequirePackage{nameref}
\RequirePackage[nameinlink,noabbrev]{cleveref}

% Units and graphics
\RequirePackage{siunitx}[=v2]
\sisetup{
  detect-weight=true,
  detect-inline-weight=math,
  group-minimum-digits=4,
}
\robustify{\textbf}
\robustify{\bfseries}

\RequirePackage{tikz}
\usetikzlibrary{arrows.meta,positioning}
\tikzset{
  tongji node/.style={
    rectangle,
    rounded corners=1.5pt,
    draw=black,
    line width=0.7pt,
    fill=white,
    align=center,
    font=\small,
    inner xsep=8pt,
    inner ysep=5pt,
    minimum height=2.5em,
  },
  tongji arrow/.style={
    -{Stealth[length=2.2mm,width=1.6mm]},
    draw=black,
    line width=0.7pt,
  },
}


% 图题在下、表题在上；单行题注居中，多行题注悬挂对齐。
\DeclareCaptionFont{tongjicaption}{\zihao{5}\songti}
\DeclareCaptionFont{tongjicaptionlabel}{\zihao{5}\heiti}
\DeclareCaptionLabelSeparator{tongji}{\quad}
\captionsetup{
  font=tongjicaption,
  labelfont=tongjicaptionlabel,
  labelsep=tongji,
  format=hang,
  justification=justified,
  singlelinecheck=true,
  skip=8pt,
  hypcap=true,
}
\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}
\captionsetup[lstlisting]{position=bottom}
\captionsetup[subfigure]{
  font=tongjicaption,
  labelfont=tongjicaptionlabel,
  labelformat=parens,
  labelsep=space,
  justification=centering,
  singlelinecheck=true,
  skip=4pt,
}

% ==========================================
% General Configurations
% ==========================================

% Line spacing
\setstretch{1.5}  % 设置全文行距为 1.5
\AtBeginDocument{%
  \clubpenalty=10000
  \widowpenalty=10000
  \displaywidowpenalty=10000
}

% ==========================================
% Page Layout
% ==========================================

% 重新定义 \cleardoublepage 命令
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{
	\clearpage
	{\pagestyle{empty}\origdoublepage}
}
\let\cleardoublepage\clearemptydoublepage

% 页眉、页脚横线。用页眉盒的实际宽度绘制，避免比版心更粗的默认线。
\newcommand{\tongjiheadrule}{%
	{\color{black}\hrule height 0.7pt width\headwidth}%
	\vskip-0.7pt%
}
\newcommand{\tongjifootrule}{%
	\vskip-0.45pt%
	{\color{black}\hrule height 0.4pt width\headwidth}%
}

% 右上角报告类型与左侧标识垂直对齐，避免贴在页眉线上。
\newcommand{\tongjiheadmark}{%
	\raisebox{2.2mm}[0pt][0pt]{%
		\zihao{-4}\heiti\tongjitrackchars{0.12em}{\tongjireporttype}%
	}%
}

% 设置摘要与目录页样式（如页眉、页脚等）
\fancypagestyle{firststyle}{
	\fancyhf{}
	\pagenumbering{Roman}                    	% 页数使用罗马数字
	\fancyhead[L]{\includegraphics[height=0.95cm]{\tongjilogopath}}
	\fancyhead[R]{\tongjiheadmark}
	\fancyfoot[C]{\zihao{5}\thepage}
	\renewcommand{\headrule}{\tongjiheadrule}
	\renewcommand{\headrulewidth}{0.7pt}
	\renewcommand{\footrule}{}
	\renewcommand{\footrulewidth}{0pt}
}

% 设置正文页样式（如页眉、页脚等）
\fancypagestyle{mainstyle}{
	\fancyhf{}
	\pagenumbering{arabic}
	\fancyhead[L]{\includegraphics[height=0.95cm]{\tongjilogopath}}
	\fancyhead[R]{\tongjiheadmark}
	\fancyfoot[R]{\zihao{5}共\quad\pageref{LastPage}\quad 页\quad 第\quad\thepage\quad 页}
	\renewcommand{\headrule}{\tongjiheadrule}
	\renewcommand{\headrulewidth}{0.7pt}
	\renewcommand{\footrule}{\tongjifootrule}
	\renewcommand{\footrulewidth}{0.4pt}
}

% ==========================================
% Typography and Font Settings
% ==========================================

% 表格内所有字体均为小五：\zihao{-5}
\AtBeginEnvironment{table}{\zihao{-5}\renewcommand{\arraystretch}{1.18}}
\AtBeginEnvironment{tabular}{\zihao{-5}}
\AtBeginEnvironment{tabularx}{\zihao{-5}}
\AtBeginEnvironment{longtable}{\zihao{-5}}
\AtBeginEnvironment{tablenotes}{\zihao{-5}}

% ==========================================
% Lists and Enumerations
% ==========================================

% 设置有序列表与无序列表格式
\setlistdepth{2}

\setlist[enumerate]{itemsep=0.22em,parsep=0pt,topsep=0.45em,labelsep=0.45em}
\setlist[enumerate,1]{label=（\arabic*）,left=2em,wide=\parindent}
\setlist[enumerate,2]{label=\Circled{\arabic*},labelwidth=1.4em,listparindent=0pt}

\setlist[itemize]{itemsep=0.22em,parsep=0pt,topsep=0.45em}
\setlist[itemize,1]{wide=\parindent}
\setlist[itemize,2]{wide=2\parindent}

% ==========================================
% Table of Contents Formatting
% ==========================================

% 修改目录编号与文字的间距，默认为 1em，强制修改为 0.5em
\makeatletter
\renewcommand{\numberline}[1]{%
	\settowidth\@tempdimb{#1\hspace{0.5em}}%
	\hb@xt@\@tempdimb{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}
\makeatother

% 在上述修改基础上，符合模板标题对齐要求
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1}
\setlength{\cftsecindent}{0em} % 一级标题顶格
\setlength{\cftsubsecindent}{1em} % 二级标题对齐一级标题文字
\setlength{\cftsubsubsecindent}{4em} % 三级标题对齐一级标题第四字
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforesubsubsecskip}{0pt}
\renewcommand{\contentsname}{\zihao{4}\heiti\textmd{目~~录}}
\renewcommand{\cftsecfont}{\songti\zihao{5}}
\renewcommand{\cftsubsecfont}{\songti\zihao{5}}
\renewcommand{\cftsubsubsecfont}{\songti\zihao{5}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}
\renewcommand{\cftsecpagefont}{\zihao{5}}
\renewcommand{\cftsubsecpagefont}{\zihao{5}}
\renewcommand{\cftsubsubsecpagefont}{\zihao{5}}

% ==========================================
% Section/Chapter Numbering
% ==========================================

% 设置图表编号和章节相关联
\RequirePackage{chngcntr}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\AtBeginDocument{\counterwithin{lstlisting}{section}}
% \counterwithin{listing}{section}
\counterwithin{equation}{section}
\counterwithin{algorithm}{section}

% 设置正文页内章节标题格式
\ctexset{
	section={% 一级标题
	  format={\centering\heiti\zihao{4}}, % 格式：四号黑体居中
	  aftername={\quad}, % 序号与题名间空 4 格
	  beforeskip={1.15\baselineskip}, % 段前约 1 行，节与节连续排版时留出间隔
	  afterskip={.5\baselineskip}, % 段后 0.5 行
	 },
	subsection={% 二级标题
			format={\heiti\zihao{5}}, % 格式：五号黑体
			aftername={\space}, % 序号与题名间空 1 格
			beforeskip={.5\baselineskip}, % 段前 0.5 行
			afterskip={.5\baselineskip}, % 段后 0.5 行
		},
	subsubsection={% 三级标题
			format={\heiti\zihao{5}}, % 格式：五号黑体
			aftername={\space}, % 序号与题名间空 1 格
			beforeskip={.5\baselineskip}, % 段前 0.5 行
			afterskip={.5\baselineskip}, % 段后 0.5 行
			indent={2em}, % 缩进 2 个汉字符
		},
	paragraph={% 四级标题
			format={\heiti\zihao{5}}, % 格式：五号黑体
			numbering=true, % 启用编号
			number={\Alph{paragraph}}, % 编号格式：使用大写字母作为四级标题
			aftername={.\space}, % 序号后带点和一个空格
			beforeskip={0pt}, % 段前 0 行
			afterskip={0pt}, % 段后 0 行
			indent={2em}, % 缩进 2 个汉字符
			aftertitle={\par}, % 标题后添加一个空行
		},
	subparagraph={% 五级标题
			format={\heiti\zihao{5}}, % 格式：五号黑体
			numbering=true, % 启用编号
			number={\alph{subparagraph}}, % 编号格式：使用小写字母作为五级标题
			aftername={.\space}, % 序号后带点和一个空格
			beforeskip={0pt}, % 段前 0 行
			afterskip={0pt}, % 段后 0 行
			indent={2em}, % 缩进 2 个汉字符
			aftertitle={\par}, % 标题后添加一个空行
		}
}

\setcounter{secnumdepth}{5}

% ==========================================
% Float Settings
% ==========================================

% 设置浮动体的 caption 位置
\floatstyle{plaintop}       % 表格的 caption 在表格上方，这里仅设置了 table 环境，longtable 环境默认 plaintop
\restylefloat{table}
\floatstyle{plain}
\restylefloat{listing}      % listing 环境默认为 ruled，修改为 plain，将 caption 放在下方
\sloppy

\setlength{\floatsep}{12pt plus 2pt minus 2pt}
\setlength{\textfloatsep}{16pt plus 3pt minus 4pt}
\setlength{\intextsep}{12pt plus 2pt minus 2pt}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\textfraction}{0.08}
\renewcommand{\floatpagefraction}{0.75}
\setcounter{topnumber}{3}
\setcounter{totalnumber}{5}

% ==========================================
% Math and Theorem Environments
% ==========================================

\newtheoremstyle{tongji}
  {0.7em}{0.7em}
  {}{}
  {\heiti}{}
  {0.6em}
  {}
\theoremstyle{tongji}
\newtheorem{thm}{定理\hspace{0.05pt}}[section]
\newtheorem{cor}{推论\hspace{0.05pt}}[section]
\newtheorem{lem}{引理\hspace{0.05pt}}[section]
\newtheorem{prop}{命题\hspace{0.05pt}}[section]
\newtheorem{conj}{猜想\hspace{0.05pt}}[section]
\newtheorem{assume}{假设\hspace{0.05pt}}[section]
\newtheorem{dfn}{定义\hspace{0.05pt}}[section]
\newtheorem{exmp}{例\hspace{0.05pt}}[section]
\newtheorem{rem}{注\hspace{0.05pt}}[section]
\newtheorem*{pf}{证明}

% Math commands
\providecommand{\dd}{\mathop{}\!\mathrm{d}}
\providecommand{\ee}{\mathrm{e}}
\providecommand{\ii}{\mathrm{i}}
\providecommand{\jj}{\mathrm{j}}
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\providecommand\pkg[1]{\href{https://ctan.org/pkg/#1}{\sffamily#1}}

% ==========================================
% Algorithm and Code Listing Settings
% ==========================================

% 伪代码。保留 algorithm 宏包的浮动体，因此可以写 \begin{algorithm}[htbp]。
\floatname{algorithm}{算法}
\renewcommand{\listalgorithmname}{算法列表}
\AtBeginEnvironment{algorithm}{\zihao{5}}
\renewcommand{\algorithmicrequire}{\textbf{输入：}}
\renewcommand{\algorithmicensure}{\textbf{输出：}}
\algrenewcommand\algorithmicfor{\textbf{对于}}
\algrenewcommand\algorithmicdo{}
\algrenewcommand\algorithmicreturn{\textbf{返回}}
\algrenewtext{EndFor}{\textbf{结束}}

% ==========================================
% Cross-Referencing Commands
% ==========================================

% 交叉引用
\newcommand*{\secref}[1]{第~\ref{#1}~节}
\newcommand*{\algoref}[1]{算法~\ref{#1}~}
\renewcommand*{\eqref}[1]{\mbox{公式（\ref{#1}）}}
\newcommand*{\tabref}[1]{\tablename~\ref{#1}~}
\newcommand*{\figref}[1]{\figurename~\ref{#1}~}

% Counter and cross-reference setup for code listings
\makeatletter
\iftongjithesis@minted
  % For minted package
  \renewcommand{\listingscaption}{代码}
  \crefname{listing}{代码}{代码}
  \Crefname{listing}{代码}{代码}
\fi
\makeatother

% For listings package
\renewcommand{\lstlistingname}{代码}
\crefname{lstlisting}{代码}{代码}
\Crefname{lstlisting}{代码}{代码}
\newcommand*{\listingref}[1]{\lstlistingname~\ref{#1}}

% Configure references in Chinese
\crefname{equation}{式}{式}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{section}{章节}{章节}
\crefname{subsection}{小节}{小节}
\crefname{subsubsection}{子小节}{子小节}
\crefname{paragraph}{段落}{段落}
\crefname{subparagraph}{子段落}{子段落}
\crefname{FancyVerbLine}{行}{行}
\crefname{theorem}{定理}{定理}
\crefname{thm}{定理}{定理}
\crefname{cor}{推论}{推论}
\crefname{lem}{引理}{引理}
\crefname{prop}{命题}{命题}
\crefname{conj}{猜想}{猜想}
\crefname{assume}{假设}{假设}
\crefname{dfn}{定义}{定义}
\crefname{exmp}{例}{例}
\crefname{rem}{注}{注}
\crefname{pf}{证明}{证明}
\crefname{proof}{证明}{证明}
\crefname{algorithm}{算法}{算法}

% Configure connecting words
\newcommand{\crefpairconjunction}{ 和~}
\newcommand{\crefmiddleconjunction}{、}
\newcommand{\creflastconjunction}{ 和~}
\newcommand{\crefpairgroupconjunction}{ 和}
\newcommand{\crefmiddlegroupconjunction}{、}
\newcommand{\creflastgroupconjunction}{ 和}
\newcommand{\crefrangeconjunction}{ 至~}

% ==========================================
% Logo Commands
% ==========================================

\providecommand{\XeTeX}{\hologo{XeTeX}}
\providecommand{\BibTeX}{\hologo{BibTeX}}
\providecommand{\BibLaTeX}{\textsc{Bib}\LaTeX}
\providecommand{\LuaTeX}{\hologo{LuaTeX}}

% ==========================================
% Cover and User Information Commands
% ==========================================

% 设置封面信息盒子（information 环境）
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
\let\oldtabular\tabular
\let\endoldtabular\endtabular
\newenvironment{information}[1][h!]{
	\renewcommand{\arraystretch}{1.5}
	\setlength{\tabcolsep}{8pt}
	\zihao{-3}\oldtabular[#1]
}{\renewcommand{\arraystretch}{1.2}\endoldtabular
}

\newlength{\covertextwidth}
\newlength{\covermaxwidth}

\newcommand{\ulinecentered}[1]{
	\setlength{\covertextwidth}{\widthof{#1}}
	\setlength{\covermaxwidth}{20em} % Set the maximum width you allow
	\ifthenelse{\lengthtest{\covertextwidth > \covermaxwidth}}{
		% Calculate scale factor and scale down text if too wide
		\pgfmathsetmacro{\scalefactor}{\covermaxwidth/\covertextwidth}
		\uline{\makebox[\covermaxwidth][c]{\scalebox{\scalefactor}[1]{#1}}}
	}{
		\uline{\makebox[\covermaxwidth][c]{#1}} % Use normal text if within the limit
	}
}

% 报告基本信息配置
\newcommand{\university}[1]{\def\tongjiuniversity{#1}}
\newcommand{\universityeng}[1]{\def\tongjiuniversityeng{#1}}
\newcommand{\logopath}[1]{\def\tongjilogopath{#1}}
\newcommand{\school}[1]{\def\tongjischool{#1}}
\newcommand{\department}[1]{\def\tongjidepartment{#1}}
\newcommand{\major}[1]{\def\tongjimajor{#1}}
\newcommand{\course}[1]{\def\tongjicourse{#1}}
\newcommand{\semester}[1]{\def\tongjisemester{#1}}
\newcommand{\studentclass}[1]{\def\tongjiclass{#1}}
\newcommand{\student}[2]{\def\tongjiauthornumber{#1}\def\tongjiauthor{#2}}
\newcommand{\thesistitle}[2]{\def\tongjithesistitle{#1}\def\tongjithesissubtitle{#2}}
\newcommand{\thesistitleeng}[2]{\def\tongjithesistitleeng{#1}\def\tongjithesissubtitleeng{#2}}
\newcommand{\thesisadvisor}[1]{\def\tongjithesisadvisor{#1}}
\newcommand{\reporttype}[1]{\def\tongjireporttype{#1}}
\newcommand{\reportdate}[1]{\def\tongjireportdate{#1}}
\newcommand{\thesisdate}[3]{%
	\def\tongjithesisyear{#1}%
	\def\tongjithesismonth{#2}%
	\def\tongjithesisday{#3}%
	\reportdate{#1年#2月#3日}%
}

% 统一的键值配置接口；旧版逐条设置命令继续可用。
\pgfkeys{
	/tongji/report/.is family,
	/tongji/report,
	university/.code={\university{#1}},
	university-en/.code={\universityeng{#1}},
	logo-path/.code={\logopath{#1}},
	report-type/.code={\reporttype{#1}},
	title/.code={\def\tongjithesistitle{#1}},
	subtitle/.code={\def\tongjithesissubtitle{#1}},
	title-en/.code={\def\tongjithesistitleeng{#1}},
	subtitle-en/.code={\def\tongjithesissubtitleeng{#1}},
	school/.code={\school{#1}},
	department/.code={\department{#1}},
	major/.code={\major{#1}},
	course/.code={\course{#1}},
	semester/.code={\semester{#1}},
	class/.code={\studentclass{#1}},
	student-id/.code={\def\tongjiauthornumber{#1}},
	author/.code={\def\tongjiauthor{#1}},
	instructor/.code={\thesisadvisor{#1}},
	date/.code={\reportdate{#1}},
}
\newcommand{\tongjisetup}[1]{\pgfkeys{/tongji/report,#1}}

\newcommand{\tongjicoverrow}[2]{%
	\zihao{4}\heiti{#1} & \ulinecentered{#2} \\%
}

\newlength{\tongjicoverrulewidth}
% 与 information 环境中两列宽度一致：5em + 22em，另加两侧和列间的 \tabcolsep。
\newcommand{\tongjisetcoverrulewidth}{%
	\begingroup
		\zihao{-3}%
		\setlength{\tongjicoverrulewidth}{\dimexpr27em+32pt\relax}%
		\ifdim\tongjicoverrulewidth>\textwidth
			\setlength{\tongjicoverrulewidth}{\textwidth}%
		\fi
		\global\tongjicoverrulewidth=\tongjicoverrulewidth
	\endgroup
}

\ExplSyntaxOn
\seq_new:N \l_tongji_letters_seq
\cs_new_protected:Npn \tongji_track_word:nn #1 #2
  {
    \seq_set_split:Nnn \l_tongji_letters_seq { } { #2 }
    \seq_use:Nn \l_tongji_letters_seq { \hspace { #1 } }
  }
\cs_new_protected:Npn \tongji_track_text:nnn #1 #2 #3
  {
    \tl_set:Nx \l_tmpa_tl { #3 }
    \seq_set_split:NnV \l_tmpa_seq { ~ } \l_tmpa_tl
    \seq_clear:N \l_tmpb_seq
    \seq_map_inline:Nn \l_tmpa_seq
      {
        \seq_put_right:Nn \l_tmpb_seq { \tongji_track_word:nn { #1 } { ##1 } }
      }
    \seq_use:Nn \l_tmpb_seq { \hspace { #2 } }
  }
\cs_new_protected:Npn \tongji_track_upper:n #1
  {
    \tl_set:Nx \l_tmpa_tl { \text_uppercase:n { #1 } }
    \exp_args:Nnno \tongji_track_text:nnn { 0.18em } { 0.75em } { \l_tmpa_tl }
  }
\NewDocumentCommand \tongjitrackupper { m }
  { \tongji_track_upper:n { #1 } }
\NewDocumentCommand \tongjitrackchars { m m }
  { \tongji_track_text:nnn { #1 } { 0.9em } { #2 } }
\ExplSyntaxOff

\newlength{\tongjicovertypewidth}
\newlength{\tongjicoverengwidth}
\newcommand{\tongjicovertype}{%
	\settowidth{\tongjicovertypewidth}{\tongjireporttype}%
	\ifdim\tongjicovertypewidth>0.78\tongjicoverrulewidth
		\tongjireporttype
	\else
		\tongjitrackchars{0.42em}{\tongjireporttype}%
	\fi
}

% 设置封面
\newcommand{\MakeCover}[0]{
	\thispagestyle{empty}
	\hypersetup{
		pdftitle={\tongjithesistitle},
		pdfauthor={\tongjiauthor},
	}
	\tongjisetcoverrulewidth
	% 正文上边距大于下边距。这里少留一段，使封面内容在纸面上上下留白相等。
	\vspace*{\fill}%
	\vspace*{-\dimexpr1in+\topmargin+\headheight+\headsep
		-(\paperheight-\textheight-1in-\topmargin-\headheight-\headsep)\relax}%
	\vspace*{38.4pt}%
	\begin{center}
		\includegraphics[height=1.42cm]{\tongjilogopath}\par
		\vspace{0.95em}
		{\zihao{5}%
			\settowidth{\tongjicoverengwidth}{\tongjitrackupper{\tongjiuniversityeng}}%
			\tongjitrackupper{\tongjiuniversityeng}\par
			\nointerlineskip
			\vspace{1.6pt}%
			{\color{black}\rule{\dimexpr\tongjicoverengwidth+0.45em\relax}{0.65pt}}\par
		}%
		\vspace{2.85em}
		{\zihao{1}\heiti\tongjicovertype}\par
		\vspace{2.65em}

		% 报告基本信息
		\begin{information}{M{5em}M{22em}}
			\tongjicoverrow{主\enskip{}标\enskip{}题}{\tongjithesistitle}
			\ifdefempty{\tongjithesissubtitle}{}{\tongjicoverrow{副\enskip{}标\enskip{}题}{\tongjithesissubtitle}}
			\tongjicoverrow{学\quad{}\quad{}院}{\tongjischool}
			\ifdefempty{\tongjidepartment}{}{\tongjicoverrow{系\quad{}\quad{}所}{\tongjidepartment}}
			\tongjicoverrow{专\quad{}\quad{}业}{\tongjimajor}
			\tongjicoverrow{课\quad{}\quad{}程}{\tongjicourse}
			\ifdefempty{\tongjisemester}{}{\tongjicoverrow{学\quad{}\quad{}期}{\tongjisemester}}
			\ifdefempty{\tongjiclass}{}{\tongjicoverrow{班\quad{}\quad{}级}{\tongjiclass}}
			\tongjicoverrow{学生姓名}{\tongjiauthor}
			\tongjicoverrow{学\quad{}\quad{}号}{\tongjiauthornumber}
			\tongjicoverrow{课程教师}{\tongjithesisadvisor}
			\tongjicoverrow{日\quad{}\quad{}期}{\tongjireportdate}
		\end{information}

	\end{center}
	\vspace*{\fill}%
}

% 设置中文摘要页
\newcommand{\MakeAbstract}[2]{
	\begin{center}\heiti\zihao{4}
		摘要
	\end{center}
	\vspace{-0.5em}

	\begin{spacing}{1.5}
		\heiti\songti{#1}
		\par
	\end{spacing}

	\vskip 5mm
	\noindent{\heiti\zihao{5}关键词：}{\songti\zihao{5}#2}\par
}

% 设置英文摘要页
\newcommand{\MakeAbstractEng}[2]{
	\clearpage
	\begin{center}\heiti\zihao{-2}
		\ \\
		\textbf{\tongjithesistitleeng}
	\end{center}
	\vspace{1pt}
	\begin{center}\heiti\zihao{4}
		\textbf{ABSTRACT}
	\end{center}
	\vspace{-0.5em}

	\begin{spacing}{1.5}
		#1
		\par
	\end{spacing}

	\vskip 13.65pt % 小五字体单倍行距 13.65pt
	\noindent{\heiti\zihao{5}Key words: }{\songti\zihao{5}#2}
	\par
}

% ==========================================
% Configuration Input
% ==========================================

% 设置全角句号替换为全角点号
% Enable fullwidthstop replacement if the option is set to true
\makeatletter
\iftongjithesis@fullwidthstop
  \catcode`\。=\active
  \newcommand{。}{\ifmmode\text{．}\else ．\fi}
\fi
\makeatother

% 加载用户配置文件
\AtEndOfPackage{
	\InputIfFileExists{tongjithesis.cfg}{}{}
}
