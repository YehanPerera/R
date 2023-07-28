#ggplot
library(ggplot2)
library(dplyr)
attach(bank_marketing)
barplot(sort(table(job),decreasing = T))
df=bank_marketing
table(job)

df1=as.data.frame((table(job)))
df1
ggplot(data=df1,aes(x=reorder(job,-Freq),y=Freq))+geom_bar(stat="identity")
ggplot(data=df1,aes(x=reorder(job,+Freq),y=Freq))+geom_bar(stat="identity")
ggplot(data=df,aes(x=job,y=duration))+geom_bar(stat="identity")
ggplot(data=df,aes(y,y=age))+geom_bar(stat="identity")+coord_flip()
ggplot(data=df1,aes(x=reorder(job,-Freq),y=Freq))+geom_bar(stat="identity")+theme(axis.text.x = element_text(angle=45,size=20))
###dplyr
df=df%>%
  group_by(marital)%>%
  mutate(ageover40= ifelse(age>40,"Yes","No"))
df2=df%>%
  group_by(marital)%>%
  count()%>%
  mutate(Percentage=n/nrow(bank_marketing)*100)
View(df2)
ggplot(df2,aes(x=marital,y=Percentage))+geom_bar(stat="identity")
##
barplot(table(y,marital),beside=T)


###
ggplot(df,aes(y=age))+geom_boxplot()
ggplot(df,aes(x=y,y=age))+geom_boxplot()
