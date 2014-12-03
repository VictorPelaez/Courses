
jobs_with_skills_name<-c("R","Python","SAS","SPSS","Excel","RapidMiner","SQL")
jobs_with_skils_count<-c(1776+3283,13519,2414,7429,123874,17,37571)
library(plyr)
jobs_with_skills<-data.frame(c(jobs_with_skills_name),c(jobs_with_skils_count))
head(jobs_with_skills)
skills<-data.frame(c(jobs_with_skills_name),c(jobs_with_skils_count))
barplot(skills$c.jobs_with_skils_count.,names.arg=jobs_with_skills_name)
skills$people<-people_with_skills_count
people_with_skills_count<-c(230750,815555,128860,752205,15390756,3306,4648240)
colnames(skills)[1]<-"name"
colnames(skills)[2]<-"jobs"
skills<-transform(skills,ratio=people/jobs)
barplot(skills$jobs,names.arg=jobs_with_skills_name,col="yellow",main="People with Skills",xlab="Skill")
barplot(skills$jobs,names.arg=jobs_with_skills_name,col="yellow",main="Jobs with Skills",xlab="Skill")
plot(skills$ratio,names.arg=jobs_with_skills_name,col="red",main="Ratio of People to Jobs",xlab="Skill")
barplot(skills$ratio,names.arg=jobs_with_skills_name,col="#fbe920",main="Ratio of People to Jobs",xlab="Skill")

name<-c("Hadoop","MapReduce","Javascript","Scala")
jobs<-c(5111,4299,18728,972)
people<-c(115858,39159,2325518,79309)
programming<-data.frame(name,jobs,people)
programming
programming<-transform(programming,ratio=people/jobs)
programming

barplot(programming$jobs,names.arg=name,col="blue",main="Jobs with Skills",xlab="Skill")
barplot(programming$people,names.arg=name,col="blue",main="People with Skills",xlab="Skill")
barplot(programming$ratio,names.arg=name,col="#fbe920",main="People to Jobs",xlab="Skill")

name<-c("Machine Learning","Data Mining","Predictive Analytics","Analytics","Data Science")
jobs<-c(3861,18367,7106,49612,54661)
people<-c(319078,568242,97721,229009,4710053)
analytics<-data.frame(name,jobs,people)
analytics<-transform(analytics,ratio=people/jobs)
analytics

barplot(analytics$jobs,names.arg=name,col="black",main="Jobs with Skills",xlab="Skill")
barplot(analytics$people,names.arg=name,col="black",main="People with Skills",xlab="Skill")
barplot(analytics$ratio,names.arg=name,col="#fbe920",main="People to Jobs",xlab="Skill")
