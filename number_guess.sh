#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

GUESSING_GAME() {
  if [[ -z $SECRET_NUMBER ]]
  then
    SECRET_NUMBER=$(( 1 + $RANDOM % 1000 ))
    NUMBER_OF_GUESSES=0
  fi
  #echo $SECRET_NUMBER
  if [[ ! $1 ]]
  then
    echo "Guess the secret number between 1 and 1000:"
  else
    echo $1
  fi
  read GUESS
  MAKE_GUESS $GUESS
}

MAKE_GUESS() {
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    GUESSING_GAME "That is not an integer, guess again:"
  else
    NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 ))
    if [[ $1 == $SECRET_NUMBER ]]
    then
      GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_info WHERE username='$USERNAME'")
      GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))
      ADD_TO_TOTAL_GAMES_RESULT=$($PSQL "UPDATE user_info SET games_played= $GAMES_PLAYED WHERE username='$USERNAME'")
      BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username='$USERNAME'")
      if [[ $BEST_GAME > $NUMBER_OF_GUESSES || $BEST_GAME == 0 ]]
      then
        ADD_NEW_BEST_RESULT=$($PSQL "UPDATE user_info SET best_game= $NUMBER_OF_GUESSES WHERE username='$USERNAME'")
      fi
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      exit
    else
      if [[ $1 > $SECRET_NUMBER ]]
      then
        GUESSING_GAME "It's lower than that, guess again:"
      else
        GUESSING_GAME "It's higher than that, guess again:"
      fi
    fi
  fi

}

LOGIN_MENU() {
  echo "Enter your username:"
  read USERNAME
  LOGIN_RESULT=$($PSQL "SELECT * FROM user_info WHERE username = '$USERNAME'")
  if [[ -z $LOGIN_RESULT ]] 
  then
    CREATE_ACCOUNT_RESULT=$($PSQL "INSERT INTO user_info(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    GUESSING_GAME
  else
    echo $LOGIN_RESULT | while IFS="|" read USERNAME GAMES_PLAYED BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
    GUESSING_GAME
  fi
}

LOGIN_MENU



