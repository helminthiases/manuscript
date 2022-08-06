
<br>

Development Notes

<br>


### Bookdown

Document creation is via

> * ``bookdown::render_book()`` 
> 
> * ``bookdown::render_book(input = 'R', output_file = 'manuscript.pdf', output_dir = '../', output_yaml = 'R/_output.yml')``

References:
* [_bookdown.yml configuration](https://bookdown.org/yihui/bookdown/configuration.html)
* [_output.yml configuration](https://github.com/rstudio/bookdown/blob/main/inst/examples/_output.yml)
* [Texts](https://bookdown.org/yihui/rmarkdown/books.html)
* [Authoring Books and Technical Documents with R Markdown](https://bookdown.org/yihui/bookdown/)

<br>
<br>

### Independent Development Environment

* Edit the help file skeletons in 'man', possibly combining help files
  for multiple functions.
* Edit the exports in 'NAMESPACE', and add necessary imports.
* Put any C/C++/Fortran code in 'src'.
* If you have compiled code, add a useDynLib() directive to
  'NAMESPACE'.
* Run R CMD build to build the package tarball.
* Run R CMD check to check the package tarball.

Read "Writing R Extensions" for more information.


<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>
