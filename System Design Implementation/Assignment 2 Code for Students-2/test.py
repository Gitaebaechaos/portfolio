import pytest
import json
from utils import *
from main import CatalogueAccess, QuestionLogAccess, QuestionAnswerManager

def questionAnswerManagerTest ():
    assert QuestionAnswerManager.answer_question("fjehjhdosi")

def accessTest():
    QuestionLogAccess.logAccessTextWrite("which day is it?", "Monday")
    readTestOutput = "Question: which day is it? Answer: Monday"
    readOutput = (QuestionLogAccess.logAccessTextRead())
    lastline = readOutput[len(readOutput)-1]
    assert (lastline == readTestOutput)

def questionTest():
    questionsList = ['What day is today?', 'What is the weather like today?', 'Will the weather be sunny today?', 'Did it snow yesterday?']
    print(CatalogueAccess.getStoredQuestion())
    assert (CatalogueAccess.getStoredQuestion() == questionsList)

def answerTest():
    answersList = ['Monday', 'Same as yesterday.', 'Maybe.', 'No.']
    print(CatalogueAccess.getStoredAnswer())
    assert (CatalogueAccess.getStoredAnswer() == answersList)

Content = "Which day is it?"
Punctuation = "Which day is it "
wordList = ["Which", "day", "is", "it"]
lowercaseList = ["which", "day", "is", "it"]
jaccardList = ["which", "day", "is", "it"]

def punctuationTest():
    print(strip_punctuation(Content))
    PunctuationTest = strip_punctuation(Content)
    assert (PunctuationTest == Punctuation)

def wordTest():
    WordTest = text_to_words(Punctuation)
    print (text_to_words(Punctuation))
    assert (WordTest == wordList)

def lowercaseTest():
    LowercaseTest = words_to_lowercase(wordList)
    print (words_to_lowercase(wordList))
    assert (LowercaseTest == lowercaseList)
    
def JaccardTest():
    print (jaccard_similarity_score(lowercaseList, jaccardList))
    assert (jaccard_similarity_score(lowercaseList, jaccardList) == 1.0)
