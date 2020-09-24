---
title: "Extra Tutorial: R Markdown"
author: "Semuhi Sinanoglu"
date: "September 2020"
header-includes:
  - \usepackage{placeins}
  - \usepackage{ragged2e}
output:                                 #This part here is where you can re-format the document.
  pdf_document: default
urlcolor: blue
---



# Q1

## Answer to 1.1 (subheading)


```r
#eval: to run the code or not
#you can suppress the results of this chunk or show it as it is, or you write 'hide'
#you can hide the code in your final output through echo
#suppress messages automatically displayed when you run a code like acknowledgements

schools <- expand.grid(status=c("Public", "Private"), 
                       funding=seq(1500, 2000, by=100), 
                       teacher=c(seq(5,15,by=5),NA)) 

mean(schools$teacher, na.rm = TRUE)
```

# Q2

You can drop your comments here. For a new line:\

You can write mathematical equations like this: $20 \geq \alpha \geq 76$.\
You can make **things bold** or *italic*.

For hyperlinks: [R project](https://www.r-project.org/)

If you want to leave some larger gap:

$~$

You can itemize:

-   Like this...
-   And this...
-   and goes on...

Another kind of listing:

1. Coding is fun.
2. Yes, I mean it.
3. Hang in there!

# Q3

## How to create a table

There are different ways in which you can create tables. If you want to create a table of an existing dataset, use the kable function.

I will not show you all the details, but you can put multiple tables side by side. Literally change anything with the outlook of your table with kable and kableExtra packages.

\begin{table}[!h]

\caption{\label{tab:table}Minimum wage dataset}
\centering
\fontsize{10}{12}\selectfont
\begin{tabular}[t]{lccccccc}
\toprule
chain & location & wageBefore & wageAfter & fullBefore & fullAfter & partBefore & partAfter\\
\midrule
\cellcolor{gray!6}{wendys} & \cellcolor{gray!6}{PA} & \cellcolor{gray!6}{5.00} & \cellcolor{gray!6}{5.25} & \cellcolor{gray!6}{20.0} & \cellcolor{gray!6}{0} & \cellcolor{gray!6}{20} & \cellcolor{gray!6}{36}\\
wendys & PA & 5.50 & 4.75 & 6.0 & 28 & 26 & 3\\
\cellcolor{gray!6}{burgerking} & \cellcolor{gray!6}{PA} & \cellcolor{gray!6}{5.00} & \cellcolor{gray!6}{4.75} & \cellcolor{gray!6}{50.0} & \cellcolor{gray!6}{15} & \cellcolor{gray!6}{35} & \cellcolor{gray!6}{18}\\
burgerking & PA & 5.00 & 5.00 & 10.0 & 26 & 17 & 9\\
\cellcolor{gray!6}{kfc} & \cellcolor{gray!6}{PA} & \cellcolor{gray!6}{5.25} & \cellcolor{gray!6}{5.00} & \cellcolor{gray!6}{2.0} & \cellcolor{gray!6}{3} & \cellcolor{gray!6}{8} & \cellcolor{gray!6}{12}\\
\addlinespace
kfc & PA & 5.00 & 5.00 & 2.0 & 2 & 10 & 9\\
\cellcolor{gray!6}{roys} & \cellcolor{gray!6}{PA} & \cellcolor{gray!6}{5.00} & \cellcolor{gray!6}{4.75} & \cellcolor{gray!6}{2.5} & \cellcolor{gray!6}{1} & \cellcolor{gray!6}{20} & \cellcolor{gray!6}{25}\\
burgerking & PA & 5.00 & 5.00 & 40.0 & 9 & 30 & 32\\
\cellcolor{gray!6}{burgerking} & \cellcolor{gray!6}{PA} & \cellcolor{gray!6}{5.00} & \cellcolor{gray!6}{4.50} & \cellcolor{gray!6}{8.0} & \cellcolor{gray!6}{7} & \cellcolor{gray!6}{27} & \cellcolor{gray!6}{39}\\
burgerking & PA & 5.50 & 4.75 & 10.5 & 18 & 30 & 10\\
\bottomrule
\end{tabular}
\end{table}

\newpage


 Name                 Description
 -------------------- ---------------------------------------------------------------------------------
 `election_id`        Unique identifier for each election
 `country`            
 `year`               
 `party_name`         Name of the political party translated to English
 `vote_share`         Votes for the party as a percentage of total cast
 `seats`              The number of seats the party won
 `seats_total`        Total seats obtained in an election (for all parties)
 `left_right`         Average left-right ideology from a variety of sources (higher = more right)
 `state_market`       Average economic left-right score from two sources (higher = more right)
 `liberty_authority`  Average social left-right score from two sources (higher = more right)
 `party_family`        Party family 
 `halfdecade`         Five-year intervals to make aggregation easier


| **Date**  | **Cases** |
|-----------|-----------|
| 30/8/2020 |   371     |
| 29/8/2020 |   350     |
| 28/8/2020 |   300     |
| 27/8/2020 |   267     |
| 26/8/2020 |   226     |
| 25/8/2020 |   192     |
| 24/8/2020 |   174     |
\centering
**Table: COVID cases in Toronto**
\justify

You can set figure width and height:
\FloatBarrier

```r
plot(density(rnorm(1000)), main = "1000 Draws from a Standard Normal")
```



\begin{center}\includegraphics{extra-tutorial-markdown_files/figure-latex/unnamed-chunk-1-1} \end{center}
