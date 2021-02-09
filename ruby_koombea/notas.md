# RUBY - codecademy

https://www.codecademy.com/learn/learn-ruby




## KEY CONCEPTS 

* variables
* put and print (print does not include '\n')
* code comments ( single line: #, multiline: =begin ... =end)
* numeric types (integer, float)
* aritmetic operators (division has no precision, you have to specify int or float)
* object methods (accesible using '.')
* string (you can use either '' r "")
*   *   .upcase, .downcase 
*   *   interpolation (insert code result into a string  #{variable} between "" )
*   *   capitalize! (first letter)  

* NOTA: if you are agoing to **assign** a value to a variable use **var2 = var1.capitalize**
        if you want to **change** the variable itself use **var.capitalize!** with 
        **'!'**
si afecta el original use '!' si afecta a unacopia no es necesario
example:  

print "This is my question?"  
1).     answer = gets.chomp  
        answer2 = answer.capitalize   

2).     answer.capitalize!  


* boolean
* user input (.gets: user input with '\n' at the end,
    .gets.chomp: user input with out '\n' at the end)  
* **integer**(gets.chomp) --> (integer user input)  

* conditionals: if, elsif, else
* conditional: **unless** ( a menos que el evento sea positivo... haga)  
    valida que algo es falso

example 1:

hungry = false
**unless** hungry  
  "Write some sweet programs"  
else  
  "Have some noms"  
end  

example 2:

problem = false  

print "Good to go!" **unless** problem


* logical operators (just: &&, ||, !)  
*   * ( evaluates true starting from the left side of the expression ) 
* indentation two spaces (for convencion)
* **methods** that end with **?** evaluate true or false as general rule  

example:  

arr.include? element 

* **.gsub** (globas substitution, recibe un regex de la expresion encontrada y un str de la expresion a cambiar) 

example: using regex multiple options  

str.gsub(/to|an|a|the/, '')   # passing pattern argument (cambia las coincidencias por '')


## loops  

* while (loopin whe you do not know how many times)
* until (it is sort os while complement, do until is flase)
* for (looping if you know how many times)  
  > range 1...10 no inclye el 10 (three dots)  
  > range 1..10 incluye el 10 (inclusive range two dots)

* loops and iterators (An iterator is just a Ruby method that repeatedly
  invokes a block of code.)

* **loop** is the simplest iterator  
> loop { print "Hello, world!" }  # (infinite loop)

curly braces (**{}**) are generally interchangeable with the keywords **do** (to open the block) and **end** (to close it)

* break if (break)
* next if (similar to continue)  

* **array**  
* **append** elements to an array **arr.push(element)** or **arr << element**  
* agregar al **comienzo** **arr.unshift**  
* agregar en **medio**  **arr.insert(index, element)**  
* the **each** iterator (aply anithing to every element in the array
  using **|var|**)  

* **.times** iterator (executes code any said times )  
 
example 1:  

>10.times { print "Chunky bacon!" }  

example 2:

>10.times do  
  print "chunky bacon!"  
end  


* **hases** use **=>** to asign values to an index in a hash  
* * We can add to a hash two ways: if we created it using literal notation, we can simply add a new key-value pair directly between the curly braces. If we used Hash.new, we can add to the hash using bracket notation:  

* * Hash.new(0) le dá **0** como valor por defecto a los values del hash  
* * **.sort_by** function returns an array of arrays.
* * we must first convert the value from a number to a string using **.to_s** before we can concatenate it.

# OverView  

* hight level
* interpreted
* object oriented*
* easy to use
* case sensitive








# RUBY ON RAILS codecademy

https://gorails.com/series/rails-for-beginners
