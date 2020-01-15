# Problem 3 - Not ready 100 % yet

CalculateBestVariant = function(n = 1){
  pWinAgainstMother = 0.4 # Probability of the boy to win against his mother in a set
  pWinAgainstFather = 0.3 # Probability of the boy to win against his father in a set
  
  countWins = 0
  countTries = 0
  
  for(i in 1:n){
    wins1 = startWithMother()
    wins2 = startWithFather()
    prob1 = 0
    prob2 = 0
    if(wins2 >= 2){
      prob2 = pMother*pFather + (1-pMother)*pFather*pMother
    }
    if(wins1 >= 2){
      prob1 = pFather*pMother + (1-pFather)*pMother*pFather
    }
  }
}

# Mother-Father-Mother Game Type
# Returns number of wins of the boy when he first starts against his mother
startWithMother = function(){
  setOne = sample(0:1, 1,  prob = c(1-pWinAgainstMother, pWinAgainstMother))
  setTwo = sample(0:1, 1, prob = c(1-pWinAgainstFather, pWinAgainstFather))
  setThree = sample(0:1, 1, prob = c(1-pWinAgainstMother, pWinAgainstMother))
  
  # Now, since we want the set wins to be consecutive, there are two ways:
  # Either first two or second two sets. If he ha won all the three, we go to the first case and sum all
  if(setOne == 1 && setTwo == 1)
  {
    wins = setOne + setTwo + setThree
    return(wins)
  }
  else if(setTwo == 1 && setThree == 1)
  {
    wins = setOne + setTwo + setThree # Just setTwo + setThree would also be enough but nvm
    return(wins)
  }
  else # Hasn't won two consecutive sets, so doesn't win the game !
    return (0)
}

# Father-Mother-Father Game Type
# Returns number of wins of the boy when he first starts against his father
startWithFather = function(){
  setOne = sample(0:1, 1, prob = c(1-pWinAgainstFather, pWinAgainstFather))
  setTwo = sample(0:1, 1, prob = c(1-pWinAgainstMother, pWinAgainstMother))
  setThree = sample(0:1, 1, prob = c(1-pWinAgainstFather, pWinAgainstFather))
  
  
  # The same logic as mother applies to the case against the father
  if(setOne == 1 && setTwo == 1)
  {
    wins = setOne + setTwo + setThree
    return(wins)
  }
  else if(setTwo == 1 && setThree == 1)
  {
    wins = setOne + setTwo + setThree # Just setTwo + setThree would also be enough but nvm
    return(wins)
  }
  else # Hasn't won two consecutive sets, so doesn't win the game !
    return (0)
}