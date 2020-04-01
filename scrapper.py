import requests
from bs4 import BeautifulSoup
import sqlite3
from sqlite3 import Error

WORLDS = []
URL_BASE = "https://codycross.info"

def getWorlds():
    response = requests.get(URL_BASE + '/es')

    soup = BeautifulSoup(response.content, 'html.parser')

    getElements = soup.find_all("h2", "world")

    for element in getElements:
        WORLDS.append(element['id'])

def getGroupsByWorld(world):

    response = requests.get(URL_BASE + "/es/" + world)
    
    soup = BeautifulSoup(response.content, 'html.parser')

    getGroups = soup.find_all("li", "c_title")

    groups = []

    for element in getGroups:
        groups.append(element.a["href"])
    
    return groups

def getPhaseByGroup(group):

    response = requests.get(URL_BASE + group)

    soup = BeautifulSoup(response.content, 'html.parser')

    getPhases = soup.find_all("li", "packs")
    
    phases = []

    for element in getPhases:
        phases.append(element.a["href"])

    return phases

def getAnswersByPhase(phase):
    
    response = requests.get(URL_BASE + phase)

    soup = BeautifulSoup(response.content, 'html.parser')

    titleAnswers = soup.find_all("p")
    responseAnswers = soup.find_all("div", "alert alert-success")

    questions = []
    answers = []

    for element in titleAnswers:
        if element.a:
            questions.append(element.a.get_text())

    for element in responseAnswers:
        answers.append(element.get_text())

    conectionDatabase = sql_connection()

    for index in range(len(questions)):
        conectionDatabase.execute("insert into questions(question, answer) values (?,?)", (questions[index], answers[index]))
        conectionDatabase.commit()

def sql_connection():
    
    try:

        con = sqlite3.connect('codydatabase.db')

        con.execute(''' CREATE TABLE IF NOT EXISTS questions (
                            id integer primary key AUTOINCREMENT,
                            question text,
                            answer text    
                        )
                    ''')

        return con

    except Error:

        print(Error)


if __name__ == "__main__":

    getWorlds()
    print("Obteniendo mundos...")

    for world in WORLDS:
        print("Obteniendo grupos de "+ world)
        groupsByWorld = getGroupsByWorld(world)

        for groupByWorld in groupsByWorld:
            print("Obteniendo fases de "+ groupByWorld+ " en mundo " + world)
            phasesByGroup = getPhaseByGroup(groupByWorld)

            for phaseByGroup in phasesByGroup:
                print("Obteniendo respuestas de " +phaseByGroup + " en mundo " + world)
                getAnswersByPhase(phaseByGroup)



    