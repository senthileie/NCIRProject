#Read the dataset file
InFile<-read.csv(file="C:/Users/VeluswamyS/Documents/GitHub/DATASET/cities_r2.csv",header = TRUE, strip.white = TRUE,sep = ",")
#names(InFile)
#check the rows with Junk characters values
InFile=subset(InFile, InFile$population_total!="*")
InFile=subset(InFile, InFile$X0.6_population_total!="*")
#write.csv(InFile,file="TESTFILE2.csv")

#check the rows with missing values
sum(is.na(InFile))
#remove rows with missing values
InFile<-na.omit(InFile)
#check the rows with missing 
sum(is.na(InFile))
#converting factors into intergers
InFile$population_total<-as.integer(InFile$population_total)
InFile$X0.6_population_total<-as.integer(InFile$X0.6_population_total)
InFile$X0.6_population_male<-as.integer(InFile$X0.6_population_male)
write.csv(InFile,file="CleanFile.csv")

