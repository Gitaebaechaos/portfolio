# Gitae Bae, 110310861, baegy002@mymail.unisa.edu.au


import json
from utils import *
from dataclasses import dataclass
from interactive_console_client import InteractiveConsoleClient

###################################################################################################
# Introduction                                                                                    #
###################################################################################################

# This project implements an application that manages answers to questions.
#
# Requires python >=3.6 and pytest
#
# To run, execute `python main.py` or run the `pytest` tests
#
# The architecture uses layers to separate Client application, Business logic, Resource Abstractions
# and Data Stores.
#

###################################################################################################
# Manager class                                                                                   #
###################################################################################################

class QuestionAnswerManager:
    """Manage the process of answering a question"""

    def __init__(self):

        self.matchingEngine = MatchingEngine()
        self.log = QuestionLogAccess()

    def answer_question(self, question):
    
        self.canditate = self.matchingEngine.calculateSimplarityScore(question)

        if self.canditate.score == 0.0:
            self.log.logAccessTextWrite(question, "")            
            return (False, self.canditate.score)
        self.log.logAccessTextWrite(question, self.canditate.answer)
        return (self.canditate, self.canditate.score)


###################################################################################################
# MatchingEngine class                                                                                   #
###################################################################################################

class MatchingEngine:
    """Process questions and matching them"""

    def __init__(self):

        self.catalogueAccess = CatalogueAccess()
        self.candidateList = []
        self.questionList = self.catalogueAccess.getStoredQuestion()
        self.answersList = self.catalogueAccess.getStoredAnswer()

    def calculateSimplarityScore(self, question):

        self.qa = 0
        self.questionWord = self.contentFormat(question)
        while self.qa < len(self.questionList):
            self.candidateList.append(Candidate(self.questionList[self.qa], self.answersList[self.qa],jaccard_similarity_score(self.questionWord, self.contentFormat(self.questionList[self.qa]))))
            self.qa += 1
        
        return self.getConnect()

    def getConnect(self):

        self.candidateList.sort(key=lambda x: x.score, reverse=True)
        self.candidate = self.candidateList[0]
        self.candidateList = []
        return self.candidate
    
    def contentFormat(self, content):

        self.punctuation = strip_punctuation(content)
        self.words = text_to_words(self.punctuation)
        self.lowercase = words_to_lowercase(self.words)
        return self.lowercase


###################################################################################################
# CatalogueAccess class                                                                                   #
###################################################################################################

class CatalogueAccess:
    """In order to access the questions and answers in a faq.json file"""
    def __init__(self):

        self.questionCatalogue = []
        with open('faq.json') as faq:
            self.questionCatalogue = json.load(faq)

    def getStoredQuestion(self):
        
        self.questionList = []
        for pair in self.questionCatalogue:
            self.questionList.append(pair["question"])

        return self.questionList

    def getStoredAnswer(self):
        
        self.answerList = []
        for pair in self.questionCatalogue:
            self.answerList.append(pair["answer"])

        return self.answerList


###################################################################################################
# LogAccess class                                                                                   #
###################################################################################################

class QuestionLogAccess:
    """Manage the log text file"""
    def __init__(self):
        pass

    def logAccessTextWrite(self, question, answer):

        with open('asked_questions_log.txt', 'a') as logAccessWrite:
            logAccessWrite.write(f"Question: {question} Answer: {answer}\n")
    
    def logAccessTextRead(self):

        self.logAccessContentList = []
        with open('asked_questions_log.txt', 'r') as logAccessRead:
            for i in logAccessRead.readlines():
                self.logAccessContentList.append(i.rstrip())
        
        return self.logAccessContentList


###################################################################################################
# Candidate class                                                                                   #
###################################################################################################

@dataclass
class Candidate:
    """Correspond to a candidate question, answer, score"""
    question: str
    answer: str
    score: int

###################################################################################################
# main function                                                                                   #
###################################################################################################

def main(candidates_path, questions_log_path):
    
    manager = QuestionAnswerManager()
    
    client = InteractiveConsoleClient(manager)
    client.run()


if __name__ == '__main__':
    main("faq.json", "asked_questions_log.txt")
