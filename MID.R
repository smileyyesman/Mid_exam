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


##Q2
a[, lapply(.SD, function(x){c(mean = mean(x), sd = sd(x))}), keyby = .(EXMD_BZ_YYYY), .SDcols = c("WSTC", "BMI")]

##Q3
p <- ggboxplot(data = a, x = "EXMD_BZ_YYYY", y = "FBS")

plot_file <- read_pptx() %>% 
  add_slide %>% 
  ph_with(dml(ggobj = p), location = ph_location_type(type = "body"))
print(plot_file, target = "plot_file.pptx")
