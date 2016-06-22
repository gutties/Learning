startup_data <- read.csv("crunchbase_monthly_export.csv", stringsAsFactors = F, header = T)

head(data)

x <- True + True + False +True
x
5 == 5
10 != 1
7 > 29

T & T
T & T & F
F & F 
T | F
F | F
F | F | T
!T
!F

x <- 5
y <- 25
my_Var <- "I like apples"
x
x_plus_y <- x + y
x_plus_y

class(my_Var)

a = T
b = T + F
c = F + F + F
b == c

a + b > c

vector_one <- c(10, 20, 30, NA, 40)
vector_one
sum(vector_one, na.rm = TRUE)

head(startup_data)
tail(startup_data)
nrow(startup_data)
str(startup_data)
ncol(startup_data)
colnames(startup_data)

head(startup_data, n = 10)

my_vector <- c(2, 14, 10, 15,3)
my_vector [3]
sequence_vector <- c(1:10, 20 ,30)
sequence_vector
my_vector * 2
my_vector + my_vector
my_vector [my_vector > 11]
my_vector[]
my_vector > 5

my_matrix <- matrix(1:6, ncol = 3, nrow = 2, byrow = T)
my_matrix[,1:2]

is.data.frame(startup_data)
is.matrix(startup_data)
str(startup_data)

head(startup_data$name)
startup_data[1:50,1]
startup_data$name[1:50]

head(startup_data[,c(1,3)])

mini_frame <- startup_data[1:10, c("name", "market", "funding_total_usd")]
mini_frame

young_startups <- startup_data$founded_year > 2012
head(young_startups, n = 25)
young_startups[1:10]
startup_data$founded_year[1:10]

sum(young_startups, na.rm = T)

startup_data$name == "#waywire"

sum(startup_data$state_code == "NY", na.rm = T)
sum(startup_data$funding_rounds[1:50])
startup_data$funding_rounds[1:50]

hist(startup_data$funding_rounds, main = "Series A Crunch", 
     xlab = "Funding Rounds",
     ylab = "# of StartUps",
     xlim = c(1,8))
     par(bg = "#36394A", col = "white", fg = "white", col.axis = "white",
         col.lab = "white", col.main = "white", family = "Verdana")
