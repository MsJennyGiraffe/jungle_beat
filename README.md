# Jungle Beats
https://github.com/turingschool/curriculum/blob/master/source/projects/jungle_beat.markdown

#### Linked Lists
* Data Structure 101
* Collections
 * like arrays and hashes
* Conceptual Challenge
 * If you understand concepts, you can probably do this in an hour but you need to wrap your head around what it is and how to manipulate it

##### What is it all about?
* Make a list of things by creating nodes (cells, or elements)
 * Put data in nodes
 * When you want more data, create more nodes and link them together in a chain of nodes.

 "pizza" --> "lasagna" --> "calzone"

 * the pieces are stupid simple but putting them together and manipulating them is the hard part

##### Thinking about the information
 * First node is special
  * head
  * starting place
  * In the chain above "pizza" is the head
* The connection is only in one direction
* Within each node contains some arbitrary piece of data
* Interested in the next node after that node
* Last node is special
  * Tail
  * It's next node is nil.

##### What is the list?
* The list is *all* of these pieces together.
