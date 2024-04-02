## Turing Machine Generator:
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

### Breif on the Design and Operation of Turing Machines:

> [!IMPORTANT]  
> The first 6-7 pages of Alan Turing's research paper introduce the concepts of computability, alongside the basic construction and operation of an
> elementary Turing Machine. Check out the original 36 page paper [here](https://www.cs.virginia.edu/~robins/Turing_Paper_1936.pdf).
> On page number 4, the Turing Machine represented via table has a single incorrect entry due to a misprint, the final m-config for entry 2, initial
> m-config c should be e, not c.


#### Definition

A Turing machine is a finite automaton that can read, write, and erase symbols on an infinitely long tape. The tape is divided into squares, and each square contains a symbol. The Turing machine can only read one symbol at a time, and it uses a set of rules (the transition function) to determine its next action based on the current state and the symbol it is reading.
##### Components of a Turing Machine:
Machine Configurations (M-Configs): These represent the different states of the Turing machine. Each M-Config defines the current state of the machine.

Scanned Symbols: These are the symbols read by the Turing machine from the tape at any given step.

Actions: These actions determine what the Turing machine does based on the current M-Config and the scanned symbol. Actions can include writing a new symbol on the tape (represented as P followed by the symbol), moving the tape head left (L) or right (R), erasing a symbol (E), or transitioning to a new M-Config.

Final M-Config: After performing the actions based on the scanned symbol and current M-Config, the Turing machine transitions to a new M-Config, representing its updated state.

#### Operation of a Turing Machine:
Initial Configuration: The Turing machine starts in an initial M-Config with the tape containing an initial sequence of symbols.

Processing: At each step, the Turing machine reads the symbol currently under the tape head (the scanned symbol). Based on the combination of the current M-Config and the scanned symbol, it performs specific actions, such as writing a new symbol, moving the tape head left or right, erasing a symbol, or transitioning to a new M-Config.

Final Configuration: After processing each symbol, the Turing machine reaches a new M-Config, indicating the completion of one iteration. The current m-configuration is now assigned the value of this new m-config,and computations can continue as long as long there exists a pair of actions and final m-config for the combination of the current m-config and scanned symbol.

##### Some Additional Definitions:

Complete Configuration: The combination of the current M-Config and the scanned symbol at any step is called the complete configuration of the Turing machine.

Behaviour: The sequence of actions and final M-Configs reached by the Turing machine as it processes the input symbols is called the behaviour of the machine.


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

## Purpose:

This project aims to create a windows desktop application, built with flutter which allows users to create their own turing machines, complete with m-configs, symbols, actions and final m-configs.
The logic for the project is available in the lib/models/ folder. Currently the UI and erroneous input checking are being worked on.
When the first version is ready, it will be available in releases.
 










