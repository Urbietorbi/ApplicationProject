

# ApplicationProject
Job application project
Created by Edgars Urbans - Orbans

///////////////////////////////////////////////

   This is a web page - test with variable answer options created as a job application project which consists of three pages. Test selection, questions, answers, final answered question count and picked answers are interchanged between two SQL tables - questions (stores the testname, questionid, questions and answers) and users(stores unique user id, username, testname, final score, total questions answered and picked answers).


Page one(index.php).

   Asks to input "username" and pick a test selecting distinct table "testname" entries. On submit, user is taken to the test page. The "username" and "testname" are posted to the second page(test.php).

Page two(test.php, test.js).

   Passes the "username" and "testname" to table "users" and returns a unique user "id". Gets all the questions and answers from table "questions" based on the "testname" (column index 2) chosen and stores in an array "questions". At the moment questions are not randomized, but the answer options are. 
   Question has array index 1 - "questions" table column "question", orrect answer always has array index 2, which correspond to "questions" table column "answer1". If user picks an answer with an index 2 (answer.id), "score" is incremented by 1. On submit, answer index is passed to "users" table (row selected using "id") columns (q1, q2, q3...) corresponding to "questions" table column "questionid". 
   Once all the questions are answered, "score" and answered question counter "total" is passed to table "users", as well the final page final.php, adding "username".

Page three(final.php).

   Receives "username" and the test result - "score"/"total". Prints received data to screen.

//////////////////////////////////////////////
