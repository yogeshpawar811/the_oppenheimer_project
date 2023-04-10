# The Oppenheimer Project Automation


### What is Robot Framework? ###

Robot framework is a python based, open source test automation framework with great extensibility. Robot framework is cross platform and will run on Mac, Linux and Windows. 

See [here ](https://robotframework.org/)for Robot Framework home page


### What exactly is this? ###

A basic Robot Framework API test suite with the following tests:

* 001_Post_Insert_Single_Record
* 002_Post_Insert_Multiple_Record
* 003_Upload_CSV_File
* 004_AC1_AC2_GET_TaxReliefCalculation
* 004_AC3_AC4_AC5_AC6_TaxReliefCalculation
* 005_dispense_tax_relief

The following supporting librarys are used in this suite alongside some of the built in librarys...

[BrowserLibrary](https://github.com/MarketSquare/robotframework-browser)

[RequestsLibrary](https://github.com/bulkan/robotframework-requests)
  
[DataDriver](https://github.com/Snooz82/robotframework-datadriver)



### How do I get set up? ###

1. Clone or download this repository [The Oppenheimer Project](https://github.com/strengthandwill/oppenheimer-project-dev)
2. Install [Python 3](https://python.org/)
3. To run the application, issue the following to your terminal. Replace `{path-to-this-jar}` with your actual path to the folder containing the jar 
```
java -jar {path-to-this-jar}/OppenheimerProjectDev.jar
```
4. Give it a min or two to boot up and you should be able to visit the app and API interface here:
```
http://localhost:8080/
http://localhost:8080/swagger-ui.html
```
5. Using the command line navigate in to the project folder and execute the command 
```
pip install -r requirements.txt
``` 
   this will install robot framework and the required supporting library's and their dependencies

6. Once everything has been installed you can run the test suite from the command line in the projects folder with the command
```
robot testscripts
``` 
7. After the execution you can find '''report.html''' file, which contains report of test execution ![image](https://user-images.githubusercontent.com/20729169/230257290-1c3d8daf-e80c-4ba9-a833-288cbf1e6d2e.png)





### Who do I talk to? ###

* Yogesh Pawar - [LinkedIn](https://www.linkedin.com/in/yogesh-pawar-73a99856/)
