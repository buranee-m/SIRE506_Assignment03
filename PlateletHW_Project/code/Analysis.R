#Linear regression each SNPs
model_rs4244285 <- lm(ADP ~ rs4244285, data = PlateletHW)
model_rs4986893 <- lm(ADP ~ rs4986893, data = PlateletHW)
model_rs662 <- lm(ADP ~ rs662, data = PlateletHW)

summary(model_rs4244285)
summary(model_rs4986893)
summary(model_rs662)
#ggplot of each SNPs
library(ggplot2)
ggplot(PlateletHW, aes(x = rs4244285, y = ADP)) + geom_point() + geom_smooth(method = "lm", se = FALSE, color = "red") + labs(title = "Figure 1.1 Linear Regression of ADP on rs4244285")
ggplot(PlateletHW, aes(x = rs4986893, y = ADP)) +geom_point() + geom_smooth(method = "lm", se = FALSE, color = "red") + labs(title = "Figure 1.2 Linear Regression of ADP on rs4986893")
ggplot(PlateletHW, aes(x = rs662, y = ADP)) +geom_point() + geom_smooth(method = "lm", se = FALSE, color = "red") + labs(title = "Figure 1.3 Linear Regression of ADP on rs662")
#Multiple linear regression
model <- lm(ADP ~ rs4244285 + rs4986893 + rs662 + AGE + SEX, data = PlateletHW)
summary(model)
#Logistic regression
resistance_model <- glm(Resistance ~ rs4244285 + rs4986893 + rs662 + AGE + SEX, data = PlateletHW, family = binomial)
summary(resistance_model)
#Confusion matrix 
predicted_probs <- predict(model, type = "response")
predicted_classes <- ifelse(predicted_probs > 0.5, 1, 0)  
actual_classes <- PlateletHW$Resistance
confusion_matrix <- table(Predicted = predicted_classes, Actual = actual_classes)
print(confusion_matrix)