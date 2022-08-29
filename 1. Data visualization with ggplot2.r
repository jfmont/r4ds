# 1. Data visualization with ggplot 2

# Cargamos paquetes

library("tidyverse")


########################
#        Intro         #
########################

# 1.1 Run ggplot(data = mpg). What do you see?

# Nothing

# 1.2 How many rows are in mtcars? How many columns? 

glimpse(mpg)

# 234 rows and 11 columns

# 1.3 What does the drv variable describe? Read the help for ? mp to find out

?mpg

# drv = the type of drive train, where f = front-wheel drive, 
#r = rear wheel drive, 4 = 4wd

# 1.4 Make a scatterplot of hwy versus cyl 

ggplot(data = mpg) +
  
  geom_point(mapping = aes(x = hwy, y = cyl))

# 1.5 What happens if you make a scatterplot of class versus drv?
# Why is the plot not useful?

ggplot(data = mpg) +
  
  geom_point(mapping = aes(x = class, y = drv))

# Both are cualitative variables, therefore, not too much information is shown.

########################
#      Aesthetics      #
########################

# 2.1 What's gone wrong with this code? Why are the points not blue?

# Here is fixed, as blue is not a variable, it goes outside the parenthesis. 

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy), color = "blue")

# 2.2 Which variables in mpg are categorical? Which variables are continuous? 
# How can you see this information when you run mpg? 

glimpse(mpg)

# 2.3 Map a continuous variable to color, size and shape. How do these aesthetics behave
# differently for categorical versus continuous variables? 

# Continuous 
# Color

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy, color = displ))

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy, color = manufacturer))

# Continuous variables have a wider espectrum of values, and therefore a 
# wider spectrum of colours, categorical have a limited number of colours. 

# Size

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy, size = displ))

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy, size = manufacturer))

# When it comes to size, it makes no sense to employ it with categorical variables, 
# as it shows no relevant information. 

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy, shape = displ))

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy, shape = manufacturer))

# A continuous variable can not be mapped to shape. Shapes are limited to 6 values. 

# 2.4 What happens if you map the same variable to multiple aesthetics? 

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy, color = displ, size = displ))

# Both work as you use it properly. 

# 2.5 What does the stroke aesthetic do? What shapes does it work with? 

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy, colour = displ, stroke = displ))

# stroke adjusts the thickness of the border for shapes that can take on different
# colors both inside and outside. It only works for shapes 21-24.

# 2.6 What happens if you map an aesthetic to something other than a variable name, 
# like aes(color = displ < 5)? 

ggplot(data = mpg) +
  
  geom_point(
    
    mapping = aes(x = displ, y = hwy, colour = displ < 5))

# We get a False / True graph, as conditional values can be provided but employing 
# other code. 

########################
#        Facets        #
########################

# 3.1 What happens if you facet on a continuous variable? 

ggplot(data = mpg) +
  
  geom_point(mapping = aes(x = displ, y = hwy)) +
  
  facet_wrap(~ displ)

# Many facets appear! Crazy!

# 3.2 What do the empty cells in a plot with facet_grid(drv ~ cyl) mean?
# How do they relate to this plot? 

ggplot(data = mpg) +
  
  geom_point(mapping = aes(x = drv, y = cyl)) +
  
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  
  geom_point(mapping = aes(x = drv, y = cyl))

# The empty cells (facets) in this plot are combinations of drv and cyl 
# that have no observations. These are the same locations in the scatter 
# plot of drv and cyl that have no points.

# 3.3 What plots does the following code make? What does . do? 



# 3.4 Take the first faceted plot in this section. 
# What are the advantages o using faceting instead of the color
# aesthetic? What are the disadvantages? How might the balance change if you 
# had a larger dataset? 

# 3.5 Read ?facet_wrap. What does nrow do? What does ncol do? 
#   What other options control the layout of the individual panels? 
#   Why doesn't facet grid have nrow and ncol variables? 

# 3.6 When using facet_grid() you should usually put 
#     the variable with more unique levels in the columns. Why?

  