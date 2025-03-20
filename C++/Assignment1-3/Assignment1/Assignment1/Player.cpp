#include <iostream>
#include <vector>
#include <string>
#include "Card.h"
#include <set>
#include "Player.h"

using namespace std;

Player::Player() :
    // using initialised list 
    _name{ getRandomName() },
    _hand{},
    _tableau{}
{}

string Player::getRandomName() {
    // When selecting the name for the player, select it from a random list
    std::string names[] = { "Sam", "Billy", "Jen", "Bob", "Sally", "Joe", "Sue", "Sasha", "Tina", "Marge" };
    return names[rand() % 10];
}

//When implementing player, we suggest having a function that adds a card to the player’s
    //tableau and removes it from the hand
void addCardToTableau(Card* card, CardCollection* hand) {
    _tableau.push_back(card);
    hand->erase(std::remove(hand->begin(), hand->end(), card), hand->end());
}

// Calculating a player’s score for the current round
int calculateScore(CardCollection otherPlayerTableau) {
    std::set<Card::CardType> scoredCards;
    int totalScore = 0;

    // Loop cards
    for (Card* card : _tableau) {
        // If the card type has not been scored yet, score it and add to set
        if (scoredCards.find(card->type()) == scoredCards.end()) {
            totalScore += card->score(_tableau, otherPlayerTableau);
            scoredCards.insert(card->type());
        }
    }

    _totalScore += totalScore;
    return totalScore;
}

// Clearing the player’s tableau
void clearTableau() {
    _tableau.clear();
}

// Printing the player’s tableau to the screen 
void printTableau() {
    std::cout << "Tableau for player " << _name << ": ";
    for (Card* card : _tableau) {
        std::cout << card->str() << " ";
    }
    std::cout << std::endl;
}

// Knows the player’s current total score
int Player::getTotalScore() const {
    return _totalScore;
}

// Knows the player’s name, randomly initialised from a fixed list
std::string Player::getName() const {
    return _name;
}
