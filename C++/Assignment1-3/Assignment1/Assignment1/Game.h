#pragma once
#include "Card.h"
#include "Player.h"
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <random>

// Game class
class Game {
    vector<Card*> cards;

private:
    static Game* _instance;
    CardCollection _gameDeck;
    int _currentRound;
    int _currentTurn;
    int _currentPlayer;
    int _numPlayers;
    int _maxRound;
    std::vector<Player> _players;

    Game() {
        _currentRound = 0;
        _currentTurn = 0;
        _currentPlayer = 0;
        _numPlayers = 0;
    }

public:
    void suffle();
    void print_deck() const;
    Card* getCard();

    static Game* getInstance() {
        if (_instance == nullptr) {
            _instance = new Game();
        }
        return _instance;
    }
    Game();

    ~Game();
    void nextRound();
    void proceedGame();
    void startGame();
    void getNewPlayers();
    void suffleDeck();
    void givePlayer();
    void roundUpdate();
    Player* getPlayer1();
    Player* getPlayer2();
    void Player1Hand();
    void player2Hand();

    int getCurrentRound() const;
    int getCurrentTurn() const;
    int getCurrentPlayer() const;
    int getNumPlayers() const;

};
 