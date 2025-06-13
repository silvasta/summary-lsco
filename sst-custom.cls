%-----------------------------------------------------------------
\ProvidesClass{sst-custom}
%-----------------------------------------------------------------
% Take options from higher class
% probably not needed
% \DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{article}}
% \DeclareOption{twoside}{\PassOptionsToClass{twoside}{article}}
% \DeclareOption{landscape}{\PassOptionsToClass{landscape}{article}}
% \ProcessOptions\relax
%-----------------------------------------------------------------
\LoadClass{article}
%-----------------------------------------------------------------
% General packages
%-----------------------------------------------------------------
\RequirePackage[ddmmyyyy]{datetime}
\renewcommand{\dateseparator}{.}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{multicol}
\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[explicit]{titlesec}
\RequirePackage{siunitx}
\RequirePackage{amsmath, amssymb}
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
\RequirePackage{tcolorbox}
\RequirePackage{pgffor}
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
% Geometry and other settings based on layout
%-----------------------------------------------------------------
% REGULAR
%-----------------------------------------------------------------
\ifdefstring{\myclass@layout}{regular}{
	\RequirePackage[
		paperheight=297mm,
		paperwidth=210mm,
		top=19mm,
		bottom=19mm,
		footskip=5mm,
		inner=19mm,
		outer=19mm,
		centering
	]{geometry}
	%-----------------------------------------------------------------
	\setlength{\columnsep}{19mm}
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
	\setlength{\columnsep}{3mm}
	%-----------------------------------------------------------------
	\setlength{\intextsep}{0.2mm} % Space above/below in text
	\setlength{\textfloatsep}{0.2mm} % Space between floats
	\setlength{\floatsep}{0.2mm} % Space between floats
	% %-----------------------------------------------------------------
	\setlist{itemsep=0mm, topsep=0mm} % For all itemize/enumerate
	\setlist[itemize]{itemsep=0pt, leftmargin=3mm}
	\setlist[enumerate]{itemsep=0pt, leftmargin=4mm}
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
\usepackage[ngerman]{babel}
% \babelfont{rm}{Lato}
% \babelfont{rm}{Roboto}
\babelfont{rm}{Roboto Condensed}
% \babelprovide[onchar=ids fonts]{russian}
% \babelfont[russian]{rm}{Roboto Condensed}
\babelprovide{english}
%-----------------------------------------------------------------
% font of math
% \usepackage{lmodern} # default
% \usepackage{newtxmath}
% \usepackage{mathpazo}
%-----------------------------------------------------------------
% Custom commands
%-----------------------------------------------------------------
\newcommand{\trans}{\textnormal{\scriptsize T}}
%-----------------------------------------------------------------
% Theorem styles
%-----------------------------------------------------------------
\RequirePackage{amsthm}
\theoremstyle{definition}
\newtheorem{definition}{Definition}
\newtheorem{theorem}{Theorem}
\newtheorem{proposition}{Proposition}
%-----------------------------------------------------------------
% Other formatting
%-----------------------------------------------------------------
\setlength{\parindent}{0mm}
\setlength{\parskip}{0mm}
%-----------------------------------------------------------------
% Section depth
%-----------------------------------------------------------------
\RequirePackage{sectsty}
\setcounter{secnumdepth}{1}
