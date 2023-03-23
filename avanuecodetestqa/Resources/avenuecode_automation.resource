*** Settings ***
Library               SeleniumLibrary


*** Variables ***
${URL}                https://qa-test.avenuecode.io/
${login}              victorfonsecasp@gmail.com
${password}           Qualityassurance  


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser 

that the user is logged in to the ToDo App
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=//h1[contains(.,'QA Assessment')]
    Click Element    locator=//a[@class='btn btn-lg btn-primary'][contains(.,'Sign In')]
    Wait Until Element Is Visible    locator=//h4[contains(.,'Sign in')]
    Click Element    id=user_email
    Input Text    id=user_email    text=${login}
    Click Element    id=user_password
    Input Text    id=user_password    text=${password}
    Click Button    name=commit
    Wait Until Element Is Visible    locator=//div[@class='alert alert-info'][contains(.,'Signed in successfully.')]
    Element Should Be Visible    id=my_task

the user clicks on the "My Tasks" link on the NavBar
    Click Element    id=my_task
    Wait Until Element Is Visible    locator=//div[contains(@class,'task_container ng-scope')]

the user is redirected to a page with all the created tasks so far
    Element Should Be Visible    locator=//div[contains(@class,'task_container ng-scope')]

the user sees a message on the top part saying that list belongs to the logged user
    Page Should Contain Element   locator=//a[contains(.,'Welcome, Victor Hugo Fonseca!')]

the user creates a new task with at least three characters
    Click Element    id=new_task
    Input Text       id=new_task    text=This is an automated test description

the user adds the task to the list
    Click Element    locator=//span[contains(@class,'input-group-addon glyphicon glyphicon-plus')]

the new task is appended to the list of created tasks
    Page Should Contain Element    locator=//td[contains(.,'This is an automated test description')]

the user clicks on the "Manage Subtasks" button
    Click Button    locator=//button[@class='btn btn-xs btn-primary ng-binding'][contains(.,'(0) Manage Subtasks')]

the user should see a popup dialog with the task ID and task description
    Page Should Contain Element    locator=//h3[contains(@class,'modal-title ng-binding')]
    Page Should Contain Element    id=edit_task

the user should see a form to enter SubTask Description and Due Date
    Element Should Be Visible    id=new_sub_task
    Element Should Be Visible    id=dueDate

the user enters a valid SubTask Description and Due Date
    Click Element    id=new_sub_task
    Input Text       id=new_sub_task    text=This is an automated test subtask description
    Click Element    id=dueDate
    Input Text       id=dueDate         text=3/23/2023

the user clicks the "Add SubTask" button
    Click Button     id=add-subtask

the user should see the SubTask appended to the bottom of the modal dialog
    Element Should Be Visible    locator=//h4[contains(.,'SubTasks of this ToDo:')]
    Element Should Be Visible    locator=//a[@editable-text='sub_task.body'][contains(.,'This is an automated test subtask description')]

the user should see the number of SubTasks updated on the "Manage Subtasks" button
    Click Button    locator=//button[@class='btn btn-primary'][contains(.,'Close')]
    Element Should Be Visible    locator=//button[@class='btn btn-xs btn-primary ng-binding'][contains(.,'(1) Manage Subtasks')]

delete the user task
    Click Button    locator=//button[@class='btn btn-xs btn-danger'][contains(.,'Remove')]

the user should see his displayed message as "Hey John, this is your todo list for today:"
    Element Should Be Visible    locator=//a[contains(.,'Welcome, Victor Hugo Fonseca!')]

And the user can create a new task with shift + enter
    Click Element    id=new_task
    Input Text       id=new_task    text=This is an bug automated test description
    Press Keys       id=new_task    SHIFT+RETURN

the user try creating a new task with low than 3 letters it's possible to create
    Click Element    id=new_task
    Input Text       id=new_task    text=1
    Click Element    locator=//span[contains(@class,'input-group-addon glyphicon glyphicon-plus')]
    Page Should Contain Element    locator=//a[@editable-text='task.body'][contains(.,'1')]

