letters <- c("ab", "bbb", "cower", "d", "eggs", "fight", "gone")
#this prints all of them
for (letter in letters){
  print(letter)
  
}
# add a break so that when there are 4 characters in the letter
#that item is skipped
for (letter in letters){
  if (nchar(letter) == 4){
    next
    
  }
  print(letter)
}

primes <- c(2, 3, 5, 7, 11, 13)

# loop version 1
for (p in primes) {
  print(p)
}

# loop version 2
for (i in 1:length(primes)) {
  print(primes[i])
}

# Same for lists, just use double brackets when selecting an item. 
# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for (i in nyc){
  print(i)
}


# Loop version 2
for (i in 1:length(nyc)){
  print(nyc[[i]])
  
}

# For a matrix

# The tic-tac-toe matrix ttt has already been defined for you
ttt
# define the double for loop
for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row", i, "and column", j, "the board contains", ttt[i,j]))
  }
}

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if(li > 16){
    print( "This is ridiculous, I'm outta here!" )
    break
    
  }
  
  # Add if statement with next
  if (li <5){
    print( "This is too embarrassing!")
    next
  }
  
  print(li)
}

#Functions
pow_two <- function(x) {
  y <- x ^ 2
  return(y)
}
pow_two(4)
y
x

two_dice <- function(){
  possibilities <- 1:6
  dice1 <- sample(possibilities, size = 1)
  dice2 <- sample(possibilities, size = 1)
  dice1 + dice2
  
}
two_dice()
res(two_dice())
dice1

triple <- function(x){
  x <- 3*x
  x
}
a <- 5
triple(a)
a

increment <- function(x, inc = 1){
  x <- x + inc
  x
}
count <- 5
a <- increment(count, 2)
b <- increment(count)
count <- increment(count, 2)
count
a
b


#lapply
# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low,select_first)
names
# Write function select_second()
select_second <- function(x){
  x[2]
}



# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)
years