*** Settings ***
Documentation   Test case for US#1 - Create Task
Resource         ../Resources/avenuecode_automation.resource
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Case 01: Create Task
    Given that the user is logged in to the ToDo App
    When the user clicks on the "My Tasks" link on the NavBar
    Then the user is redirected to a page with all the created tasks so far
    And the user sees a message on the top part saying that list belongs to the logged user
    And the user creates a new task with at least three characters
    And the user adds the task to the list
    And the new task is appended to the list of created tasks

Case 02: Create Subtasks
    Given that the user is logged in to the ToDo App
    When the user clicks on the "My Tasks" link on the NavBar
    Then the user is redirected to a page with all the created tasks so far
    And the user clicks on the "Manage Subtasks" button
    Then the user should see a popup dialog with the task ID and task description
    And the user should see a form to enter SubTask Description and Due Date
    When the user enters a valid SubTask Description and Due Date
    And the user clicks the "Add SubTask" button
    Then the user should see the SubTask appended to the bottom of the modal dialog
    And the user should see the number of SubTasks updated on the "Manage Subtasks" button
    Then delete the user task

Case 03: Bugs found
    Given that the user is logged in to the ToDo App
    When the user clicks on the "My Tasks" link on the NavBar
    Then the user is redirected to a page with all the created tasks so far
    # This tests when entering /Tasks, the message above the list of tasks is {{username}} TodoList, different from the acceptance term that asks for "Hey Victor Hugo Fonseca this is your todo list for today"
    Then the user should see his displayed message as "Hey John, this is your todo list for today:" 
    # This tests entering a new task with shift + enter button
    And the user can create a new task with shift + enter
    # This tests creating a new task with 1 letter
    When the user try creating a new task with low than 3 letters it's possible to create
    # This tests creating a new task with 254 words
    Then should the user create a new task with limited words of 250, but its possible 254
    # This tests editing a task for more words and the message is wrong
    When the user create a task with 254 words and try to edit, said that task cant be blank
    # This tests the data error
    When the user creates a subtask it's possible put inexistent datas on due date
    # This tests the subtask description with more than 250 words
    And its possible to create an subtask with more than 250 words
    # This tests that is possible to create an subtask pressing the enter button that goes against the acception criterys
    And its possible to create an subtask pressing enter Button
    # This tests that its possible to create an subtask without the description, and it goes with empty status
    And its possible to create an subtask without description
    # This tests verify that its possible to create an subtask without the due date
    And its possible to create an subtask without due date