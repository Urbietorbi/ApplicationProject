# ApplicationProject
Job application project
Created by Edgars Urbans - Orbans

///////////////////////////////////////////////

This is a web page - test with variable answer options created as a job application project which consists of three pages. Test selection, questions, answers, final answered question count and picked answers are interchanged between two SQL tables - questions (stores the testname, questionid, questions and answers) and users(stores unique user id, username, testname, final score, total questions answered and picked answers).


Page one(index.php).

Asks to input "username" and pick a test selecting distinct table "testname" entries. On submit, user is taken to the test page. The "username" and "testname" are posted to the second page(test.php).

Page two(test.php, test.js).

Passes the "username" and "testname" to database "users" and returns a unique user "id".
Gets all the questions and answers from table "questions" based on the "testname" chosen and stores in an array "questions". At the moment questions are not randomized, but the answer options are. Correct answer always has index 2 (questions[2]), question has index 1 (questions[1]), which correspond to "questions" table entries "answer1" (column index 4) and "question" (column index 3). If user picks an answer with an index 2, "score" is incremented by 1. On submit, answer index is passed to "users" table (row selected using "id") columns (q1, q2, q3...) corresponding to "questions" table column "questionid" (column index 4) selecting row by "id" using GET method to sendData.php. 
Once all the questions are answered, "score" and answered question counter "total" is passed to table "users" usinng GET method to sendFinal.php as well the final page final.php, adding "username".

Page three(final.php).

Receives "username" and the test result - "score"/"total". Prints received data to screen.

//////////////////////////////////////////////
