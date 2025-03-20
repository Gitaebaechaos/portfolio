# Timeblocks App - Manual

# Installation

Git clone this repository and double click the timeblocks.py file to use the application.
The application developed in Python IDE. Therefore, Python pre-installed is required.

## Main interface

Upon opening the timeblock.py file the main interface is here for you:

![interface](docs/manual/interface.png)

### Add Tasks via CSV data file

Click the Import Data button. Inteface will prompt a window to you for csv file selection from the file system.

![import](docs/manual/import.png)

The format of the CSV should be as follows:

'task name:time'

Example:

Task1:1
Task2:5
Task3:10

An example CSV data file is included.

### Add Tasks manually

TO add a task, type in the task name in the field

![taskname](docs/manual/taskname.png)

Type in mintes allowed in the field

![taskmin](docs/manual/taskmin.png)

Sub tasks can be deleted by selecting them and click Delete Sub Task button

![delete](docs/manual/delete.png)




### Pausing timer

When you need to pause the running task, click the Pause Task button.

This will pause the timer.

![pause](docs/manual/pause.png)

### Continue the paused task
When a task starts running the pause button will switch to continue button display in the interface
When you need continue the paused task click Continue Task button.
![continue](docs/manual/continue.png)

### Extend the current running task
When need more time for the current task you can click Extend Task button to extend the current running task by 1 more minutes.
![extend](docs/manual/extend.png)

### Proceed to next task
After the running task times up interface will prompt you a notification let you know the current task times up. You can click ok to proceed to next task.
![proceed](docs/manual/proceed.png)


### Advance to next task
The current task is running and you would like to move on to count down next task, click Skip Current Task button

![advance](docs/manual/advance.png)


### Export sub task data

When you need to save sub tasks on your list for future usage, you can click the Export data button.

![export](docs/manual/export.png)

This will prompt window for you to type in a filename, select directory for where the data file you want to place in. This will save the remaining tasks to a CSV which can be imported later.

# Student information
Haozhuo Zheng,zhehy017,110311301
Callum Sproul, sprcr001, 110259011
Gitae Bae, baegy002, 110310861
