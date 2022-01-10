library(purrr)
initializeShinyApp = function(dest = './', theme = "SALURBAL"){
  
  ## 1. Setup folders
  c("CSS","HTML","www","R","R/Modules") %>% map(~dir.create(paste0(dest,.x)))
  
  
  ## 2. Get endpoints
  endpoints = c("app.R", "CSS/Header.css", "CSS/Home.css", "CSS/NavbarPage.css", 
                "HTML/FontAwesomeLoader.html", "HTML/Footer.html", "HTML/Header.html", 
                "HTML/Home.html", "R/Modules/OldFaithful.R", "www/favicon.ico", 
                "www/LAC_logo.png", "www/SALURBAL_logo1.jpg", "www/UHC_logo.png")  
  
  
  ## 3. Download template
  baseURL=paste0("https://raw.githubusercontent.com/Drexel-UHC/shinyUHC/main/Templates/",theme,"/")
  endpoints %>% map(~download.file(url = paste0(baseURL,.x),
                                  destfile = paste0(dest,.x)))
  
} 