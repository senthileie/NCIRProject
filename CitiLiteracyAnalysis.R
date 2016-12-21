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
install.packages("moments")
library(moments)

# check the dependancy between the "number of graduates" and the male population and the female population
# The below covriance shows that there is a positive relation between the two parameters on the "number of graduates"  
cov(InFile$population_female,InFile$total_graduates)
cov(InFile$population_male,InFile$total_graduates)
cov(InFile$population_total,InFile$total_graduates)
cov(InFile$literates_female,InFile$total_graduates)
cov(InFile$literates_male,InFile$total_graduates)


# correlation coefficient ( this is to check how close is the relationship )
# if the relation is close enough then attempt will be made to create a regression model 
cor(InFile$population_female,InFile$total_graduates)
cor(InFile$population_male,InFile$total_graduates)
cor(InFile$population_total,InFile$total_graduates)
cor(InFile$literates_female,InFile$total_graduates)
cor(InFile$literates_male,InFile$total_graduates)

plot(InFile$population_female ~ InFile$total_graduates) # the plot seems to show a linear relationship
plot(InFile$population_male ~ InFile$total_graduates)  # the plot seems to show a linear relationship
plot(InFile$literates_female ~ InFile$total_graduates) # the plot seems to show a linear relationship
plot(InFile$population_total ~ InFile$total_graduates)  # the plot doesnt show any relation which is meaningful enough to make a relation
plot(InFile$literates_male ~ InFile$total_graduates) # the plot seems to show a linear relationship

#Linear model to with details from women
lmodel<-lm(InFile$total_graduates ~ InFile$population_female+InFile$literates_female, data = InFile )
summary(lmodel)

#Linear model to with details from men
lmodel<-lm(InFile$total_graduates ~ InFile$population_male+InFile$literates_male, data = InFile )
summary(lmodel)

#scatterplot to see the relation between literacy rate of male and female
plot(InFile$effective_literacy_rate_male,InFile$effective_literacy_rate_female,col=c("red","green","blue","yellow"))