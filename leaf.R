library(caret)
leaf = read.csv("leaf.csv", colClasses = c(Class = "factor"))
ctrl = trainControl(method="repeatedcv", number=10, repeats=5, selectionFunction = "oneSE")
in_train = createDataPartition(leaf$Class, p=.75, list=FALSE)

trf = train(Class ~ Eccentricity + Aspect_Ratio + Elongation +
              Solidity + Stoch_Convexity + Isoperimetric + 
              Max_Ind_Depth + Lobedness + Avg_Intensity + 
              Avg_Contrast + Smoothness + Third_Moment + 
              Uniformity + Entropy, data=leaf, method="rf", metric="Kappa",
            trControl=ctrl, subset = in_train)

tgbm = train(Class ~ Eccentricity + Aspect_Ratio + Elongation +
               Solidity + Stoch_Convexity + Isoperimetric + 
               Max_Ind_Depth + Lobedness + Avg_Intensity + 
               Avg_Contrast + Smoothness + Third_Moment + 
               Uniformity + Entropy, data=leaf, method="gbm", metric="Kappa",
             trControl=ctrl, subset = in_train, verbose=FALSE)

trf

tgbm

# Compare two models
resampls = resamples(list(RF = trf,
                          GBM = tgbm))

difValues = diff(resampls)
summary(difValues)

# Test now just with rf as it was more accurate
test = leaf[-in_train,]
test$pred.leaf.rf = predict(trf, test, "raw")
confusionMatrix(test$pred.leaf.rf, test$Class)

# Which variables were important
varImp(trf, scale=FALSE)
