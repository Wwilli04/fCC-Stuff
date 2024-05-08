#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$1
  else
    if [[ $1 =~ ^[a-z|A-Z]$|^[a-z|A-Z][a-z|A-Z]$ ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
    else
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
    fi
  fi

  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
    exit
  fi
  
  DATABASE_RESPONSE=$($PSQL "SELECT * FROM elements FULL JOIN properties USING (atomic_number) LEFT JOIN types USING (type_id) WHERE atomic_number = $ATOMIC_NUMBER")
  # if what we have is a real element
  if [[ ! -z $DATABASE_RESPONSE ]]
  then
    # output the formatted info
    echo "$DATABASE_RESPONSE" | while IFS="|" read TYPE_ID NUMBER SYMBOL NAME MASS MELT_POINT BOIL_POINT TYPE
    do
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
    done
    exit
  else
    echo "I could not find that element in the database."
    exit
  fi
fi
