## Turing Machine Generator:

> [!TIP]
> <strong> If you are familiar with what a turing machine is, you can skip directly to the "Screenshots and How to Use" section <br>
> to familiarize yourself with the software. </strong>




Alan Turing in his 1936 research paper, "On Computable Numbers, with an Application to the Entscheidungsproblem" defined the concept of what is now known as a "Turing Machine".
Turing's paper majorly dealt with the "computability" of a number, and aiming to find whether the [Entscheidungsproblem](https://en.wikipedia.org/wiki/Entscheidungsproblem) is solvable.

```
The "computable" numbers may be described briefly as the real numbers whose expressions as a decimal are calculable by finite means.
Although the subject of this paper is ostensibly the computable numbers. It is almost equally easy to define and investigate
computable functions of an integral variable or a real or computable variable, computable
predicates, and so forth. The fundamental problems involved are, however, the same in each case, and I have chosen the
computable numbers for explicit treatment as involving the least cumbrous technique. I hope shortly to give an account
of the relations of the computable numbers, functions, and so forth to one another.
This will include a development of the theory of functions of a real variable expressed in terms of computable numbers.
According to my definition, a number is computable if its decimal can be written down by a machine.


- Alan Turing, "On Computable Numbers, with an Application to the Entscheidungsproblem" 

```


The Entscheidungsproblem, or "decision problem," asked if there was a systematic way to determine the truth of any given statement in first-order logic. An example of an Entscheidungsproblem-style question in the realm of mathematics could be about determining the solvability of Diophantine equations. A Diophantine equation is a polynomial equation, usually with two or more unknowns, for which only integer solutions are sought. The problem can be framed as:
<strong> "Given any Diophantine equation, is there a systematic way (an algorithm) to decide whether or not the equation has an integer solution, without directly solving it?"</strong> 

Alan Turing addressed this question through his conceptualization of the <i><u><strong>Turing Machine</u></strong></i>, a theoretical model for computation.

