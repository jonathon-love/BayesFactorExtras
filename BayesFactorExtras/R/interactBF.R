##' Creates interactive HTML BayesFactor and views with default viewer
##' 
##' Creates interactive HTML BayesFactor and views with default viewer
##' @title View interactive BayesFactor object
##' @param BFObj BayesFactor object
##' @return This function returns the html file name and path
##' @importFrom rmarkdown render
##' @import methods
##' @export
##' @keywords misc
##' @author Richard D. Morey (\email{richarddmorey@@gmail.com})
##' @examples 
##' 
##' ## Create a BayesFactor analysis
##' data(puzzles)
##' bf = anovaBF(RT ~ shape*color + ID, data = puzzles, whichRandom = "ID", 
##'     progress=FALSE)
##' \dontrun{    
##' ## Open browser with interactive BayesFactor analysis    
##' interactBF(bf)
##' }

interactBF = function(BFObj)
{
  tf = tempfile(fileext=".html")
  kf = system.file("etc", "Rmd", "viewBFObj.Rmd", package = "BayesFactorExtras")

  rmarkdown::render(kf, output_file = tf, quiet = TRUE)
  
  viewer <- getOption("viewer")
  if (!is.null(viewer))
    viewer(tf)
  else
    browseURL(tf)
  
  invisible(tf)
}