should the user create a new task with limited words of 250, but its possible 254
    Click Element                  id=new_task
    Input Text                     id=new_task    text=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eleifend sem nulla, in gravida ipsum sagittis at. In tincidunt gravida nisi, interdum elementum diam. Pellentesque viverra tincidunt mollis. Nulla consequat, mi vel interdum malesuada123456
    Click Element                  locator=//span[contains(@class,'input-group-addon glyphicon glyphicon-plus')]
    Page Should Contain Element    locator=//a[@editable-text='task.body'][contains(.,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eleifend sem nulla, in gravida ipsum sagittis at. In tincidunt gravida nisi, interdum elementum diam. Pellentesque viverra tincidunt mollis. Nulla consequat, mi vel interdum malesuada123456')]

the user create a task with 254 words and try to edit, said that task cant be blank
    Click Element    locator=//a[@editable-text='task.body'][contains(.,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eleifend sem nulla, in gravida ipsum sagittis at. In tincidunt gravida nisi, interdum elementum diam. Pellentesque viverra tincidunt mollis. Nulla consequat, mi vel interdum malesuada123456')]
    Click Element    locator=//input[contains(@ng-model,'$data')]
    Input Text       locator=//input[contains(@ng-model,'$data')]    text=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eleifend sem nulla, in gravida ipsum sagittis at. In tincidunt gravida nisi, interdum elementum diam. Pellentesque viverra tincidunt mollis. Nulla consequat, mi vel interdum malesuada12345615125
    Click Button     locator=//button[contains(@type,'submit')]
    Element Should Be Visible    locator=//div[contains(@class,'editable-error help-block ng-binding')]

the user creates a subtask it's possible put inexistent datas on due date
    the user creates a new task with at least three characters
    the user adds the task to the list
    the new task is appended to the list of created tasks
    the user clicks on the "Manage Subtasks" button
    the user should see a form to enter SubTask Description and Due Date
    Click Element    id=new_sub_task
    Input Text       id=new_sub_task    text=This is an bug automated test subtask description
    Click Element    id=dueDate
    Input Text       id=dueDate    text=44/44/2023
    Click Button     id=add-subtask
    Element Should Be Visible    locator=//a[@editable-text='sub_task.body'][contains(.,'This is an bug automated test subtask description')]
    Click Button    locator=//button[@class='btn btn-primary'][contains(.,'Close')]


its possible to create an subtask with more than 250 words
    the user clicks on the "Manage Subtasks" button
    Click Element    id=new_sub_task
    Input Text       id=new_sub_task    text=text=Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eleifend sem nulla, in gravida ipsum sagittis at. In tincidunt gravida nisi, interdum elementum diam. Pellentesque viverra tincidunt mollis. Nulla consequat, mi vel interdum malesuada12345615125
    Click Button     id=add-subtask     
    Click Button    locator=//button[@class='btn btn-primary'][contains(.,'Close')]

its possible to create an subtask pressing enter Button
    the user clicks on the "Manage Subtasks" button
    the user should see a form to enter SubTask Description and Due Date
    Input Text       id=new_sub_task   text=This is an bug automated test description
    Press Keys       id=new_task       RETURN
    Click Button    locator=//button[@class='btn btn-primary'][contains(.,'Close')]
    
its possible to create an subtask without description
    the user clicks on the "Manage Subtasks" button
    the user should see a form to enter SubTask Description and Due Date
    Input Text       id=new_sub_task   text= 
    Click Button     id=add-subtask
    Click Button    locator=//button[@class='btn btn-primary'][contains(.,'Close')]

its possible to create an subtask without due date
    the user clicks on the "Manage Subtasks" button
    the user should see a form to enter SubTask Description and Due Date
    Click Element    id=new_sub_task
    Input Text       id=new_sub_task    text=This is an bug automated test subtask description
    Click Element    id=dueDate
    Input Text       id=dueDate    text= 
    Click Button     id=add-subtask
    Element Should Be Visible    locator=//a[@editable-text='sub_task.body'][contains(.,'This is an bug automated test subtask description')]
    Click Button    locator=//button[@class='btn btn-primary'][contains(.,'Close')]