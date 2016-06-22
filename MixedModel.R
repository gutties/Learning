pitch = c(233, 204, 242, 130, 112, 142)
sex = c(rep("female", 3),rep("male", 3))

my.df <- data.frame(sex, pitch)
my.df

xmdl <- lm(pitch ~ sex, my.df)
summary(xmdl)

my.df[my.df$sex == "female", ]
mean(my.df[my.df$sex == "female", ]$pitch)


age = c(14, 23, 35, 48, 52, 67)
pitch = c(252,244,240,233,212,204)
my.df <- data.frame(age, pitch)

library(devtools)
install_github("ujjwalkarn/xda")
library(xda)

numSummary(my.df)
Plot(my.df, 'age')
plot(my.df)

xmdl <- lm(pitch ~ age, my.df)
summary(xmdl)
abline(xmdl)

library(dplyr)
my.df <- mutate(my.df,
                age.c = age - mean(age))
xmdl <- lm(pitch ~ age.c, my.df)
summary(xmdl)

plot(fitted(xmdl),residuals(xmdl), xlim = c(180,280), ylim = c(-15,15), xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, lty = 2)

plot(rnorm(100),rnorm(100))
plot(rnorm(100),rnorm(100))
plot(rnorm(100),rnorm(100))
plot(rnorm(100),rnorm(100))

#### Mixed Effects Model

library(lme4)
politeness= read.csv("http://www.bodowinter.com/tutorial/politeness_data.csv")
head(politeness)
str(politeness)
summary(politeness)

### Check for missing values
which(is.na(politeness)==T)

boxplot(frequency ~ attitude*gender,
        col=c("white","lightgray"),politeness)

politeness.model = lmer(frequency ~ attitude + (1|subject) + (1|scenario), data=politeness)
politeness.model
summary(politeness.model)

politeness.model = lmer(frequency ~ attitude +
                          gender + (1|subject) +
                          (1|scenario), data=politeness)
summary(politeness.model)

## To test significance of Mixed Model results
## Construct a null model
politeness.null = lmer(frequency ~ gender +
                         (1|subject) + (1|scenario), data=politeness,
                       REML=FALSE)

## Now redo the full model
politeness.model = lmer(frequency ~ attitude +
                          gender +
                          (1|subject) + (1|scenario), data=politeness,
                        REML=FALSE)

## perform likiehood ratio test to see if omitting attitude from null model makes a difference
anova(politeness.null,politeness.model)

## the coefficients of the model by subject and by item:
coef(politeness.model)

## random slope inc different slopes for levels of politeness
politeness.model = lmer(frequency ~ attitude +
                          gender + (1+attitude|subject) +
                          (1+attitude|scenario),
                        data=politeness,
                        REML=FALSE)
coef(politeness.model)