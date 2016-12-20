#Read the dataset file
InFile<-read.csv(file="C:/Users/VeluswamyS/Documents/GitHub/DATASET/cities_r2.csv",header = TRUE, strip.white = TRUE,sep = ",")
names(InFile)
#check the rows with missing values
sum(is.na(InFile))
#remove rows with missing values
InFile<-na.omit(InFile)
#check the rows with missing 
sum(is.na(InFile))
#clean up junk characters
class(InFile$population_total)
population_total<-as.character(InFile$population_total)
class(population_total)
population_total<-sub("*","",InFile)
InFile$population_total<-as.integer(InFile$population_total)
