#include <iostream>
#include "Card.h"
#include "string"

using namespace std;

// Return card type and set the case of the card type.
const std::string Card::printCardType() const {

	switch (*_type) {

	case Card::CardType::MakiRoll_1:
		return "MakiRoll (1)";
	case Card::CardType::MakiRoll_2:
		return "MakiRoll (2)";
	case Card::CardType::MakiRoll_3:
		return "MakiRoll (3)";
	case Card::CardType::Dumpling:
		return "Dumpling";
	case Card::CardType::NigiriEgg:
		return "Nigiri (Egg)";
	case Card::CardType::NigiriSalmon:
		return "Nigiri (Salmon)";
	case Card::CardType::NigiriSquid:
		return "Nigiri (Squid)";
	case Card::CardType::Sashimi:
		return "Sashimi";
	case Card::CardType::Tempura:
		return "Tempura";
	}

}