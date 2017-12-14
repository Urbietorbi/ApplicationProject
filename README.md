# ApplicationProject
Job application project
Created by Edgars Urbans - Orbans
///////////////////////////////////////////////
  This is a web page - test with variable answer options created as a job application project wich consists of three pages.
Test selection, questions, answers, final answered question count and picked answers are interchanged between two SQL databases - 
questions (stores the subjects, questions and answers) and users(stores username, test taken, picked answers, total questions answered
and the final score).

    Page one.
Asks to input username and pick a test selecting distinct database "testname" entries. On submit, user is taken to test page. The username
and test name are "posted" to the second page.

    Page two.
Saves the username, testname to database "users" and returns a unique user id.
Gets all the questions based on the "testname" chosen and stores in an array "questions". At the moment questions are not randomized, but
the answer options are. Correct answer allways has index 4 (questions[4]), question has index 3 (questions[3]), which correspond to 
database entries answer1 (column index 4) and question (column index 3). If users picks a question with an index 4, score is incremented
by 1. On submit, index is saved to "users" database column q(x) coresponding to "questions" database column with index 2 named
"questionid" which stores q(x). Once all the questions are answered, final score and question count is sent to database "users" as well the
the final page, which prints the username and the test result.
