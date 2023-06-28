library("data.table")
library(ggplot2)
#read your dataset from first device
df <- read.csv("/Users/user/Desktop/document1.csv")
#transform it to dataframe
new_tableavx <- data.frame(df[1,])
#read number of rows to add the time
new_variable <- numeric(nrow(df))
#initialize time to start from 0
timp <- 0
#add your time. modify 0.01 with your period depending on your chosen sampling frequency rate
for (i in 1:nrow(df)) {
  timp <- timp + 0.01
  new_variable[i] <- timp
}
#add time column to the original dataframe
df <- cbind(df, new_variable)
current_colnames <- colnames(df)
#set the names of the columns
current_colnames[1] <- "Voltage"
current_colnames[2] <- "Time_s"
colnames(df) <- current_colnames
#complete if none case
df <- df[complete.cases(df), ]
#visualise first 5 values of the dataframe to make sure the column names are ok
head(df)

#read your dataset from your second device
df2 <- read.csv("/Users/user/Desktop/document2.csv")
new_tableavx2 <- data.frame(df2[1,])
#transform it to dataframe
new_variable2 <- numeric(nrow(df2))
#initialize time to start from 0
timp2 <- 0
#add your time. modify 0.01 with your period depending on your chosen sampling frequency rate
for (i in 1:nrow(df2)) {
  timp2 <- timp2 + 0.01
  new_variable2[i] <- timp2
}
#add time column to the original dataframe
df2 <- cbind(df2, new_variable2)
current_colnames2 <- colnames(df2)
#set the names of the columns. Choose different names from the first dataset for easier plotting
current_colnames2[1] <- "V"
current_colnames2[2] <- "T"
colnames(df2) <- current_colnames2
#complete if none case
df2 <- df2[complete.cases(df2), ]
#visualise first 5 values of the dataframe to make sure the column names are ok
head(df2)

#read your dataset from your third device
df3 <- read.csv("Users/user/Desktop/document3.csv")
#transform it to dataframe
new_tableavx3 <- data.frame(df3[1,])
new_variable3 <- numeric(nrow(df3))
#initialize time to start from 0
timp3 <- 0
#add your time. modify 0.01 with your period depending on your chosen sampling frequency rate
for (i in 1:nrow(df3)) {
  timp3 <- timp3 + 0.01
  new_variable3[i] <- timp3
}
#add time column to the original dataframe
df3 <- cbind(df3, new_variable3)
current_colnames3 <- colnames(df3)
#set the names of the columns. Choose different names from the first dataset for easier plotting
current_colnames3[1] <- "V1"
current_colnames3[2] <- "T1"
colnames(df3) <- current_colnames3
#complete if none case
df3 <- df3[complete.cases(df3), ]
#visualise first 5 values of the dataframe to make sure the column names are ok
head(df3)



#create plot object, i choose to se Voltage on Y axis and time on X axis, and unite my points by a line
p2<-ggplot(df, aes(Time_s ,Voltage)) + geom_line()
p2
#add to the plot the characteristics of the first, second and 3rd sets of data, and visualise all 3 characteristics on one plot
p2+geom_line(data = df2, aes(x =T, y = V, color = "red"))+geom_line(data = df3, aes(x =T1, y = V1, color = "blue"))+labs(title = "Samxon T=60°C-red, T=21°C-blue, I=0.1A",color="Temperature")+scale_color_manual(labels=c("60°C","21°C"),values=c("red","blue"))


