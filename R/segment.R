#'Segment
#'
#'This function builds a categorical variable from a numeric variable
#'@import RForcecom
#'@import dplyr
#'@export segment


segment <- function(access_token, instance_url, object, field){


instance_u <- paste0(instance_url,'/')
api <- '36.0'

myquery <- paste0('Select Id, ', field,' FROM ', object)
session <- c(sessionID = access_token,instanceURL = instance_u, apiVersion = api)

data1 <- rforcecom.bulkQuery(session, myquery, object)
data1 <- na.omit(data1)



# Data Treatment starts Here
data2 <- subset(data1, select = c(2))
data2 <- slider(data2, 5)
data1 <- cbind(data1, data2) # Derived values are binded to the original data
data1 <- subset(data1, select = c("Id", "dist"))
colnames(data1) <- c("strId", "dist")

return(data1)
}
