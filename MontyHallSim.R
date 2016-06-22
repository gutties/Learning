doors <- c("A", "B", "C")

# Create an object to store the data from the loop
xdata=c()


# Run the loop

for (i in 1:10000)
  # Everything in curly brackets below will be looped through n times
{
  prize <- sample(doors)[1] #This puts the prize beyond one of the doors at random
  pick <- sample(doors)[1] #This is the door the guesser picks
  open <- sample(doors[which(doors != pick & doors != prize)]) [1]
  switchyes <- doors[which(doors != pick & doors != open)]
  if(pick == prize){xdata=c(xdata,"noswitchwin")}
  if(switchyes == prize){xdata=c(xdata,"switchwin")}
}

length(which(xdata == "switchwin"))
length(which(xdata == "noswitchwin"))

