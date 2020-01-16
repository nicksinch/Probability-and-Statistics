# Problem 2

# Function to make the graph
GraphRolledDices = function(n = 1) {
  dicesRolled = RollDice(n)
  plot(dicesRolled, type="l")
  abline(h = 1/6)
}

# Simulation of rolling a dice
RollDice = function(n = 3){
  listOfProbabilities = 1:n 
  countSix = 0 # Counts how many 6's are rolled
  numberOfRolls = 100 # Dice will be thrown numberOfThrows * n times
  totalNumberOfRolls = 0 
  for(i in 1:n){
    experimentSample = sample(1:6,numberOfRolls,replace = T)
    totalNumberOfRolls = totalNumberOfRolls + numberOfRolls
    countSix = countSix + sum(experimentSample==6)
    listOfProbabilities[i] = countSix / totalNumberOfRolls
  }
  
  return(listOfProbabilities)
}
