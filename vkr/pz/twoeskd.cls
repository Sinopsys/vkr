%% Copyright 2004 Vjacheslav A. Fyodorov

\NeedsTeXFormat{LaTeX2e} \ProvidesClass{twoeskd}[2004/10/12 a4 eskd
format (V.Fyodorov@tltsu.ru)]

\newif\ifeskd@twoside
\eskd@twosidefalse

\newif\ifeskd@title
\eskd@titlefalse

\newcommand{\eskdheight}{300}
\newcommand{\eskdencoding}{utf8}
\newcommand{\eskdyear}{\number\year}

\newcommand{\eskd@thin}{0.2}
\newcommand{\eskd@half@thin}{0.1}

\newcommand{\eskd@thick}{0.4}
\newcommand{\eskd@half@thick}{0.2}

\RequirePackage{keyval}

\define@key{eskd}{height}{\renewcommand{\eskdheight}{#1}}
\define@key{eskd}{encoding}{\renewcommand{\eskdencoding}{#1}}
\define@key{eskd}{year}{\renewcommand{\eskdyear}{#1}}

\DeclareOption{title}{\eskd@titletrue}

\DeclareOption{twoside}{%
  \eskd@twosidetrue
  \PassOptionsToClass{\CurrentOption}{article}
  \PassOptionsToPackage{twosideshift=0pt}{geometry}
  }

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption*{\edef\@tempa{%
    \noexpand\setkeys{eskd}{\CurrentOption}}\@tempa}

\ProcessOptions\relax

\LoadClass[a4paper]{article}

\RequirePackage[utf8,\eskdencoding]{inputenc}
\RequirePackage[russian]{babel}
\RequirePackage[T2A]{fontenc}
\RequirePackage{rotating}
\RequirePackage{lastpage}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{pbox}

\RequirePackage{pscyr}
\renewcommand{\rmdefault}{ftm}

\RequirePackage[left=24mm,right=11mm,top=16mm,footskip=25pt,headsep=10pt]{geometry}

\newcommand{\set@eskd@bottom}[1]{%
  \setlength{\textheight}{\eskdheight mm}
  \addtolength{\textheight}{-#1}
  \addtolength{\textheight}{5 mm}
  }


\newsavebox{\eskd@vertical}

\newcommand{\make@eskd@vertical}{}


\newsavebox{\eskd@horizontal}

\newcommand{\hh}{20} % convenience variable height
\newcommand{\hw}{160} % convenience variable width
% left and right borders
\newcommand{\myleft}{-10} % convenience variable width

\newcommand{\make@eskd@horizontal}{%
  \savebox{\eskd@horizontal}(0,0){
    }}




\newcommand{\make@eskd@myhoriz@style}{%
  \newsavebox{\eskd@myhoriz@signature}
  \savebox{\eskd@myhoriz@signature}{{\inputencoding{\eskdencoding}\scriptsize{\eskd@typeid}}}
  \setlength{\headheight}{30.2pt}
  \fancypagestyle{myhorizontaltable}{%
  % clear the old headers. Otherwise they will overlap when switching styles
  \fancyhf{}
  \fancyhead[L]{%
    \unitlength 1mm%
    \begin{picture}(0,0)(3,-6)
      \put(10,-\eskdheight){%
          \begin{picture}(0,0)
            \usebox{\eskd@horizontal}
            \put(28,8){\makebox(0,0)[r]{\usebox{\eskd@myhoriz@signature}}}
          \end{picture}%
      }
    \end{picture}
    }
  \fancyhead[C]{\large{\bfseries\thepage \\ \textbf{\eskd@typeid}}}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  }
}


\newcommand{\make@eskd@myvert@style}{%
}


\newcommand{\eskdListOfChanges}{
}



\newcommand{\make@eskd@title@style}{%
  \newsavebox{\eskd@agr}
  \savebox{\eskd@agr}{\usefont{T2A}{ftm}{b}{n}\Large Согласовано}
  \newsavebox{\eskd@appr}
  \savebox{\eskd@appr}{\usefont{T2A}{ftm}{b}{n}\Large Утверждаю}
  \fancypagestyle{mytitle}{%
    \fancyhf{}
    \fancyhead[L]{%
      \unitlength 1mm%
      \begin{picture}(0,0)(-3,-15)
        \put(0,-\eskdheight){\usebox{\eskd@vertical}}
      \end{picture}
      }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}}
  }

\newcommand{\eskd@title@i}{}
\newcommand{\titleTop}[1]{\renewcommand{\eskd@title@i}{#1}}

\newcommand{\eskd@title@iv}{}
\newcommand{\titleName}[1]{\renewcommand{\eskd@title@iv}{#1}}

% When the title is name of project, then subname is name of current document
\newcommand{\eskd@title@subiv}{}
\newcommand{\titleSubname}[1]{\renewcommand{\eskd@title@subiv}{#1}}

% Will put your work type id ("RU.17701729.509000 ТЗ 01-1-ЛУ") into all tables and on title page
\newcommand{\eskd@typeid}{}
\newcommand{\workTypeId}[1]{\renewcommand{\eskd@typeid}{#1}}

\newcommand{\eskd@title@vi}{
% ЛИСТ УТВЕРЖДЕНИЯ \\%
% \medskip%
\eskd@typeid
}
\newcommand{\titleSignature}[1]{\renewcommand{\eskd@title@vi}{#1}}

\newcommand{\eskd@title@bottom}{\eskdyear}
\newcommand{\titleBottom}[1]{\renewcommand{\eskd@title@bottom}{#1}}

\newcommand{\eskd@title@iii@right@position}{}
\newcommand{\eskd@title@iii@right@name}{}
\newcommand{\titleApprovedBy}[2]{%
  \renewcommand{\eskd@title@iii@right@position}{#1}
  \renewcommand{\eskd@title@iii@right@name}{#2}
  }

\newcommand{\eskd@title@iii@left@position}{}
\newcommand{\eskd@title@iii@left@name}{}
\newcommand{\titleAgreedBy}[2]{%
  \renewcommand{\eskd@title@iii@left@position}{#1}
  \renewcommand{\eskd@title@iii@left@name}{#2}
  }

\xdef\eskd@author@list{}
\newcommand{\titleDesignedBy}[2]{%
  \xdef\eskd@author@list{\eskd@author@list#1\par\vrule
    depth 0.8pt height -0.4pt width31mm~#2\par
    ''\vrule depth 0.8pt height -0.4pt width8mm''\vrule
    depth 0.8pt height -0.4pt width20mm\ \eskdyear\ \cyrg\par\vskip 3mm}
  }

\newcommand{\tfIII}{\hyphenpenalty=10000 %
  \begin{tabular}{@{\hspace{5mm}}p{80mm}@{\hspace{10mm}}p{80mm}}%
    % add titles Согласовано and Утверждено
    \hspace{15mm}\usebox{\eskd@agr} &%
    \hspace{15mm}\usebox{\eskd@appr} \\[3mm]
    % add what positions they are holding
    \eskd@title@iii@left@position &%
    \eskd@title@iii@right@position \\[3mm]
    % Write the long dashes and names
    \rule[-1mm]{31mm}{0.4pt}~ \eskd@title@iii@left@name  &%
    \hspace{5mm}\rule[-1mm]{31mm}{0.4pt}~ \eskd@title@iii@right@name \\[3mm]
    % Write the small dashes
    \hspace{9mm}''\rule[-1mm]{8mm}{0.4pt}''\rule[-1mm]{20mm}{0.4pt} \eskdyear\ \cyrg &%
    \hspace{13mm}''\rule[-1mm]{8mm}{0.4pt}''\rule[-1mm]{20mm}{0.4pt} \eskdyear\ \cyrg
  \end{tabular}
  }

\renewcommand{\maketitle}{}
\newcommand{\eskd@maketitle}{%
    \thispagestyle{mytitle}
    \set@eskd@bottom{55mm}
    \usefont{T2A}{ftm}{m}{n}
    \large
    \vspace*{1mm}
    \begin{center}
        \bfseries\Large
        \eskd@title@i
    \end{center}
    \vfill
    \centerline{\raisebox{0mm}[0mm][0mm]{\tfIII}}
    \vfill
    \begin{center}
        {\bfseries\Large
            \eskd@title@iv}\mbox{}\\[3mm]
            {\large\eskd@title@subiv}\\[3mm]
            {\large\eskd@title@vi}\\[3mm]
        \end{center}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        \vfill
        \unitlength\textwidth\begin{picture}(0,0)
            \put(0,0){\makebox(0,0)[l]{\hyphenpenalty=10000 %
                 \begin{tabular}{@{\hspace{20mm}}p{80mm}@{\hspace{10mm}}p{80mm}}
                     & {\raggedright \eskd@author@list}\\
                 \end{tabular}
            }}
        \end{picture}
        \vfill\vfill
        \begin{center}
            \eskd@title@bottom
        \end{center}
        \newpage
}


\newcommand{\make@eskd@second@style}{
  }


% small command just for convenience
\newcommand{\eskd@totalpages}{}

\newcommand{\eskd@makesecond}{
}

\RequirePackage{etoolbox}
\AfterEndPreamble{%

  \make@eskd@vertical
  \make@eskd@horizontal

  \make@eskd@myvert@style
  \make@eskd@myhoriz@style
  % style for the second page
  \make@eskd@second@style
  % style for title page
  \make@eskd@title@style

  \set@eskd@bottom{15mm}
  \eskd@maketitle
  \set@eskd@bottom{55mm}
  \eskd@makesecond

  \pagestyle{myhorizontaltable}

  \relax
}
