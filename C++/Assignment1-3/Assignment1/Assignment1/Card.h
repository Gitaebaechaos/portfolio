#pragma once
#include <iostream>
#include <vector>
#include <string>

using namespace std;

// Card class
class Card 
{
public:
    // Define an enum for the type of card it represents
    enum CardType 
    { 
        MakiRoll_1,
        MakiRoll_2,
        MakiRoll_3,
        Tempura, 
        Sashimi, 
        Dumpling, 
        NigiriEgg,
        NigiriSquid,
        NigiriSalmon
    };

    Card(CardType ctype) :
        _type{ ctype } {}

    const CardType& type() const { return _type; }
    

    const std::string printCardType() const;

    //virtual ~Card() {}

    //Add a function that returns the type of card as a string
    virtual string str() const = 0;

    //Each type of card should be able to calculate a score for all the 
    //cards of its type in that collection.Use the following abstract signature in the card class
    virtual int score(CardCollection tableau, CardCollection otherPlayerTableau) const = 0;
protected:
    CardType _type;
};
/*
class MakiRoll_1 : public Card {
public:
    MakiRoll_1() :
        Card(Card::CardType::MakiRoll_1) {}
    
    virtual string str() const override {
        return "MakiRoll_1";
    }
   
}; 
*/
// type def-ing a card collection
typedef std::vector<Card*> CardCollection;
