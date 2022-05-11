#' Initialize a themed shiny app
#'
#' @param dest the path to initialize your app. Important: you should not specify the file name, just the directory.
#' './folder/app.R' is wrong. './folder/' is correct. A folder will be created with an app.R file already initialized!
#' @param theme which theme do you want: Two options are available "UHC" or "SALURBAL"
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' initializeShinyApp(dest = "./", theme = "SALURBAL")

initializeShinyApp = function(dest = './', theme = "SALURBAL"){
  # theme = "SALURBAL"
  # dest = ""
  # dest = "dest";
  # dest = 'app'
  # dest = './app/'
  # dest = 'apps/app'

  ## 0. Format directories
  dest_search = ifelse( stringr::str_sub(dest,1,1)=='.',stringr::str_sub(dest,3,-1L),dest)
  dest_search = ifelse(stringr::str_sub(dest_search,-1L)=='/',stringr::str_sub(dest_search,1,-1L-1),dest_search)
  dest_output = ifelse(dest_search=="","",paste0(dest_search,"/"))

  ## 1. Check if output exists. If it does then throw an error
  if (file.exists(dest_search)) stop('Output directory already exists, please choose a new directory.')
  if (dest_search==""&file.exists('app.R'))  stop('Output directory already exists, please choose a new directory.')

  ## 2. Setup folders
  if (!dest%in%c("./",'/',"")) {dir.create(dest_search, recursive = TRUE)}
  purrr::map(c("CSS","HTML","www","R","R/Modules"),~dir.create(paste0(dest_output,.x), recursive = TRUE,showWarnings=F))


  ## 3. Get endpoints
  endpoints_SALURBAL = list(c("app.R", "CSS/Header.css", "CSS/Home.css", "CSS/NavbarPage.css",
                              "HTML/FontAwesomeLoader.html", "HTML/Footer.html", "HTML/Header.html",
                              "HTML/Home.html", "R/Modules/OldFaithful.R", "www/favicon.ico",
                              "www/LAC_logo.png", "www/SALURBAL_logo1.jpg", "www/UHC_logo.png"))
  endpoints_UHC = list(c("app.R", "CSS/Header.css", "CSS/Home.css", "CSS/NavbarPage.css",
                         "HTML/FontAwesomeLoader.html", "HTML/Footer.html", "HTML/Header.html",
                         "HTML/Home.html", "R/Modules/OldFaithful.R",
                         "www/favicon.ico","www/logo.png"))
  endpoints = unlist(ifelse(theme=="SALURBAL",endpoints_SALURBAL,endpoints_UHC))

  ## 4. Download template
  baseURL=paste0("https://raw.githubusercontent.com/Drexel-UHC/shinyUHC/main/Templates/",theme,"/")
  purrr::walk(endpoints,~{
    download.file(url = paste0(baseURL,.x),
                  destfile = paste0(dest_output,.x),
                  mode = 'wb',
                  quiet = T)
  })

  ## 5. Open new app file
  message(paste0("App initialized at ",paste0(getwd(),'/',dest_output,'app.R')))
  message("New app.R has been opened automatically.")
  if(rstudioapi::isAvailable()){rstudioapi::navigateToFile(paste0(dest_output,'app.R'))}
}
