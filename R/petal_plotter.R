# Load packages
library(dplyr)
library(tidyr)
library(ggplot2)

# Read command-line arguments
args <- commandArgs(trailingOnly = TRUE)

species_a <- args[1] # The first argument is the name of the first species

species_b <- args[2] # The second argument is the name of the second species

image_size <- as.integer(args[3]) # The third argument is the image size



# Import iris data 

iris_data <- datasets::iris


# Keep only data from the selected species

iris_data <- filter(iris, Species %in% c(species_a, species_b))


# Make plot

plot <- iris_data |>
  
  ggplot(aes(x = Petal.Length, 
             y = Petal.Width, 
             colour = Species)) +
  
  geom_point() +
  
  labs(x = "Petal width",
       y = "Petal length")



# Create output file name

output_file <- paste0(
  "iris_",
  species_a,
  "_vs_",
  species_b,
  "_ggplot",
  ".png"
)



# Save plot

ggsave(
  filename = output_file,
  plot = plot,
  width = image_size,
  height = image_size,
  units = "px",
  dpi = 150
)