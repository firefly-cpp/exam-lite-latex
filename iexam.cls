\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iexam}[2022/11/17 Latex template for exams]

% include dependencies
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage[skip=10pt plus1pt, indent=40pt]{parskip}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% load class
\LoadClass[a4paper,onecolumn]{article}

% set margins
\addtolength{\oddsidemargin}{-.800in}
\addtolength{\evensidemargin}{-.800in}
\addtolength{\textwidth}{1.75in}
\addtolength{\topmargin}{-.800in}
\addtolength{\textheight}{1.75in}

% set a little indendation for paragraphs
\setlength{\parindent}{0.1em}

% space between paragraphs
\setlength{\parskip}{1em}

% define a command for the logo of institution and exam information
\newcommand{\aboutexam}[1]{
\noindent
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\pagestyle{fancy}
  \fancyhf{}
   % show logo of author's institution on the left side
  \fancyhead[L]{\raisebox{\dimexpr-\height+\baselineskip}[0pt][0pt]{\includegraphics[width=1.75in]{imgs/um-logo.png}}}
  % show exam information on right side
  \fancyhead[R]{\leavevmode\large
  \begin{tabular}[t]{l@{}}
    #1
  \end{tabular}}
\vspace*{3\baselineskip}
}

\newcommand{\question}[1]{\paragraph{\underline{Vpra\v{s}anje {#1}}}\hfill\\\vspace{2mm}\\}