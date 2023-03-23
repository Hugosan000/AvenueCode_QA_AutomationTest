# AvenueCode_QA_AutomationTest
Repository created for the job interview at Avenue Code, where it was necessary to automate a ToDo Tasks application and survey ticket openings and API tests

# Expleo_XE_QA_WEB_CHALLANGE ![image](https://user-images.githubusercontent.com/61331185/201559814-b0e1eb6a-bec3-40c3-a7ff-4941b7e5adf5.png)

This repository was created for the purpose of performing the requested WEB QA test.  This test consists of performing 5 test cases for the money conversion area on the https://www.xe.com/ website and automating them using test reporting frameworks and Cucumber.

Automation was created using Python 3.11.0 with Selenium 4.6.0, Pytest 7.2.0, Pytest-html 3.2.0, Cucumber-tag-Expression 4.1.0, Behave 1.2.6

Links to the tools used and their documentation.

[Python](https://www.python.org)

[Geckodriver v0.32.0](https://github.com/mozilla/geckodriver/releases)

[Firefox](https://www.mozilla.org/pt-BR/firefox/new/)



[Selenium](https://selenium-python.readthedocs.io/installation.html):

```
pip install selenium

```
[Pytest](https://pypi.org/project/pytest/):
```
pip install pytest
```
[Pytest HTML](https://pypi.org/project/pytest-html/):
```
pip install pytest-html
```
[Cucumber](https://pypi.org/project/cucumber-tag-expressions/):
```
pip install cucumber-tag-expressions
```
[Behave](https://behave.readthedocs.io/en/stable/install.html):
```
pip install behave
```
>After cloning the repository, open it in your desired text editor, in my case I will be using VScode.

With the repository downloaded and the libraries installed, take the Geckodriver downloaded earlier and place it in the root folder of your Python, it will probably be on disk C:, by doing this Selenium will find the file and run the automation.
![image](https://user-images.githubusercontent.com/61331185/201555111-efa95a1f-9155-4679-acbf-45cce84376a4.png)

Now inside VSCode, when opening the terminal we can run our automation in 3 ways.
Using the command
```
pytest .\xetest.py
```
It will start the automation in Selenium, automatically open the firefox pages and run the entire process of the automated test flow, and finally after 5-7 minutes it will finish the process and run the simple report in the terminal itself.

![image](https://user-images.githubusercontent.com/61331185/201556337-b9b0c3aa-d7d6-45f4-bef1-3fc46eb6f96a.png)



It will cause the script inside the python file xetest.py to run, running the 6 test scenarios which are:

✔Scenario: Logo is visible

✔Scenario: Successfully converting 50 dollars to pounds

✔Scenario: Successfully converting 50 Brazilian  Real to Japanese Yen

✔Scenario: Inserting words instead of numbers in the Amount field

✔Scenario: Performing a Pounds to Argentine Pesos conversion with wrong result

✔Scenario: Performing the conversion from BRL to YEN and then reversing the conversion using the "Swap currencies" button

The test scenarios will be inside the features folder in the file bdds.features where they will be referenced and it is also possible to see all the bdds and their steps in full.

![image](https://user-images.githubusercontent.com/61331185/201555987-baa98e08-8af2-4902-9007-15c46d17a732.png)


Also in the features folder, we can also see the steps folder where we will find the commands.py file where we will create the custom commands to be used for each BDD in the main automation sheet.
![image](https://user-images.githubusercontent.com/61331185/201556150-65034353-ecc4-4d95-be66-d51aa39b6451.png)

Back in the terminal, inside the Expleo folder, it is also possible to start the automation by running the command
```
pytest --alluredir=''C:\Expleo\allurereports'' .\xetest.py
```
If the cloned project is in directory C:/ as the command above, it will be working perfectly, if it is in another directory it will be necessary to enter the path from where the repository is located and change it on the command line.

After finishing the automation process, you will see that the allurereports folder is populated with prints and jsons files, allowing for a report of the automation and prints of when the step is finished.
![image](https://user-images.githubusercontent.com/61331185/201558414-a52cd642-e56c-4bb4-ab6c-f71620e32c7a.png)

Now in the terminal, either CMD or vscode terminal, enter the command
```
allure serve C:\Expleo\allurereports
```
![image](https://user-images.githubusercontent.com/61331185/201558547-79e5e9e1-0756-4e25-808d-d21528f79f72.png)

After that, an html file will be created inside the allurereports folder where it is possible to better visualize the tests report, if typed incorrectly Allure will create an html file but with empty information.

![image](https://user-images.githubusercontent.com/61331185/201558660-e15dbfd1-805a-4031-a62b-11d908823248.png)

It will also create a file called allure.py inside the root folder where your python is installed, making it possible to edit some information as well.
![image](https://user-images.githubusercontent.com/61331185/201558799-9214f1f5-0f03-4da6-bc8a-5c2a7a575480.png)
![image](https://user-images.githubusercontent.com/61331185/201558831-0e4061ff-0e46-46b0-9080-170cd45ec4e5.png)


>My Allure does not work and I still need a report to pass on to all the other collaborators in a single report, what do I do now?🤯


Not to despair, Allure is currently an unstable technology for test reporting so as a precaution I also installed the Python HTML reporter, which will create a unique HTML report for our automation.
It is also possible to change the layout of this report page in the generated .css file if you want too.

To be running this function, simply in your terminal within the root folder of the project run the command:
```
pytest --html=report .\xetest.py
```
This will cause that after the tests are run, a .html file called report will be created in the root folder of your system, where it will be possible to open it with the browser and share it with all collaborators.
![image](https://user-images.githubusercontent.com/61331185/201559590-ba98f374-6b15-447a-994b-9988ed196b51.png)

Having accomplished all this process, your automation will already be functional and with reports available and with the scripts oriented to BDD, if you have any questions I'll be available! 😁

![ExpleoAuto](https://user-images.githubusercontent.com/61331185/201561602-d25f8513-f501-4f34-9e4b-e1127db1cf29.gif)