Turing introduced the idea of computable numbers and functions, essentially defining what problems are solvable through algorithms. He connected this to the Entscheidungsproblem by demonstrating the [Halting Problem](https://en.wikipedia.org/wiki/Halting_problem#:~:text=The%20halting%20problem%20is%20a,equivalent%20to%20a%20Turing%20machine.), which asks whether it's possible to predict if a Turing Machine will stop or run indefinitely for any given input. Turing proved that such prediction is impossible because there is no universal algorithm that can determine the behavior of every Turing Machine.

This impossibility of solving the Halting Problem implies that the Entscheidungsproblem is also unsolvable. There cannot be a universal method to decide the truth or falsehood of every statement in first-order logic. Turing's findings laid foundational concepts in computability and showed the limits of what algorithms can solve, significantly impacting mathematics and computer science.

### Brief on the Design and Operation of Turing Machines:

> [!IMPORTANT]  
> The first 6-7 pages of Alan Turing's research paper introduce the concepts of computability, alongside the basic construction and operation of an
> elementary Turing Machine. Check out the original 36 page paper [here](https://www.cs.virginia.edu/~robins/Turing_Paper_1936.pdf).
> On page number 4, the Turing Machine represented via table has a single incorrect entry due to a misprint, the final m-config for entry 2, initial
> m-config c should be e, not c.


### Definition

A Turing machine is a finite automaton that can read, write, and erase symbols on an infinitely long tape. The tape is divided into squares, and each square contains a symbol. The Turing machine can only read one symbol at a time, and it uses a set of rules (the transition function) to determine its next action based on the current state and the symbol it is reading.

### Definitions for a Turing Machine:

**Machine Configurations (M-Configs):** These represent the different states of the Turing machine. Each M-Config defines the current state of the machine.

**Scanned Symbols:** These are the symbols read by the Turing machine from the tape at any given step.

**Actions:** These actions determine what the Turing machine does based on the current M-Config and the scanned symbol. Actions can include writing a new symbol on the tape (represented as P followed by the symbol), moving the tape head left (L) or right (R), erasing a symbol (E), or transitioning to a new M-Config.

**New M-Config:** After performing the actions based on the scanned symbol and current M-Config, the Turing machine transitions to a new M-Config, representing its updated state.

#### Operation of a Turing Machine:

**Initial Configuration:** The Turing machine starts in an initial M-Config with the tape containing an initial sequence of symbols.

**Processing:** At each step, the Turing machine reads the symbol currently under the tape head (the scanned symbol). Based on the combination of the current M-Config and the scanned symbol, it performs specific actions, such as writing a new symbol, moving the tape head left or right, erasing a symbol, or transitioning to a new M-Config.

**New Configuration:** After processing each symbol, the Turing machine reaches a new M-Config, indicating the completion of one iteration. The current m-configuration is now assigned the value of this new m-config,and computations can continue as long as long there exists a pair of actions and new m-config for the combination of the current m-config and scanned symbol.

#### Example Table for a Turing Machine:
Consider a simple example of a Turing machine that prints the sequence 101010..... 
Here's the transition table representing its behaviour:

![IMG_20240402_184816](https://github.com/nikhil-RGB/turing-machine-generator/assets/68727041/9bd2f6ca-e9a1-4bf5-bf20-78fbb6a264f1)

#### Modern Mathematical Representation:

While Turing primarily used tables to represent his machines in the original 1936 research paper, a more concise representation involves 
defining it as a quintuple (Q, Σ, Γ, δ, q0, qaccept, qreject) as is more widely accepted nowadays.
It comprises of:
- a finite set of states Q
- a finite set of tape symbols Σ
- a finite set of tape alphabet symbols Γ (including a blank symbol)
- a transition function δ that maps combinations of current state and scanned symbol to actions (including reading, writing, moving left or right, 
  and transitioning to a new state)
- an initial state q0
- and accepting (qaccept)
- rejecting (qreject) states.

## UML:

![image](https://github.com/nikhil-RGB/turing-machine-generator/assets/68727041/d3379b74-26e0-456d-8704-95a895c8ac81)

<br>

## Purpose:

This project aims to create a windows desktop application,mobile app and web-app built with flutter which allow users to create their own turing machines, by filling in a table which contains the Configuration and Behaviour attributes. Users can then view the tape while controlling the progression of the machine's state.
This application is useful to simulate and store Turing Machines encountered in Alan Turing's 1936 reserach paper as it is easier to understand the machines and follow along with this application rather than if you simulated them manually. 
To save machines, a secure NoSQL database, [Hive](https://pub.dev/packages/hive) was used.
The logic for the project is available in the lib/models/ folder. You can find the apk/exe file in the [releases](https://github.com/nikhil-RGB/turing-machine-generator/releases)
section. There is also a [web deployment](https://turing-machines-14433.web.app)

## Screenshots and How to Use:

> [!NOTE]  
> The project overall, and especially the UI is under development and subject to constant improvement and modification, the following screenshots
> are representative only of the current state of the application.

<br>

![image](https://github.com/nikhil-RGB/turing-machine-generator/assets/68727041/bafbc936-868c-4a6b-af9f-560ce8c2189c)

<br>

### Welcome Screen:

- This screen presents the user with the option to create a machine from scratch, create a default machine, or load a saved machine.
- The default machine looks like this:

![image](https://github.com/nikhil-RGB/turing-machine-generator/assets/68727041/966c6ee9-9fb3-4dba-a503-d1e9aa36e5bc)


and simply populates the tape with 0's.
- Selecting the "Create Machine" or "Default Machine" option will send the user to the Table Screen with a blank table or the default table respectively.
- Selecting the "Load Machine" option will navigate the application to the Load Machine Screen.
<br>



 ![image](https://github.com/nikhil-RGB/turing-machine-generator/assets/68727041/dac91f15-73ef-430b-8b38-a70c83eed09e)

<br>

 ### Load Machine Screen:
- Pick one machine from the list of saved machines and click it to proceed. The machine will be loaded and presented on the Table Screen.
- You can delete a saved machine by clicking on the delete icon in the machine's name tile.
- The reset icon in the top right will delete ALL saved machines. 
<br>

![image](https://github.com/nikhil-RGB/turing-machine-generator/assets/68727041/90685148-5d69-4e41-afa8-0b40b56077f1)

<br>

#### Table Screen:

> [!NOTE]  
> You can save a machine by clicking on the save icon in the top-right.
> You will get a prompt asking for a name with which the machine can be saved, an empty string is also a valid input.
> Ensure that the name is not already taken before saving since if there is another machine saved with the same name, it will simply get overwritten with the one being saved.
> Note also that only the machine table and initial configuration are saved. The machine's state on running it through X iterations will not be saved.

- The Table on this screen represents the Turing Machine's behaviour. It consists of the following columns: M-config, Symbol, Actions, New m-config.
- Each entry in this table, therefore can be read as: While the machine is in [M-config] and the tape-head is reading symbol [Symbol], execute [Actions] and switch into [New m- 
  config].
- The table initially displays a sample turing machine which continuously prints 0's and moves the tape head right. You can reset the entire machine and start afresh with the 
  restart icon button in the top-right. This erases and resets the tape and deletes the table.
- You can add new entries by inputting m-config,symbol scanned,actions and final m-config into the labelled textFields and clicking on the "Add Row" button.
- You can select a particular entry you want to delete via selecting it in the associated drop-down and clicking on the delete button.
- You can select an initial m-config via it's associated dropdown.
- <strong> Grammar-Parsing: </strong> If you want to check for the correctness of a certain input with respect to the grammar defined by the turing-machine created, you can input an 
  initial tape string via it's associated text-field located at the bottom of the screen. Once the string is inputted, click on the "Print onto Tape" button to apply the change. 
  Note that while this resets the tape pointer to 0 and makes it so that the tape is initially only as big as the input provided(each character populates one tape-cell), it **will 
  not** reset the current m-config to the initial m-config.
- Once you are satisfied with your changes, click on the "Create/Resume Machine" button.

> [!IMPORTANT]  
> There are 2 special symbols: ```ANY``` and ```NONE```. <br>  ```ANY``` is a wildcard and will match every symbol. ```NONE``` represents a blank cell ("").<br>
> If there are multiple entries for a particular m-config for different scanned symbols, and you want to specify an "ANY" case, all other symbols are checked before "ANY",this
> entry will only be considered if there are no other pairs of ```{m_config,scanned symbol}``` which match the current ```Configuration``` of the machine.<br>
> These two special symbols are not case-sensitive.

##### Actions:

- There are four valid actions: P(Print), R(Move tape head right), L(Move Tape head left), E(Erase current symbol).
- An example of a valid Actions String is: ```P1,R,R,E``` ->Print 1, Move Right,Move Right, Erase symbol at head pointer.
- Actions are case-sensitive. 
 
<br>

![image](https://github.com/nikhil-RGB/turing-machine-generator/assets/68727041/71e9ec03-6ae3-4f96-a1c8-3811e530d97b)

### Tape-Screen:

- The Tape here represents the tape of the turing machine constructed in the previous screen.
- This page is meant for controlling and observing how the turing-machine progresses and does not have features to edit the configuration of the machine.
- Progress the turing machine by clicking the Floating Action play button in the bottom right region.
- You can hard-reset the tape by clicking on the restart icon-button in the top-left region: This will erase all symbols on the tape, and reset the pointer to 0, even changing the
  m-config to the initial m-config specified in the previous screen.
- You can navigated between the Tape and Table Screen via the back button- any changes you make to the machine in The Table Screen will apply when you navigate back to the Tape 
  Screen. Navigating back and forth between these two screens **will not** reset the tape, unless you explicitly reset the tape or the entire machine itself via the associated Icon 
  Buttons.

  For any issues with the project, please either open an issue or contact me via e-mail: javakingxi@gmail.com

## Importing and Exporting Machines:

 - Turing Machines can be imported and exported as encoded JSON strings, which allows users to share machines across devices.
 - To share a machine you created, first click the 'share' icon button on the top right corner of the 'Table Screen', this will show an encoded JSON string representation of the 
   machine. Copy this string to your clipboard.
 - To import a machine, click on the 'import/export' icon button on the top-right corner of the 'Load Machine' screen, and paste the machine export JSON string.

   <br> <br>

   <img width="1280" alt="image" src="https://github.com/nikhil-RGB/turing-machine-generator/assets/68727041/c2831091-85dc-4eac-b7b8-8bcc627cf412">
 
   <br> <br>

   <img width="1280" alt="image" src="https://github.com/nikhil-RGB/turing-machine-generator/assets/68727041/cac51409-1fa6-4654-a072-ff2bfd7d8f6e">


   <br>

## Special Mentions:

- [Chandrama Saha](https://linktr.ee/chandramasaha): While Chandrama has not helped with the technical aspects of the project, she has supported me through my journey as a developer 
  and motivated me to keep learning, buidling and breaking software. She has also worked on the final version of the improved UI(not implemented yet). Most projects I build with 
  flutter implement her fantastic designs. 
- [Anshul](https://github.com/ArchUsr64): Anshul helped me debug my "ANY" symbol and has helped me improve the efficiency of the application on multiple occasions. He has provided me
  with the support and kind words required to see my work through on multiple occasions.
  Anshul has also acted as an external tester for this project.

  

 











