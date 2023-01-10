\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iexam}[2022/11/17 Latex template for exams]

% include dependencies
%-----------------------------------------------------------
\RequirePackage{babel}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage[skip=10pt plus1pt, indent=40pt]{parskip}
\RequirePackage[T1]{fontenc} 
\RequirePackage[utf8]{inputenc}
\RequirePackage{framed}
\RequirePackage{lipsum}
\RequirePackage{datetime}
\RequirePackage{enumerate} % http://ctan.org/pkg/enumerate
\RequirePackage{totcount}

% global class options
%--------------------------------------------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\def\examlanguage#1{\def\@examlanguage{#1}}
\newcommand{\pexamlanguage}{\@examlanguage}

\def\subject#1{\def\@subject{#1}}
\newcommand{\psubject}{\@subject}

\def\academicyear#1{\def\@academicyear{#1}}
\newcommand{\pacademicyear}{\@academicyear}

\def\examdate#1{\def\@examdate{#1}}
\newcommand{\pexamdate}{\@examdate}

\def\programme#1{\def\@programme{#1}}
\newcommand{\pprogramme}{\@programme}

\def\location#1{\def\@location{#1}}
\newcommand{\plocation}{\@location}

\def\examid#1{\def\@examid{#1}}
\newcommand{\pexamid}{\@examid}

\def\subacronym#1{\def\@subacronym{#1}}
\newcommand{\psubacronym}{\@subacronym}

% Name and Surname of the student
\def\namesurname#1{\def\@namesurname{#1}}
\newcommand{\pnamesurname}{\@namesurname}
% ID Student
\def\studentid#1{\def\@studentid{#1}}
\newcommand{\pstudentid}{\@studentid}

\def\examperiod#1{\def\@examperiod{#1}}
\newcommand{\pexamperiod}{\@examperiod}

\def\instructions#1{\def\@instructions{#1}}
\newcommand{\pinstructions}{\@instructions}

\def\questioneng#1{\def\@questioneng{#1}}
\newcommand{\pquestioneng}{\@questioneng}
\questioneng{Question}

\def\questionslo#1{\def\@questionslo{#1}}
\newcommand{\pquestionslo}{\@questionslo}
\questionslo{Vpra\v{s}anje}

\def\questiontext#1{\def\@questiontext{#1}}
\newcommand{\pquestiontext}{\@questiontext}

\def\pointseng#1{\def\@pointseng{#1}}
\newcommand{\ppointseng}{\@pointseng}
\pointseng{point}

\def\pointsslo#1{\def\@pointsslo{#1}}
\newcommand{\ppointsslo}{\@pointsslo}
\pointsslo{to\v{c}k}

\def\pointstext#1{\def\@pointstext{#1}}
\newcommand{\ppointstext}{\@pointstext}


\def\instructionsslo#1{\def\@instructionsslo{#1}}
\newcommand{\pinstructionsslo}{\@instructionsslo}


\instructionsslo{
    \begin{enumerate}
        \item Izpit je sestavljen iz 10 vprašanj.\\
        \item Uporaba kalkulatorja ni dovoljena. \\
        \item Zapišite le tisto, kar zahteva vprašanje. \\
        \item Napačni odgovori ne prinašajo minus točk. \\
    \end{enumerate}
}
   
\def\instructionsang#1{\def\@instructionsang{#1}}
\newcommand{\pinstructionsang}{\@instructionsang}

\instructionsang{
    \begin{enumerate}
        \item The exam consists of 10 questions.\\
        \item The use of a calculator is not allowed.\\
        \item Write only what the question asks for.\\
        \item You do not get minus points for wrong answers.\\
    \end{enumerate}
}

\def\instructionslang#1{\def\@instructionslang{#1}}
\newcommand{\pinstructionslang}{\@instructionslang}

\def\sumpts#1{\def\@sumpts{#1}}
\newcommand{\psumpts}{\@sumpts}

\def\writingtime#1{\def\@writingtime{#1}}
\newcommand{\pwritingtime}{\@writingtime}

\def\writingtimeminutes#1{\def\@writingtimeminutes{#1}}
\newcommand{\pwritingtimeminutes}{\@writingtimeminutes}

\def\grade#1{\def\@grade{#1}}
\newcommand{\pgrade}{\@grade}

% use declared options
%-----------------------------------------------------------

% language of the exam
\DeclareOption{exam}{%
    \def\examtype{1} % 1: izpit-exam, 2: kolokvij-midterm
}
\DeclareOption{midterm}{%
    \def\examtype{2} % 1: izpit-exam, 2: kolokvij-midterm   
}

\def\typeexam#1{\def\@typeexam{#1}}
\newcommand{\ptypeexam}{\@typeexam}

\def\aboutexamheader#1{\def\@aboutexamheader{#1}}
\newcommand{\paboutexamheader}{\@aboutexamheader}

