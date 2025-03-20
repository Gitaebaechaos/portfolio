#include "Game.h"
#include "Card.h"
#include "Player.cpp"
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <random>

using namespace std;
using std::vector;

Card::Card() :
    cards {}
{
    std::pair<Type*, int> types[] = {
        { new Type(Tempura), 14 },
        { new Type(Sashimi), 14 },
        { new Type(Dumpling), 14 },
        { new Type(Nigiri_Egg), 5 },
        { new Type(Nigiri_Squid), 5 },
        { new Type(Nigiri_Salmon), 10 },
        { new Type(MakiRoll_1), 6 },
        { new Type(MakiRoll_2), 12 },
        { new Type(MakiRoll_3), 8 }
    };

void initializeGame(int numPlayers) {
    // Initialize players
    Game::_numPlayers = numPlayers;
    _players.resize(numPlayers);

    // Create and shuffle game deck
    _gameDeck.clear();
    // Add cards to game deck

    // Shuffle game deck
    std::vector<Card*> shuffleDeck{ _gameDeck.begin(), _gameDeck.end() };
    std::shuffle(shuffleDeck.begin(), shuffleDeck.end(), std::mt19937{ std::random_device{}() });
    _gameDeck = CardCollection{ shuffleDeck.begin(), shuffleDeck.end() };


    int Game::getCurrentRound() const
    {
        return _currentRound;
    }

    int Game::getCurrentTurn() const
    {
        return _currentTurn;
    }

    int Game::getCurrentPlayer() const
    {
        return _currentPlayer;
    }

    int Game::getNumPlayers() const
    {
        return _numPlayers;
    }

    // Function to display the tableau of a player
    void displayTableau(const vector<string>& tableau) {
        cout << "Tableau:" << endl;
        for (const string& card : tableau) {
            cout << card << endl;
        }
    }

    int main() {
        vector<string> player1Tableau; // Player 1's tableau
        vector<string> player2Tableau; // Player 2's tableau
        string currentPlayer = _name; // Current player
        int roundNumber = 1; // Current round number

        // Output the initial state
        cout << "PLAYER" + currentPlayer + "round score: 0" << endl;
        cout << "~~~ round " << roundNumber << "/3 ~~~" << endl;
        cout << "PLAYER Sasha TURN" << endl;
        displayTableau(player1Tableau);
        cout << "Current hand:" << endl;
        cout << "1. MakiRoll (2)" << endl;
        cout << "2. Dumpling" << endl;
        cout << "3. Nigiri (Egg)" << endl;
        cout << "4. Sashimi" << endl;
        cout << "5. Nigiri (Egg)" << endl;
        cout << "6. MakiRoll (2)" << endl;
        cout << "7. Sashimi" << endl;
        cout << "8. Sashimi" << endl;
        cout << "9. Nigiri (Egg)" << endl;
        cout << "10. Tempura" << endl;

        // Game loop
        while (roundNumber <= 3) {
            int selectedCardIndex;
            vector<string>& currentPlayerTableau = (currentPlayer == "Sasha") ? player1Tableau : player2Tableau;

            // Get the selected card index from the current player
            cout << "Select a card to add to your tableau: ";
            cin >> selectedCardIndex;

            // Add the selected card to the current player's tableau
            currentPlayerTableau.push_back("Card " + to_string(selectedCardIndex));

            // Switch to the other player
            if (currentPlayer == _name) {
                currentPlayer = _name;
            }
            else {
                currentPlayer = _name;
                roundNumber++;
            }

            // Output the state for the next player's turn
            cout << "PLAYER " << currentPlayer << " TURN" << endl;
            displayTableau(currentPlayerTableau);
            cout << "Current hand:" << endl;
        }

        return 0;
    }
