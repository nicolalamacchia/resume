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
\RequirePackage[margin=2.5cm,top=2cm,bottom=2cm,footskip=24pt]{geometry}
\RequirePackage{multicol}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{fancyhdr}
\RequirePackage[totpages]{zref}
\RequirePackage{xifthen}
\RequirePackage{enumitem}

%
% internal command

\newcommand*{\namefont}{\crimsonpro}

%
% custom colors (compliant with WCAG AAA)

\definecolor{cvblue}{HTML}{007FAA}
\definecolor{cvgray}{HTML}{575757}
\definecolor{cvlightgray}{HTML}{8296A1}
\definecolor{cvfg}{HTML}{050709}

%
% page settings

\pagestyle{fancy}
\color{cvfg}
\parindent 0pt
\urlstyle{same}

\titleformat{\section}
    {\bfseries\color{cvblue}\uppercase}
    {}{0pt}{}
\titleformat{\subsection}
    {\bfseries}
    {}{0pt}{}

\titlespacing*{\section}{0pt}{2\baselineskip}{\baselineskip}
\titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0.1\baselineskip}

\renewcommand{\baselinestretch}{1.15}

\setlist[itemize]{topsep=0pt,labelindent=\parindent,leftmargin=*}

\hyphenpenalty=750

%
% environments

\newenvironment{cvsection}{}{
    \vspace{1.5\baselineskip}
}

\newenvironment{proxpcontent}{
    \begin{adjustwidth}{1cm}{1.5cm}
    \vspace{0.35\baselineskip}
    \begin{small}
}%
{
    \end{small}
    \end{adjustwidth}
    \vspace{0.2\baselineskip}
}

\newenvironment{languagessection}{
    \vspace{-0.5\baselineskip}
    \begin{cvsection}
    \setlength\extrarowheight{0.5\baselineskip}
    \begin{tabular}{@{}rl}
}{
    \end{tabular}
    \end{cvsection}
    \vspace{-2.5em}
}

\newenvironment{skillssection}{
    \vspace{-0.7\baselineskip}
    \titlespacing*{\subsection}{0pt}{0.5\baselineskip}{0.1\baselineskip}
    \begin{cvsection}
    \begin{multicols}{2}
    \begin{small}
}%
{
    \end{small}
    \end{multicols}
    \end{cvsection}
}

%
% commands

% #1 - First Name + Middle Name(s)
% #2 - Last Name
% #3 - Name Pronounciation
\newcommand*{\name}[3]{%
    \vbox{%
        \hbox{\namefont\fontsize{34}{34}\selectfont #1 #2}
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
}

% #1 - Color
\newcommand{\separator}[1][cvfg]{\textcolor{#1}{\noindent\rule{\linewidth}{0.5pt}}}

% #1 - Summary
\newcommand*{\summary}[1]{%
    \titleformat{\paragraph}{}{}{}{}
    \titlespacing*{\paragraph}{0pt}{1.2\baselineskip}{1.3\baselineskip}

    \paragraph{\small#1}
}

% #1 - Role
% #2 - Company Name
% #3 - Start Date
% #4 - End Date
% #5 - Location
% #6 - Description
\newcommand*{\activity}[6]{%
    \ifthenelse{\equal{#3}{}}
        {}
        {
            \ifthenelse{\equal{#4}{}}
                {\def \tocdates{#3}}
                {\def \tocdates{#3\textendash #4}}
        }
    \ifthenelse{\equal{\tocdates}{}}
        {\def \tocactivity{#1}}
        {\def \tocactivity{\tocdates: #1}
    }

    \def \proxptitle{%
        \bfseries #1
        \small\normalfont
        \ifthenelse{\equal{#2}{}}{}{~at ~\textbf{#2}~~}%
        \ifthenelse{\equal{#5}{}}{}{\textemdash~ #5~~}%
        \ifthenelse{\equal{#3}{}}{}{%
            (%
                #3%
                \ifthenelse{\equal{#4}{}}{}{\textendash #4}%
            )%
        }
    }

    \subsection[\tocactivity]{\proxptitle}

    \ifthenelse{\isempty{#6}}{}{%
        \begin{proxpcontent}
        #6
        \end{proxpcontent}
    }
}

% #1 - Language
% #2 - Proficiency
\newcommand*{\lang}[2]{%
    {\textbf{#1}} & \small#2 \\
}

% #1 - Skill Section Title
% #2 - Skills
\newcommand*{\skills}[2]{%
    \subsection{\small#1}
    \scriptsize#2
}

% #1 - Footnote
\newcommand*{\footerinfo}[1]{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[C]{%
        \ifnum\value{page}=\ztotpages{#1}\fi
    }
}
