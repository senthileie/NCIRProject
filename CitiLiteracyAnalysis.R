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
#write clean file into a new CSV
write.csv(InFile,file="CleanFile.csv")

#statistical analysis
names(InFile)
mean(InFile$X0.6_population_total)
min(InFile$X0.6_population_total)
range(InFile$X0.6_population_total)
diff(range(InFile$X0.6_population_total))
quantile(InFile$X0.6_population_total)
var(InFile$X0.6_population_total)
sd(InFile$X0.6_population_total)
install.packages("moments")
library(moments)
skewness(InFile$X0.6_population_total)
kurtosis(InFile$X0.6_population_total)
plot(density(InFile$X0.6_population_total))
summary(InFile$X0.6_population_total)

# check the dependancy between the "number of graduates" and the male population and the female population
# The below covriance shows that there is a positive relation between the two parameters on the "number of graduates"  
cov(InFile$population_female,InFile$total_graduates)
cov(InFile$population_male,InFile$total_graduates)
cov(InFile$population_total,InFile$total_graduates)

# correlation coefficient ( this is check how much close the relation ship is ) 
cor(InFile$population_female,InFile$total_graduates)
cor(InFile$population_male,InFile$total_graduates)
cor(InFile$literates_female,InFile$total_graduates)
cor(InFile$population_total,InFile$total_graduates)
cor(InFile$literates_male,InFile$total_graduates)
