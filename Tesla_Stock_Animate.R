#pakckages needed to run this script
library(ggplot2)
library(gganimate)


#Read file locally
#Data Source from Yahoo Finance
Tesla<- read.csv("TESLA.csv", header = T)
#Check data structure
str(Tesla)
#convert date from factor to Date type
Tesla$Date<- as.Date(Tesla$Date)

#Plot basic line chart
line<-ggplot(data=Tesla, aes(x=Tesla$Date, y=Tesla$Close, ymin=Tesla$Low, ymax=Tesla$High)) + 
geom_smooth(colour = 'Red') + 
xlab(as.expression(expression( paste("Year") ))) + 
ylab("US Dollars")+
labs(title="Tesla stock price over time") + 
#This section determines the breakdown of time
scale_x_date(date_breaks="1 year", date_labels="%Y")+
transition_reveal(Tesla$Date)+
#type of annimation
ease_aes('linear')

#Save the fiole to the workingdirectory
anim_save("line.gif")


  