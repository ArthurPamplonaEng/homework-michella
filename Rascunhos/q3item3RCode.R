# Assign the CSV file path to a variable
file_path <- "C:\\Users\\Arthur Pamplona\\Documents\\HW1_bike_sharing.csv"
# Read the CSV file into a data frame
my_data <- read.csv(file_path)

# View the first few rows of the data frame
head(my_data)

my_data$season <- factor(my_data$season,
                         levels = c(1, 2, 3, 4),
                         labels = c("Winter", "Spring", "Summer", "Autumn"))

my_data$weathersit <- factor(my_data$weathersit,
                             levels = c(1, 2, 3, 4),
                             labels = c("Clear Sky", "Foggy", "Light rain", "Heavy Rain"))

my_data$total_users <- my_data$casual + my_data$registered
# Total users by season
users_by_season <- tapply(my_data$total_users, my_data$season, sum)

# Total users by weather condition
users_by_weather <- tapply(my_data$total_users, my_data$weathersit, sum)
# Bar plot: users by season
barplot(users_by_season,
        main = "Bike usage by season",
        xlab = "Season",
        ylab = "Total users",
        col = c("lightblue", "lightgreen", "gold", "orange"))

# Bar plot: users by weather condition
barplot(users_by_weather,
        main = "Bike usage by weather condition",
        xlab = "Weather condition",
        ylab = "Total users",
        col = c("skyblue", "gray", "lightyellow", "lightpink"))

