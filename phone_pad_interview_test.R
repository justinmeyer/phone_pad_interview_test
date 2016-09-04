# Phone Pad Interview Test Solutions
# Justin Meyer
# 9/4/16

# When a user selects three numbers on a phone pad return all the possible 
# combinations of those letters

#######################################################
# One solution
#######################################################

# Create phone pad
# O and 1 are not needed because they don't represent any letters
# Note that six and nine have four letters while the others have three
two <- c("A", "B", "C")
three <- c("D", "E", "F")
four <- c("G", "H", "I")
five <- c("J", "K", "L")
six <- c("M", "N", "O", "P")
seven <- c("Q", "R", "S")
eight <- c("T", "U", "V")
nine <- c("W", "X", "Y", "Z")

# Choose three numbers
number_1 <- two
number_2 <- three
number_3 <- six

# create an object to save the combinations to
combinations <- NULL

# Loop through the letters in number_1
for(i in number_1){
        
    # Loop through the letters in number_2
    for(j in number_2){
              
        # Loop through the letters in number_3
        for(k in number_3){
                
                # Add each of the letters to the combinations object
                combinations <- c(combinations, paste0(i, j, k)) 
                  
        }
        
    }

}

# Print all of the possible combinations
combinations

# Clear the environment
rm(list = ls())

####################################################################
# Another solution (using a Rube Goldberg-like sampling method)
####################################################################

# Create phone pad
# O and 1 are not needed because they don't represent any letters
# Note that six and nine have four letters while the others have three
two <- c("A", "B", "C")
three <- c("D", "E", "F")
four <- c("G", "H", "I")
five <- c("J", "K", "L")
six <- c("M", "N", "O", "P")
seven <- c("Q", "R", "S")
eight <- c("T", "U", "V")
nine <- c("W", "X", "Y", "Z")

# Choose three numbers
number_1 <- two
number_2 <- three
number_3 <- six

# Create status and count objects
status <- "not enough"
count <- 0

# Create a while loop that runs as long as all of
# the possible combinations have not been found
while(status == "not enough"){
  
  # Create combinations object
  combinations <- NULL
  
  # Sample one letter from each of the chosen numbers
  # Add that combination of letters to combinations
  # Do this 100 times (needs to run at least as many times as there 
  # are possible combinations)
  for(i in 1:100){
    combinations[i] = paste0(sample(number_1, 1), sample(number_2, 1), sample(number_3, 1))
  }
  
  rm(i)
  
  # Check to see if all the possible combinations have been found
  # If all of the possible combinations are found, change status from 
  # "not enough" to "enough" so that the while loop will stop
  if((length(number_1) + length(number_2) + length(number_3) == 9 & length(unique(combinations)) == 27) | 
     (length(number_1) + length(number_2) + length(number_3) == 10 & length(unique(combinations)) == 36) |
     (length(number_1) + length(number_2) + length(number_3) == 11 & length(unique(combinations)) == 48)){
    status <- "all possible"
    }
  
  # Add one to count every time the while loop runs
  count <- count + 1
  
  # Print the results of each while loop
  print(paste0("length: ", length(unique(combinations))))
  print(paste0("count: ", count))
}

# When the while loop stops, print all of the possible combinations
unique(combinations)

# Clear the environment
rm(list = ls())