% slovene version
%-----------------------------------------------------------
\DeclareOption{slovene}{%
    \if\examtype1\typeexam{IZPIT}\fi
    \if\examtype2\typeexam{VMESNI IZPIT}\fi
    \if\examtype1\examperiod{Vmesni izpit: }\fi
    \if\examtype2\examperiod{Izpitni rok: }\fi
    \namesurname{Ime in Priimek:}
    \studentid{ID Študenta:}
    \instructions{NAVODILA}
    \instructionslang{\pinstructionsslo}
    \questiontext{\pquestionslo}
    \pointstext{\ppointsslo}
    \sumpts{Število točk: }
    \writingtime{Čas pisanja: }
    \grade{Ocena: }

    % define a command for the logo of institution and exam information
    \newcommand{\aboutexam}[1]{
        \noindent
        \fancyfoot{}
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0pt}
        \pagestyle{fancy}
            \fancyhf{}
            % show logo of author's institution on the left side
            \fancyhead[L]{\raisebox{\dimexpr-\height+\baselineskip}[0pt][0pt]{\includegraphics[width=2.2in]{imgs/um-logo.png}}}
            % show exam information on right side
            \fancyhead[R]{\leavevmode\large
            \begin{tabular}[t]{l@{}}
                #1
            \end{tabular}}
        \vspace*{3\baselineskip}
    }

    \aboutexamheader{\aboutexam{Predmet: \psubject \\
			   Študijsko leto: \pacademicyear \\
			   Študijski program: \pprogramme \\
			   \pexamperiod \pexamid \\
			   Prostor: \plocation \\
			   Datum: \displaydate{examdate}}}
}

% english version
%-----------------------------------------------------------
\DeclareOption{english}{%
    \if\examtype1\typeexam{EXAM}\fi
    \if\examtype2\typeexam{MIDTERM}\fi
    \if\examtype1\examperiod{Exam period: }\fi
    \if\examtype2\examperiod{Midterm: }\fi
    \namesurname{Name and Surname:}
    \studentid{Student ID:}
    \instructions{INSTRUCTIONS}
    \instructionslang{\pinstructionsang}
    \questiontext{\pquestioneng}
    \pointstext{\ppointseng}
    \sumpts{Number of points: }
    \writingtime{Writing time: }
    \grade{Grade: }

    % define a command for the logo of institution and exam information
    \newcommand{\aboutexam}[1]{
        \noindent
        \fancyfoot{}
        \renewcommand{\headrulewidth}{0pt}
        \renewcommand{\footrulewidth}{0pt}
        \pagestyle{fancy}
          \fancyhf{}
           % show logo of author's institution on the left side
          \fancyhead[L]{\raisebox{\dimexpr-\height+\baselineskip}[0pt][0pt]{\includegraphics[width=2.2in]{imgs/logo-um-feri-ang.png}}}
          % show exam information on right side
          \fancyhead[R]{\leavevmode\large
          \begin{tabular}[t]{l@{}}
            #1
          \end{tabular}}
        \vspace*{3\baselineskip}
    }

    \aboutexamheader{\aboutexam{Subject: \psubject \\
			   Study year: \pacademicyear \\
			   Study program: \pprogramme \\
			   \pexamperiod \pexamid \\
			   Place: \plocation \\
			   Date: \displaydate{examdate}}}
}
\newtotcounter{sum_pts}
% process options
%-----------------------------------------------------------
\ProcessOptions\relax
% load class
\LoadClass[a4paper,onecolumn]{article}
%--------------------------------------------------------------------------------------------------------------

% set margins
\addtolength{\oddsidemargin}{-.800in}
\addtolength{\evensidemargin}{-.800in}
\addtolength{\textwidth}{1.75in}
\addtolength{\topmargin}{-.800in}
\addtolength{\textheight}{1.75in}
 \setlength{\headheight}{12.05pt}

% set a little indendation for paragraphs
\setlength{\parindent}{0.1em}

% space between paragraphs
\setlength{\parskip}{1em}


\newcommand{\makefirstpage}{
    \large
    \paboutexamheader
    
    \noindent\makebox[\linewidth]{\rule{0.9\paperwidth}{0.4pt}}
    
    \psumpts\:\:\:\:\:\:\:/\total{sum_pts} \hfill \pwritingtime \pwritingtimeminutes min
    \vspace{-1.2cm}
    \begin{center}\textbf{{\LARGE\ptypeexam}}\end{center}
    \vspace{1cm}
    \pnamesurname\hrulefill
    \vspace{0.5cm}
    
    \pstudentid\hrulefill
    \vspace{0.5cm}

    \pgrade\hrulefill
    \vspace*{4\baselineskip}
    
    \noindent\underline{\pinstructions}
    \vspace{5mm}
    \pinstructionslang
}

% question command - Question i
\newcommand{\qncounter}[1]{\paragraph{\underline{\pquestiontext{ #1}}}\hfill\\\vspace{2mm}\\}

% question command - #1 What is ...? #2 No. pts #3 conjugation #4 vspace in cm
\newcommand{\question}[4]{{\parbox{14cm}{#1}} {\addtocounter{sum_pts}{#2}\hfill(#2~\ppointstext#3)}{\vspace{#4 cm}}}

% alinea command - \item #1 What is ...? #2 No. pts #3 conjugation #4 vspace in cm
\newcommand{\alinea}[4]{\item \!\!)\:{\parbox{12cm}{#1}} {\addtocounter{sum_pts}{#2}\hfill(#2~\ppointstext#3)}{\vspace{#4 cm}}}
