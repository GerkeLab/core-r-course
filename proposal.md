Data processing with R: Enhancing efficiency and reproducibility in data queries and provisioning
=================================================================================================

Course Objectives 
-----------------

This course will develop core proficiencies in data processing in the R
programming language. Through a series of 8 interactive weekly sessions
and 4 bi-weekly follow-up sessions, the Collaborative Data Services Core
team will learn to:

-   Import data from varying formats (CSV, Excel, SAS, txt) into
    RStudio.

-   Perform common data transformation steps in R, including
    manipulating, processing, cleaning, de-identifying, and merging data
    sources.

-   Output data in flexible formats (CSV, Excel, SAS, txt, etc.), as
    required by CDS clients from R/RStudio.

-   Save and document data processing steps as an R script that can be
    repeated or modified later.

These objectives will be tailored and refined prior to the course
offering through conversations with the CDS Core team about their
requirements and current workflows.

### Additional Goals

Additional goals dependent on the needs of CDS Core and the scope of
previous projects chosen by the team to serve as exemplary challenges.

-   Visualize data using ggplot2

-   String manipulation via stringr with regular expressions

-   Interacting with databases using dbplyr

-   Documenting data analyses and process with R Markdown

-   Version control with git

### Long-term Goals

Looking forward (e.g. once core R proficiencies are incorporated into
routine practice), a needs assessment could identify whether the
following further goals would be useful in a follow-up series:

-   Organizing and collecting functions for common CDS data actions,
    processes and interface interactions into an R Package

-   Advanced topics in data manipulation:
    -   Principles of functional programming
    -   List and Map/Reduce operations with purrr

Overall Structure
-----------------

The overall structure of the course will take the form of 8 weekly \~2
hour sessions. Each session will be structured to support a core CDS
learning goal drawn from previously completed projects with the
intention of having participants leave the session having learned a new
core skill that can be applied to CDS workflows. At each additional
session we will build on the skills learned in the previous session,
increasing at each session the breadth of tasks that can be
accomplished.

Overall, the first 2-4 sessions will be designed to be focused on
getting to "productive" as quickly as possible, relative to the goals
and requirements of CDS workflows. These sessions will about 70%
presentation and 30% "try-it-yourself" interactive examples. Rather than
focus on teaching discrete units -- e.g. data types; subsetting; control
structures -- concepts will be introduced "just-in-time" for the session
goals. As the complexity of the targeted outcome skill grows, the level
of the concepts explored can increase to include more difficult or
comprehensive tasks.

After the initial learning period (8 sessions), the course will shift to
more informal "workgroup" sessions centered around recent applications
of R programming to actual CDS queries. These 4 bi-weekly follow-up
sessions will be used to help troubleshoot problems or issues that arise
while integrating R into CDS tasks. A goal in the design of this course
is that, after each initial session, the participants will be able to
use RStudio and R tools to fully replace at least one critical task.
Along the way, participants will be able to recognize areas where R can
generally be applied to streamline their daily tasks and these
observations can be used to guide later content in conjunction with the
list of topics in the [additional goals section](#additional-goals) above.

From a technical perspective, the course will feature modern R packages
and tools, namely **RStudio** and the **tidyverse** packages and
programming styles, in favor of base R methods. Fundamental concepts
from base R will be included as needed, but the course will favor
productive data engineering over technical completeness.

Example Session
---------------

### Session 1

-   Setup basics
    -   Installing R, RStudio, basic packages
    -   [RStudio](https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf)
    -   Using RStudio Projects

-   Crash Course in R Syntax
    -   `library(``)` and `pkg``::function()`
    -   Working directories
    -   Assignment operator `<-`
    -   Function syntax
    -   Atomic data structure basics: logical, integer, double,
        character, factor
    -   Missing types: `NA` and `NULL`

-   Data basics
    -   Easy data import via RStudio + `readr` and `readxl`
    -   Import a typical TransMed export
    
-   Data manipulation
    -   Pipe operator
    -   Basic Single Table Dplyr Verbs
        -   `filter(``)`, `arrange()`, `select()`, `rename()`,
            `mutate()`
        -   https://dplyr.tidyverse.org/

-   Project
    -   Merge the knowledge gained around TransMed exports/imports in
        the "Data basics" portion with basic verbs from the "Data
        manipulation" section to reproduce a simple CDS query (e.g. one
        that the team previously completed and was scored 1 or 2 in
        difficulty).

### Further Session Topics

- Setup basics
  - Installing R, RStudio, basic packages
  - [RStudio](https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf)
  - Using RStudio Projects
- Crash Course in R Syntax
  - `library()` and `pkg::function()`
  - Working directories
  - Assignment operator `<-`
  - Function syntax
  - Atomic data structure basics: logical, integer, double, character, factor
  - Missing types: `NA` and `NULL`
- Data basics
  - Meet `mpg` and `flights`
  - Easy data import via RStudio + `readr` and `readxl`
- Visualization basics
  - Basic ggplot2
  - `ggplot() + geom_point()`
  - Mapping data to vis elements: `aes()`
  - `+ geom_<GEOM>()`
    - `geom_point()`
    - `geom_line()`
    - `geom_smooth()`
  - `+ facet_wrap()`
- Data Manipulation
  - Pipe operator (maybe keep until session 2)
  - Basic Single Table Dplyr Verbs
    - `filter()`, `arrange()`, `select()`, `rename()`, `mutate()`
    - https://dplyr.tidyverse.org/
- Pipe Operator
- More Single-Table Data Manipulation
  - `select()` helpers
  - more `mutate()`
  - `summarize()`, `count()`, `sample_n()`, `sample_frac()`, `top_n()`
  - Groups: `group_by()` + `summarize()`, `count()`, `mutate()`
  - Mutate vs select semantics
    - e.g. `select(flights, year:dep_time)` vs `mutate(df, "year", 2)`
- Tidy Data
  - What is tidy data?
  - How to get to tidy data with tidyr: `spread()` and `gather()`
  - Resources
    - <http://vita.had.co.nz/papers/tidy-data.pdf>
    - <http://vita.had.co.nz/papers/tidy-data-pres.pdf>
    - <http://r4ds.had.co.nz/tidy-data.html#tidy-data-1>
