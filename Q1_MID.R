
usethis::use_git_config(user.name = "Geonho Lee", user.email = "capgrah@naver.com")

## setting: permanent storage
credentials::credential_helper_set("manager")                 # Windows
credentials::credential_helper_set("osxkeychain")             # Mac
credentials::credential_helper_set("store")                   # Linux

## create a personal access token for authentication:
usethis::create_github_token() 
## in case usethis version < 2.0.0: usethis::browse_github_token() (or even better: update usethis!)

## copy and paste your token and press enter
credentials::set_github_pat()




library(data.table);library(magrittr);library(ggpubr);library(rvg);library(officer) 
a <- fread("https://raw.githubusercontent.com/jinseob2kim/R-skku-biohrs/main/data/example_g1e.csv")
a
##Q1
var.factor <- names(a)[ c(4: 12)]
var.factor
var.conti <- names(a)[!(names(a) %in% var.factor)]
var.conti

for (v in var.factor){
  a[[v]] <- as.factor(a[[v]])
}

for(v in var.conti){
  a[[v]] <- as.numeric(a[[v]])
}

sapply(a, class)
