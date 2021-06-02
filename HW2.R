###Group 8
###Tamanna Tahsin

###Section 1 part 1
# Converting the text to url format
csv_download_link="https://guides.newman.baruch.cuny.edu/ld.php?content_id=39953204"
link_url=url(csv_download_link)
# Csv file has columns separated by ; 
fb=read.csv(link_url,sep=";")

###Section 1 part 2
# Gives a preview of the data
head(fb)
# Shows the structure of the data
str(fb)
# Shows the dimension of the data
dim(fb)
# Converting factors to categorical value

###Section 1 part 3
fb$Category=as.factor(fb$Category)
fb$Post.Month=as.factor(fb$Post.Month)
fb$Post.Weekday=as.factor(fb$Post.Weekday)
fb$Post.Hour=as.factor(fb$Post.Hour)
fb$Paid=as.factor(fb$Paid)
fb$Type=as.factor(fb$Type)
# Shows the structure of the data
str(fb)
# Converting category levels
levels(fb$Category)
fb$Category=as.character(fb$Category)
fb[fb$Category=="1","Category"]="action"
fb[fb$Category=="2","Category"]="product"
fb[fb$Category=="3","Category"]="inspiration"
fb$Category=as.factor(fb$Category)
levels(fb$Category)

###Section 1 part 4
# Converting paid levels
levels(fb$Paid)
fb$Paid=as.character(fb$Paid)
fb[fb$Paid=="0","Paid"]="non-paid"
fb[fb$Paid=="1","Paid"]="paid"
fb$Paid=as.factor(fb$Paid)
levels(fb$Paid)

###Section 1 part 5
# Count the total of missing values and make it zero 
sum(is.na(fb))
fb=na.omit(fb)
sum(is.na(fb))

###Section 2 part 1 
# Summary of share
summary(fb$share)
#standard deviation of share
sd(fb$share)

###Section 2 part 2
# Creating a title for the main parameter,
#labeling x and y axes, and breaking parameter at 100.
hist(fb$share,xlab="FB shares",ylab="# of posts", main="Histogram of Shares",breaks=100)
#changing the range on x axis
hist(fb$share,xlab="FB shares",ylab="# of posts", main="Histogram of Shares",breaks=100,xlim=c(0,200))
# most of the posts got 0-20 likes.
#This gives a whole summary of the all the categorical variables
cat_variables=c("Type","Category","Paid","Post.Month","Post.Weekday","Post.Hour")
summary(fb[,cat_variables])

###Section 2 part 3
#This creates a bar plot of posting frequency by month
plot(fb$Post.Month,main="Posts by Month",xlab="Month",ylab="# of posts",las=2)
#This creates a bar plot of posting frequency by category
plot(fb$Category,main="Category of Post",xlab="Category",ylab="# of posts")
#This creates a bar plot of how many posts were paid and how many were non paid
plot(fb$Paid,main="Payment Status",xlab="Paid or Non Paid",ylab="# of Posts")

###Section 3 part 1
#This creates a scatter plot of shares against likes. Likes is x axis and share is y axis
x=fb$like
y=fb$share
plot(x,y,xlab="likes",ylab="shares",main="likes vs shares")
#This zooms into the scatter plot
plot(x,y,xlab="likes",ylab="shares",main="likes vs shares",xlim=c(0,1000),ylim=c(0,200))
#This tests the correlation between likes and shares
cor(fb$like,fb$share)

###Section 3 part 2
#This box plot will compare the shares by month. X axis will be post month and y axis will be number of like
x=fb$Post.Month
y=fb$share
plot(x,y,ylim=c(0,500),las=2,xlab="month",ylab="share",main="Likes by Month")

###Section 3 part 3
#Aggregate function shows the summary of all shares categorized into paid vs non paid
x=fb$Paid
y=fb$share
aggregate(y~x,data=fb,FUN=summary)
#Xtabs function gives the actual number of all paid and non paid shares
x=fb$Paid
y=fb$share
xtabs(y~x,data=fb)
#This will plot number of shares against paid where x axis is paid and y axis is number of shares
x=fb$Paid
y=fb$share
plot(x,y,main="Shares for Non-paid vs Paid posts",xlab="0=Non-paid 1=Paid", ylab="shares",ylim=c(0,500))


###Section 4
#This will plot number of non paid shares against the category type and par will create a 1x3 panel 
levels(fb$Paid)
fb$Paid=as.character(fb$Paid)
fb[fb$Paid=="0","Paid"]="non-paid"
fb[fb$Paid=="1","Paid"]="paid"
fb$Paid=as.factor(fb$Paid)
levels(fb$Paid)


par(mfrow=c(1,3))
x=fb[fb$Category=="action","Paid"]
y=fb[fb$Category=="action", "share"]
plot(x,y,las=2,xlab="",ylab="shares",ylim=c(0,100),main="action")

#This will plot number of paid shares against the category type 
x=fb[fb$Category=="inspiration","Paid"]
y=fb[fb$Category=="inspiration","share"]
plot(x,y,las=2,xlab="",ylab="shares",ylim=c(0,100),main="inspiration")

x=fb[fb$Category=="product","Paid"]
y=fb[fb$Category=="product","share"]
plot(x,y,las=2,xlab="",ylab="shares",ylim=c(0,100),main="product")







