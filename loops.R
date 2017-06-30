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