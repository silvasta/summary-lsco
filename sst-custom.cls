%-----------------------------------------------------------------
\ProvidesClass{sst-custom}
%-----------------------------------------------------------------
% 1. LOAD OPTION PARSERS FIRST
%-----------------------------------------------------------------
\RequirePackage{etoolbox}
\RequirePackage{kvoptions}

\SetupKeyvalOptions{
  family=myclass,
  prefix=myclass@
}
\DeclareStringOption[regular]{layout} % Default: regular
\DeclareStringOption[1]{columns}      % Default: 1 column
\DeclareStringOption[2]{secnumdepth}

\newtoggle{use-tight}
\togglefalse{use-tight}
\DeclareOption{tight}{
  \toggletrue{use-tight}
}

\DeclareOption{landscape}{
  \PassOptionsToClass{landscape}{article}
}
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{article} % Pass unknown to article
}

\ProcessKeyvalOptions*
\ProcessOptions\relax

%-----------------------------------------------------------------
% 2. LOAD BASE CLASS NOW
%-----------------------------------------------------------------
\LoadClass{article}

%-----------------------------------------------------------------
% 3. LANGUAGE & FONT ENCODING (Fixes OT1 warnings and multilingual errors)
%-----------------------------------------------------------------
\RequirePackage[T1]{fontenc} % Critical for pdflatex and modern fonts
\RequirePackage[english]{babel} % Required by datetime/fmtcount
\RequirePackage[condensed, sfdefault]{roboto}
\RequirePackage{roboto-mono}
\RequirePackage{sfmath}
%-----------------------------------------------------------------
% 4. GENERAL PACKAGES
%-----------------------------------------------------------------
\RequirePackage[document]{ragged2e}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[explicit]{titlesec}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[most]{tcolorbox}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{adjustbox}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{atbegshi}
\RequirePackage{booktabs}
\RequirePackage{calc}
\RequirePackage{caption}
\RequirePackage{colortbl}
\RequirePackage{csquotes}
\RequirePackage{empheq}
\RequirePackage{environ}
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{lipsum}
\RequirePackage{longtable}
\RequirePackage{mathtools}
\RequirePackage{multicol}
\RequirePackage{parskip}
\RequirePackage{pgffor}
\RequirePackage{siunitx}
\RequirePackage{subcaption}
\RequirePackage{svg}

\usetikzlibrary{shapes.geometric, arrows, backgrounds, positioning, arrows.meta}

\RequirePackage{silence}
\WarningFilter{latex}{Command \underbar has changed}
\WarningFilter{latex}{Command \underline has changed}

%-----------------------------------------------------------------
% 5. LAYOUTS (Using \geometry{} instead of \RequirePackage)
%-----------------------------------------------------------------
\ifdefstring{\myclass@layout}{regular}{
  \geometry{paperheight=297mm,
    paperwidth=210mm,
    top=18mm,
    bottom=18mm,
    footskip=10mm,
    inner=18mm,
    outer=18mm,
    centering
  }
  \setlength{\columnsep}{11mm}
}{}

\ifdefstring{\myclass@layout}{summary}{
  \geometry{
    paperheight=210mm,
    paperwidth=297mm,
    top=1mm,
    bottom=1mm,
    inner=1mm,
    outer=1mm,
    centering
} }{}

\newlength{\previewwidth}

\ifdefstring{\myclass@layout}{preview1col}{
  \iftoggle{use-tight} {
    \setlength\previewwidth{73.5mm}
  }{
    \setlength\previewwidth{81.5mm}
  }
  \geometry{
    paperheight=210mm,
    paperwidth=\previewwidth,
    top=1mm,
    bottom=1mm,
    inner=1mm,
    outer=1mm,
    centering,
  }
}{}

\ifdefstring{\myclass@layout}{preview2col}{
  \iftoggle{use-tight}{\setlength\previewwidth{73.5mm}}{\setlength\previewwidth{81.5mm}}
  \geometry{
    paperheight=297mm,
    paperwidth=2\previewwidth+1mm,
    top=1mm,
    bottom=1mm,
    inner=1mm,
    outer=1mm,
    centering,
  }
}{}

