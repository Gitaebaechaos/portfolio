#include <string>
#include <iostream>
#include "Card.h"
#include "Game.h"
#include "Player.h"
using namespace std;

using std::string;
using std::vector;

int main()
{
	//Game
	Game g{};
	g.startGame();
	g.proceedGame();

	return 0;
}

