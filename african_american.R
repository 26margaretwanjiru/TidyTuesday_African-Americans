

#devtools::install_github("JohnCoene/echarts4r.assets")

library(tidyverse)
library(echarts4r)
library(echarts4r.assets)

# Get the Data

firsts <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-06-09/firsts.csv')
science <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-06-09/science.csv')

# View(firsts)

# View(science1)

# Data manipulation

science1 <- science%>%
  mutate(age = death - birth)%>%
  drop_na()

# filter occupations that contain Mathematicians

math<-subset(science1, grepl("Mathematician", science1$occupation_s))

# View(math)

# Load the images

Blackwell_David <- "https://math.illinois.edu/sites/default/files/inline-images/blackwell.png"
Andrews_James_J. <- "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzGpwujnKyeIS0WwrQbunx6qcU0UnEb46RVWAoXjRlWaHeXlNW&usqp=CAU"
Bharucha_Reid_Albert_T.	 <- "https://www.blackpast.org/wp-content/uploads/Albert_Turner_Bharucha-Reid.jpg"
Wilkins_J_Ernest_Jr. <-"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/J._Ernest_Wilkins%2C_Jr._9.jpg/220px-J._Ernest_Wilkins%2C_Jr._9.jpg"

# Create a small data frame

data_tues <- data.frame(
  x = c("Blackwell,David", "Andrews,James", 
        "Bharucha,Reid", "Wilkins, Jr."), 
  value = c(91, 68, 58, 88),
  symbol = c(paste0("image://", Blackwell_David),
             paste0("image://", Andrews_James_J.),
             paste0("image://", Bharucha_Reid_Albert_T.),
             paste0("image://", Wilkins_J_Ernest_Jr.))
)

# The chart

data_tues %>% 
  e_charts(x) %>% 
  e_pictorial(value, symbol) %>% 
  e_theme("chalk") %>% 
  e_legend(FALSE) %>% 
  # Title Alignment
  e_title("Ages Lived by some the Mathematician African Americans", 
          left='center', padding=10) %>%
  e_labels(show=TRUE) %>%
  e_x_axis(splitLine=list(show = FALSE)) %>%
  e_y_axis(show=FALSE, min=0,max=100, interval=4, splitLine=list(show = FALSE))

