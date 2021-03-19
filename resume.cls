% vim: ft=tex

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2021/03/07 A4 Resume class]

\LoadClass[a4paper]{article}

\RequirePackage{titlesec}
\RequirePackage{CrimsonPro}
\RequirePackage[familydefault]{Rosario}
\RequirePackage{changepage}
\RequirePackage{array}
\RequirePackage{ifthen}
\RequirePackage[hidelinks,pdfusetitle]{hyperref}
\RequirePackage[margin=2.5cm,footskip=18pt]{geometry}
\RequirePackage{multicol}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{fancyhdr}

%
% custom colors (compliant with WCAG AAA)

\definecolor{cvblue}{HTML}{007FAA}
\definecolor{cvgray}{HTML}{575757}
\definecolor{cvlightgray}{HTML}{8296A1}
\definecolor{cvfg}{HTML}{050709}

%
% page settings

\color{cvfg}
\pagenumbering{gobble}
\parindent 0pt
\urlstyle{same}

\titleformat{\section}
    {\large\bfseries\color{cvblue}\uppercase}
    {}{0pt}{}
\titleformat{\subsection}
    {\large\bfseries}
    {}{0pt}{}

\titleformat{\paragraph}{}{}{}{}

\titlespacing*{\section}{0pt}{2\baselineskip}{0.2\baselineskip}
\titlespacing*{\subsection}{0pt}{1.5\baselineskip}{0.1\baselineskip}
\titlespacing*{\paragraph}{0pt}{0.5\baselineskip}{0pt}

\renewcommand{\baselinestretch}{1.15}

%
% environments

\newenvironment{sectioncontent}{
    \begin{adjustwidth}{1cm}{2cm}
    \vspace{0.5\baselineskip}
}%
{\end{adjustwidth}}

\newenvironment{cvsection}{
    \vspace{1.3\baselineskip}
    \begin{minipage}{\textwidth}
}%
{\end{minipage}}

\newenvironment{skillssection}{
    \vspace*{0.5\baselineskip}
    \begin{multicols}{2}
}%
{\end{multicols}}

\newenvironment{languagessection}{
    \vspace*{\baselineskip}
    \setlength\extrarowheight{0.5\baselineskip}
    \begin{tabular}{@{}rl}
}{
    \end{tabular}
    \vspace*{0.9\baselineskip}
}

%
% commands

\newcommand{\separator}[1][cvfg]{\textcolor{#1}{\noindent\rule{\linewidth}{0.5pt}}}

% #1 - Summary
\newcommand*{\summary}[1]{%
    \paragraph{}
    #1
}

% #1 - Skill Section Title
% #2 - Skills
\newcommand*{\skills}[2]{%
    \subsection{#1}
    #2
}

% #1 - Language
% #2 - Proficiency
\newcommand*{\lang}[2]{%
    {\large\textbf{#1}} & #2 \\
}

% #1 - Role
% #2 - Company Name
% #3 - Start Date
% #4 - End Date
% #5 - Location
% #6 - Description
\newcommand*{\activity}[6]{%
    \begin{cvsection}
        \titleformat{\subsection}[runin]
            {\large\bfseries}
            {}{0pt}{}[~~]

        \subsection{\large\bfseries #1}%
        \ifthenelse{\equal{#2}{}}{}{at ~\textbf{#2}~~}%
        \ifthenelse{\equal{#5}{}}{}{#5~~}%
        \ifthenelse{\equal{#3}{}}{}{%
            (%
                #3%
                \ifthenelse{\equal{#4}{}}{}{\textendash #4}%
            )%
        }
        \ifthenelse{\equal{#6}{}}{}{%
            \begin{sectioncontent}
            #6
            \end{sectioncontent}
        }
    \end{cvsection}
}

% #1 - First Name + Middle Name(s)
% #2 - Last Name
% #3 - Name Pronounciation
\newcommand*{\name}[3]{%
    \vbox{%
        \hbox{\crimsonpro\fontsize{34}{34}\selectfont #1 #2}
        \vspace*{10pt}
        \hbox{{\textcolor{cvgray}\noindent #3}}
    }
}

% #1 - e-mail
% #2 - Phone Number
% #3 - Website
% #4 - Location
\newcommand*{\contacts}[4]{%
    \vbox{%
        \hbox{%
            \setlength\tabcolsep{3pt}
            \setlength\extrarowheight{0.3pt}
            \begin{small}
                \begin{tabular}[b]{@{}r l@{}}
                    {\textcolor{cvblue}{Email}} & \textbf{\href{mailto:#1}{#1}}\\
                    {\textcolor{cvblue}{Phone}} & \textbf{#2}\\
                    {\textcolor{cvblue}{Website}} & \textbf{\url{#3}}\\
                    {\textcolor{cvblue}{Location}} & \textbf{#4}\\
                \end{tabular}%
            \end{small}%
        }%
    }%
}

% #1 - First Name + Middle Name(s)
% #2 - Last Name
% #3 - Name Pronounciation
% #4 - e-mail
% #5 - Phone Number
% #6 - Website
% #7 - Location
\newcommand*{\heading}[7]{%
    \leavevmode\hbox to \textwidth{%
        \name%
            {#1}%
            {#2}%
            {#3}%
        \hfil%
        \contacts%
            {#4}%
            {#5}%
            {#6}%
            {#7}%
    }
    \vspace*{2pt}
}

\newcommand*{\footerinfo}[1]{%
    \fancypagestyle{sourceinfo}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}\fancyfoot[C]{#1}}
    \pagestyle{sourceinfo}
}