%-----------------------------------------------------------------
% 6. COLUMNS & SECTION DEPTH
%-----------------------------------------------------------------
\newtoggle{do-multicol}
\ifnum\myclass@columns=1
\togglefalse{do-multicol}
\else
\toggletrue{do-multicol}
\def\numcolumns{\myclass@columns}
\fi

\RequirePackage{sectsty}
\setcounter{secnumdepth}{\myclass@secnumdepth}
\setcounter{tocdepth}{\myclass@secnumdepth}

%-----------------------------------------------------------------
% 7. TIGHT SPACING
%-----------------------------------------------------------------
\newtoggle{use-small-font}
\togglefalse{use-small-font}

\iftoggle{use-tight}{
  \toggletrue{use-small-font}
  \pagestyle{empty}
  \setlength{\columnsep}{3mm}
  \setlength{\intextsep}{0.2mm}
  \setlength{\textfloatsep}{0.2mm}
  \setlength{\floatsep}{0.2mm}
  \setlength{\parindent}{1mm}
  \setlength{\parskip}{1mm}

  \setlist{itemsep=0mm, topsep=0mm}
  \setlist[itemize]{itemsep=0pt, leftmargin=3mm}
  \setlist[enumerate]{itemsep=0pt, leftmargin=4mm}
  \setlength{\jot}{.2mm}

  \renewcommand{\section}{\@startsection{section}{1}{\z@}
    {.5mm}
    {.5mm}
  {\normalfont\normalsize\bfseries}}
  \renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}
    {.25mm}
    {.25mm}
  {\normalfont\small\bfseries}}
  \renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}
    {.15mm}
    {.15mm}
  {\normalfont\footnotesize\bfseries}}
}{}

%-----------------------------------------------------------------
% 8. CHAPTER COMMAND (Improved robustness)
%-----------------------------------------------------------------
\newcounter{Chapcounter}
\newcommand\showmycounter{\addtocounter{Chapcounter}{1}\themycounter}

\newcommand{\chapter}[1]{
  \refstepcounter{Chapcounter}
  \par\noindent\textbf{\iftoggle{use-tight}{\large}{\Large} #1}\par
  \addcontentsline{toc}{section}{#1}
}

%-----------------------------------------------------------------
% 9. DATE, COLORS & BOXES
%-----------------------------------------------------------------
\RequirePackage[ddmmyyyy]{datetime}
\renewcommand{\dateseparator}{.}

\RequirePackage{soul}
\sethlcolor{BrickRed}
\definecolor{hltext}{rgb}{256,256,256}
\newcommand{\ssthl}[1]{\textbf{\textcolor{hltext}{\hl{ #1 }}}}

\colorlet{default-box-color}{RoyalBlue}

\newtcolorbox{sstTitleBox}[2][default-box-color]{
  colframe=#1,
  colback=#1!20,
  bottom=0pt,
  left=0pt,
  right=0pt,
  top=2pt,
  title=\center\textbf{\large #2},
}
\newtcolorbox{sstOnlyFrame}[1][default-box-color]{
  colframe=#1,
  colback=white,
  left=0pt,
  bottom=0pt,
  right=0pt,
  top=0pt,
  arc=0mm,
  boxrule=.25mm,
}
\newtcolorbox{sstFullFrame}[1][default-box-color]{
  colframe=#1,
  colback=#1,
  left=0pt,
  bottom=0pt,
  right=0pt,
  top=0pt,
  arc=0mm,
  boxrule=.25mm,
}
\newtoggle{blackout}
\togglefalse{blackout}

\NewEnviron{BlackBox}{
  \iftoggle{blackout}{
    % hide content
  }{
    \BODY % show content
}}
%-----------------------------------------------------------------
% 11. MATH THEOREMS
%-----------------------------------------------------------------
\RequirePackage{amsthm}
\theoremstyle{definition}
\newtheorem{definition}{Definition}
\newtheorem{theorem}{Theorem}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{remark}{Remark}
\newtheorem{lemma}{Lemma}

\DeclareMathOperator{\argmin}{argmin}
\DeclareMathOperator{\dom}{dom}
\DeclareMathOperator{\trace}{trace}
\DeclareMathOperator{\pre}{pre}

