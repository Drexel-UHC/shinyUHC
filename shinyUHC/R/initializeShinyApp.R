#' Split a string
#'
#' @param dest the path to initialize your app. By default it is the current directory
#' @param theme which theme do you want: 1) "SALURBAL" or "UHC"
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' initializeShinyApp(dest = "./", theme = "SALURBAL")

initializeShinyApp = function(dest = './', theme = "SALURBAL"){
  # dest = "dest/";theme = "SALURBAL"

  ## 1. Setup folders
  if(!dest%in%c("./",'/',"")){dir.create(dest)}
  purrr::map(c("CSS","HTML","www","R","R/Modules"),~dir.create(paste0(dest,.x)))


  ## 2. Get endpoints
  endpoints = c("app.R", "CSS/Header.css", "CSS/Home.css", "CSS/NavbarPage.css",
                "HTML/FontAwesomeLoader.html", "HTML/Footer.html", "HTML/Header.html",
                "HTML/Home.html", "R/Modules/OldFaithful.R", "www/favicon.ico",
                "www/LAC_logo.png", "www/SALURBAL_logo1.jpg", "www/UHC_logo.png")


  ## 3. Download template
  baseURL=paste0("https://raw.githubusercontent.com/Drexel-UHC/shinyUHC/main/Templates/",theme,"/")
  purrr::map(endpoints,~download.file(url = paste0(baseURL,.x),
                                      destfile = paste0(dest,.x), mode = 'wb'))

}
