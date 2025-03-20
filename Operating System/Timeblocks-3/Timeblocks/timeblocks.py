# -*- coding: utf-8 -*-
from tkinter import *
import tkinter.filedialog
import tkinter.messagebox
import csv


class Timeblocks:
    def __init__(self):
        
        self.window = Tk()
        self.window.geometry('500x600+300+20')
        self.window.title("Timeblocks")
        self.window.configure(bg='#87CEEB')

        # Default variables
        self.currentTime = -1
        self.timeID = None
        self.bpause = False

        #Timer label for display a title
        self.timerLabel = Label(self.window,text="Timer",width=50,height=1,anchor=W,bg='#00ff00')
        self.timerLabel.place(x=20,y=20)

        #for display the countdown time.
        self.countDownTimer = Label(self.window,text="00:00", font=("Helvetica", 50, "bold"))
        self.countDownTimer.place(x=150,y=50)

        self.taskLabel = Label(self.window,text="Running Timer For Task:")
        self.taskLabel.place(x=150,y=150)

        self.pauseBtn = Button(self.window,text="Pause")
        self.pauseBtn.place(x=150,y=180)
        self.pauseBtn.configure(command=self.pauseTimer)

        self.itemLabel = Label(self.window,text="Agenda Item",width=50,height=1,anchor=W,bg='#00ff00')
        self.itemLabel.place(x=20,y=220)

        self.itemNameLabel = Label(self.window,text="Sub Task Name: ")
        self.itemNameLabel.place(x=20,y=260)
        self.itemName = Entry(self.window)
        self.itemName.place(x=150,y=260)

        self.itemTimeLabel = Label(self.window,text="Time Allowed(mins): ")
        self.itemTimeLabel.place(x=20,y=290)
        self.itemTime = Entry(self.window)
        self.itemTime.place(x=150,y=290)

        self.addItemBtn = Button(self.window,text="Add Task")
        self.addItemBtn.place(x=320,y=270)
        self.addItemBtn.configure(command=self.addTask)

        self.extendBtn = Button(self.window,text="Extend Task")
        self.extendBtn.place(x=220,y=180)
        self.extendBtn.configure(command=self.extend)

        self.advanceBtn = Button(self.window,text="Skip Current Task")
        self.advanceBtn.place(x=310,y=180)
        self.advanceBtn.configure(command=self.advance)

        self.deleteTaskBtn = Button(self.window,text="Delete Sub Task")
        self.deleteTaskBtn.place(x=200,y=560)
        self.deleteTaskBtn.configure(command=self.deleteTask)

        self.importBtn = Button(self.window,text="Import File")
        self.importBtn.place(x=380,y=350)
        self.importBtn.configure(command=self.importFile)
        self.exportBtn = Button(self.window,text="Export File")
        self.exportBtn.place(x=380,y=400)
        self.exportBtn.configure(command=self.exportFile)


        self.taskList = Listbox(self.window,selectmode=SINGLE)
        self.taskList.place(x=150,y=320,width=200,height=230)

    def countDown(self):
        if self.currentTime >= 0:
            min = self.currentTime / 60
            sec = self.currentTime % 60
            t = "%02d:%02d"%(min,sec)
            self.countDownTimer.configure(text=t)
            self.currentTime -= 1
        else:
            if self.taskList.size() > 0:
                item = self.taskList.get(0)
                self.taskList.delete(0)
                items = item.split(':')
                self.taskLabel.configure(text='Running Timer For Task: '+items[0])
                self.currentTime = int(items[1]) * 60
        self.timeID = self.countDownTimer.after(1000, self.countDown)

    def addTask(self):
        name = self.itemName.get()
        t = self.itemTime.get()
        if len(name) > 0 and t.isdigit():
            if int(t) > 0:
                self.taskList.insert(END,name+" : "+t)

    # Pauses the current timer event
    def pauseTimer(self):
        self.bpause = True
        self.countDownTimer.after_cancel(self.timeID)
        # Sets the label of the continue button and configures its method link to continue.
        self.pauseBtn.configure(command=self.continueTimer, text="Continue")

    def continueTimer(self):
        if self.bpause:
            self.bpause = False
            self.timeID = self.countDownTimer.after(1000, self.countDown)
            # Sets the label of the pause button and configures its method link to pause.
            self.pauseBtn.configure(command=self.pauseTimer, text="Pause")

    def extend(self):
        if self.taskList.size() > 0 or self.currentTime > 0:
            # Update current time by 1 minute.
            self.currentTime += 60
            # Convert seconds to minutes.
            min = self.currentTime / 60
            sec = self.currentTime % 60
            t = "%02d:%02d"%(min,sec)
            # Change timer display.
            self.countDownTimer.configure(text=t)

    def advance(self):
        # Processing the next task if a current task is running and another task exists.
        if self.taskList.size() > 0 and self.currentTime > 0:
            item = self.taskList.get(0)
            self.taskList.delete(0)
            items = item.split(':')
            self.taskLabel.configure(text='Running Timer For Task: '+items[0])
            self.currentTime = int(items[1]) * 60
        # If there is a current task, but no future tasks.
        elif self.currentTime > 0:
            self.taskLabel.configure(text='Running Timer For Task: ')
            self.currentTime = -1
            self.countDownTimer.configure(text="00:00")

    def deleteTask(self):
        index = self.taskList.curselection()
        if index != -1:
            self.taskList.delete(index)

    def importFile(self):
        self.taskList.delete(0,END)
        filetypes = [("CSV", "*.csv")]
        filename = tkinter.filedialog.askopenfilename(filetypes=filetypes)
        if filename != '':
            with open(filename) as f:
                fcsv = csv.reader(f)
                for line in fcsv:
                    self.taskList.insert(END, line[0])

    def exportFile(self):
        filetypes = [("CSV", "*.csv")]
        filenewpath = tkinter.filedialog.asksaveasfilename(title='save file',
                                                filetypes=filetypes,
                                                defaultextension='.csv')
        if filenewpath != '':                
            # Opening with 'w+' clears the contents of the file.                        
            with open(filenewpath, 'w+', newline='') as f:
                fcsv = csv.writer(f, quoting=csv.QUOTE_ALL)
                for i in range(self.taskList.size()):
                    fcsv.writerow([self.taskList.get(i)])


# Run main file and initiate tkinter mainloop
if __name__ == "__main__":
    timeblocks = Timeblocks()
    timeblocks.countDown()
    mainloop()
