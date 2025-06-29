%-----------------------------------------------------------------
\ProvidesClass{sst-custom}
%-----------------------------------------------------------------
% Take options from higher class
% probably not needed
% \DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{article}}
% \DeclareOption{twoside}{\PassOptionsToClass{twoside}{article}}
\DeclareOption{landscape}{\PassOptionsToClass{landscape}{article}}
\ProcessOptions\relax
%-----------------------------------------------------------------
\LoadClass{article}
%-----------------------------------------------------------------
% General packages
%-----------------------------------------------------------------
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{multicol}
\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[explicit]{titlesec}
\RequirePackage{siunitx}
\RequirePackage{amssymb}
% \RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{subcaption}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[document]{ragged2e}
\RequirePackage{caption} % Reduces space between image and caption
\RequirePackage{atbegshi}
\RequirePackage{calc}
\RequirePackage{booktabs}
\RequirePackage{lipsum}
\RequirePackage{float}
\RequirePackage{parskip}
\RequirePackage{longtable}
% \RequirePackage{tcolorbox}
\RequirePackage{pgffor}
\RequirePackage{csquotes}
%-----------------------------------------------------------------
% Key-Value options
%-----------------------------------------------------------------
\RequirePackage{kvoptions}
\RequirePackage{etoolbox} % For conditional logic
\SetupKeyvalOptions{
	family=myclass,
	prefix=myclass@
}
\DeclareStringOption[regular]{layout} % Default: regular
\DeclareStringOption[1]{columns}      % Default: 1 column
\DeclareStringOption[2]{secnumdepth}      % Default: 1 column
\ProcessKeyvalOptions*
%-----------------------------------------------------------------
% Multicol toggle and settings
%-----------------------------------------------------------------
\newtoggle{do-multicol}
\ifnum\myclass@columns=1
	\togglefalse{do-multicol}
\else
	\toggletrue{do-multicol}
	\def\numcolumns{\myclass@columns}
\fi
%-----------------------------------------------------------------
% Section depth
%-----------------------------------------------------------------
\RequirePackage{sectsty}
\setcounter{secnumdepth}{\myclass@secnumdepth}
%-----------------------------------------------------------------
% Geometry and other settings based on layout
%-----------------------------------------------------------------
% REGULAR
%-----------------------------------------------------------------
\ifdefstring{\myclass@layout}{regular}{
	\RequirePackage[
		paperheight=297mm,
		paperwidth=210mm,
		top=18mm,
		bottom=18mm,
		footskip=10mm,
		inner=18mm,
		outer=18mm,
		centering
	]{geometry}
	%-----------------------------------------------------------------
	\setlength{\columnsep}{11mm}
	%-----------------------------------------------------------------
}{}
%-----------------------------------------------------------------
% TIGHT
%-----------------------------------------------------------------
\ifdefstring{\myclass@layout}{tight}{
	\RequirePackage[
		paperheight=210mm,
		paperwidth=297mm,
		top=1mm,
		bottom=1mm,
		inner=1mm,
		outer=1mm,
		centering
	]{geometry}
	%-----------------------------------------------------------------
	\pagestyle{empty}
	%-----------------------------------------------------------------
	% \setlength{\headsep}{10mm}
	\setlength{\columnsep}{3mm}
	%-----------------------------------------------------------------
	\setlength{\intextsep}{0.2mm} % Space above/below in text
	\setlength{\textfloatsep}{0.2mm} % Space between floats
	\setlength{\floatsep}{0.2mm} % Space between floats
	%-----------------------------------------------------------------
	\setlength{\parindent}{0mm}
	\setlength{\parskip}{0mm}
	%-----------------------------------------------------------------
	\setlist{itemsep=0mm, topsep=0mm} % For all itemize/enumerate
	\setlist[itemize]{itemsep=0pt, leftmargin=3mm}
	\setlist[enumerate]{itemsep=0pt, leftmargin=4mm}
	% -----------------------------------------------------------------
	\setlength{\jot}{0mm}
	% -----------------------------------------------------------------
	% space around title and fontsize
	\makeatletter
	\renewcommand{\section}{\@startsection{section}{1}{\z@}%
		{.5mm}% Space before
		{.5mm}% Space after
		{\normalfont\normalsize\bfseries}}
	\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
		{.25mm}%
		{.25mm}%
		{\normalfont\small\bfseries}}
	\makeatother
	%-----------------------------------------------------------------
	%spacing around eqns --nothing changed
	% \setlength{\abovedisplayskip}{0pt}
	% \setlength{\belowdisplayskip}{0pt}
	% \setlength{\abovedisplayshortskip}{0pt}
	% \setlength{\belowdisplayshortskip}{0pt}
	%-----------------------------------------------------------------
	%changed less, maybe the 2.
	% \setlength{\mathsurround}{0pt} 
	% \setlength{\jot}{0mm}
}{}
%-----------------------------------------------------------------
% PREVIEW
%-----------------------------------------------------------------
\ifdefstring{\myclass@layout}{preview}{
	\RequirePackage[
		paperheight=297mm,
		paperwidth=95mm,
		top=1mm,
		bottom=1mm,
		inner=1mm,
		outer=1mm,
		centering
	]{geometry}
}{}
%-----------------------------------------------------------------
% FONT
%-----------------------------------------------------------------
\usepackage{fontspec}
% \usepackage[ngerman]{babel}
\usepackage[english]{babel}
% \babelfont{rm}{Lato}
% \babelfont{rm}{Roboto}
\babelfont{rm}{Roboto Condensed}
% \babelprovide[onchar=ids fonts]{russian}
% \babelfont[russian]{rm}{Roboto Condensed}
\babelprovide{ngerman}
% \babelprovide{english}
%-----------------------------------------------------------------
% font of math
% \usepackage{lmodern} # default
% \usepackage{newtxmath}
% \usepackage{mathpazo}
\RequirePackage[ddmmyyyy]{datetime}
\renewcommand{\dateseparator}{.}
%-----------------------------------------------------------------
% Custom commands
%-----------------------------------------------------------------
\newcommand{\T}{^\textnormal{\scriptsize T}}
\DeclareMathOperator*{\argmin}{argmin}
%-----------------------------------------------------------------
% Theorem styles
%-----------------------------------------------------------------
\RequirePackage{amsthm}
\theoremstyle{definition}
\newtheorem{definition}{Definition}
\newtheorem{theorem}{Theorem}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{remark}{Remark}
\newtheorem{lemma}{Lemma}

