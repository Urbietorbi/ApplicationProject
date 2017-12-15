# ApplicationProject
Job application project
Created by Edgars Urbans - Orbans

///////////////////////////////////////////////

This is a web page - test with variable answer options created as a job application project which consists of three pages. Test selection, questions, answers, final answered question count and picked answers are interchanged between two SQL databases - questions (stores the testname, questionid, questions and answers) and users(stores unique user id, username, testname, final score, total questions answered and picked answers).


Page one(index.php).

Asks to input "username" and pick a test selecting distinct database "testname" entries. On submit, user is taken to the test page. The "username" and "testname" are posted to the second page(test.php).

Page two(test.php, test.js).

Passes the "username" and "testname" to database "users" and returns a unique user "id".
Gets all the questions and answers based on the "testname" chosen and stores in an array "questions". At the moment questions are not randomized, but the answer options are. Correct answer always has index 4 (questions[4]), question has index 3 (questions[3]), which correspond to "questions" database entries "answer1" (column index 4) and "question" (column index 3). If user picks an answer with an index 4, "score" is incremented by 1. On submit, answer index is passed to "users" database (row selected using "id") columns (q1, q2, q3...) corresponding to "questions" database column "questionid" (column index 2) by posting the answer index and "id" to sendData.php.
Once all the questions are answered, "score" and answered question counter "total" is passed to database "users" by posting values to sendFinal.php as well the final page final.php, adding "username".

Page three(final.php).

Receives "username" and the test result - "score"/"total". Prints received data to screen.

//////////////////////////////////////////////

Progress notes.

Server settings are explict at the moment, changes have been done on permissions, files uploading soon.
Main files messy: 
  - test.php has hidden input fields and a function tha sends some data.. Those will be replaced with one function call that sends all the user data and a second function call that gets the question data.
  - test.js has 3x repeating code (sendData(), SendFinal, and submit() else clause) that sends data to database and final page.. One function (sendData) will be called 3 times with different arguments.
