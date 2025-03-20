#pragma once
#include <iostream>
#include <vector>
#include <string>
#include "Card.h"
#include <set>


// Player class
class Player {
private:
    std::string _name;
    int _totalScore;
    CardCollection _tableau;
    vector<Card*> _hand{};
    
public:
    //player();
	~Player();
	std::string getPlayerName() const;
	std::string getRandomName();
	void getHand(Card* c);
	void printPlayerHand();
	int playerHandLength();
	void tableau(int index);

	void addingCardToTableau();
	void playerRound();
	void claenTableau();
	void printTableau();
};