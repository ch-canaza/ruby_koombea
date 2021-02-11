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
* **append** elements to an array **arr.push(element)** or **arr << element**(the shovel)  
* agregar al **comienzo** **arr.unshift**  
* agregar en **medio**  **arr.insert(index, element)**  

Nota:
* * funcionan con strings tambien

* the **each** iterator (aply anithing to every element in the array
  using **|var|**)  

* **.times** iterator (executes code any said times )  
 
example 1:  

>10.times { print "Chunky bacon!" }  

example 2:

>10.times do  
  print "chunky bacon!"  
end  


* **hashes** use **=>** to asign values to an index in a hash  
* * We can add to a hash two ways: if we created it using literal notation, we can simply add a new key-value pair directly between the curly braces. If we used Hash.new, we can add to the hash using bracket notation:  

* * Hash.new(0) le dá **0** como valor por defecto a los values del hash  
* * **.sort_by** function returns an array of arrays.
* * we must first convert the value from a number to a string using **.to_s** before we can concatenate it.

* **splat** operador que representa n cantidad de argumentos **'*'**  
* **blocks**You can think of blocks as a way of creating methods that don’t have a name.  

* *  the block that we define (following .each) will only be called once, and in the context of the array that we are iterating over. It appears just long enough to do some work for each, then vanishes into the night.  

> A method can take a block as a parameter **.each** lo hace todo el tiempo, solo que sin usar los parentesis los cuales son opcionales  

* **combined comparisson operator** **<=>** returns 0 if the first operand (item to be compared) equals the second, 1 if the first operand is greater than the second, and -1 if the first operand is less than the second.  

example: **block**


> * To sort our books in **ascending** order, in-place  
    books.sort! { |firstBook, secondBook| firstBook <=> secondBook }  


> * Sort your books in **descending** order, in-place below  
    print books.sort! { |firstbook, secondbook| secondbook <=> firstbook }  

* **:symbols**  

* * are names and store values with an unique id  
* * used either as hash keys or for referencing method names  
* * Symbols make good hash keys for a few reasons:  

They’re immutable, meaning they can’t be changed once they’re created;
Only one copy of any symbol exists at a given time, so they save memory;
Symbol-as-keys are faster than strings-as-keys because of the above two reasons.

**.to_s**, [ **.to_sym**, **.internalize**]

**=>** is clled the hash rocket style 
**.select** filter a hash for values that meet certain criteria  
**.each_key** 
example:  
my_hash.each_key {|k| puts k}  (prints every key in the hash)  

**.each_value**   
**.delete** my_hash.delete(key)  

**case___ when**__**then** (shows an element when match another then do something) 

* **ternary** puts 1 < 2 ?  "One is less than two!" : "One is not less than two."
* **||=** asigna solo si la variable no tiene contenido
* **implicit return** Ruby’s methods will return the result of the last evaluated expression.

**Short-Circuit Evaluation** Ruby doesn’t look at both expressions unless it has to; if it sees, having in account that: The && operator only returns true when the expressions on both sides of the operator are true; || returns true when one or the other or both of the expressions involved are true.

* **.upto**___**downto**

example:  desde, hasta .. loop que recorre un rango
> 95.upto(100) { |num| print num, " " }  
   Prints 95 96 97 98 99 100  

## integer validation  
* **.respond_to?**  takes a symbol and returns true if an object can receive that method and false

retorna true si el metodo llamado se puede usar en determinado objeto


example: (integer valiidation: unless n.is_a? Integer)

> [1, 2, 3].respond_to?(:push) true, un array puede llamar a .push  

> [1, 2, 3].respond_to?(:to_sym) false, un array no se puede convertir en simbolo  

**.next** return the next element (4.next, return 5)

example:

> a way to verify if an element is an integer  
 
 age.respond_to?(:next)  

 **.collect** and **.map** takes a block and applies the expression in the block to every element in an array (returns a copy affected) (to change original use '!')

example:

arr2 = arr1.collect { |i| i * 2 } (multyply every element in arr1 x 2)

Nota:
Why do some methods accept a block and others don’t? It’s because methods that accept blocks have a way of transferring control from the calling method to the block and back again. We can build this into the methods we define by using the yield keyword.

## **yield**   
> pausa la ejecucion del hilo actual , genera y luego regresa al hilo original    

ejemplo1:  

> def yield_name(name)  
  puts "In the method! Let's yield."  
  yield("Kim")  
  #yield("chris")  
  puts "In between the yields!"  
  yield(name)  
  puts "Block complete! Back in the method."  
end  

> yield_name("Eric") { |n| puts "My name is #{n}." }  
yield_name("chris") { |n| puts "My name is #{n}." }  
yield_name("tat") { |n| puts "My name is #{n}." }  

**respuesta**  
* esto generará la misma respuesta 3 veces una por cada llamada al metodo   
>In the method! Let's yield.  
My name is Kim.  
In between the yields!  
My name is Eric.  
Block complete! Back in the method.  
In the method! Let's yield.  
My name is Kim.  
In between the yields!  
My name is chris.  
Block complete! Back in the method.  
In the method! Let's yield.  
My name is Kim.  
In between the yields!  
My name is tat.  
Block complete! Back in the method.  

> **yield** ejecuta un bloque de codigo dentro del metodo usando el parametro que se le pase el cual puede ser el que recibe el method

similar a un callback js o closure python


ejemplo2:  

def double(n)
  puts "let's yield"
  yield(n)
  puts "end of method"
end
double(2) {|i| puts i*2}
double(8) {|i| puts i*2}

respuesta:

let's yield
4
end of method
let's yield
16
end of method

Nota:

### blocks can’t be saved to variables and don’t have all the powers and abilities of a real object. For that, we’ll need… procs!  

> You can think of a proc as a “saved” block: just like you can give a bit of code a name and turn it into a method, you can name a block and turn it into a proc. Procs are great for keeping your code DRY, which stands for Don’t Repeat Yourself.

proc_name = Proc.new do |i|  
  #block_instructions using 'i'
end  
object.method(**&proc_name**)  

**&** cnverts proc into a block  

example:

floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482. 911]  

round_down = Proc.new { |n| n.floor }  
ints = floats.collect(&round_down)  
print ints    

example 3:  

def greeter
  puts "start method"
  yield
  puts "creating proc"
  
  end
  phrase = Proc.new { puts "Hello there!"}
  greeter(&phrase)


### Why Procs? **similar to arrow functions js**  
> Why bother saving our blocks as procs? There are two main advantages:  

Procs are full-fledged objects, so they have all the powers and abilities of   objects. (Blocks do not.)  
Unlike blocks, procs can be called over and over without rewriting them. This   prevents you from having to retype the contents of your block every time you need  
to execute a particular bit of code.  

## **convert symbols to procs**  

**int to str** 

numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]  

strings_array = numbers_array.collect(&:to_s)  

puts strings_array  

**convert str to int**  

strings = ["1", "2", "3"]  
nums = strings.map(&:to_i)  
==> [1, 2, 3]  








# OverView  

* hight level
* interpreted
* object oriented*
* easy to use
* case sensitive

## ruby lambda  
Like procs, lambdas are objects. The similarities don’t stop there: with the exception of a bit of syntax and a few behavioral quirks, lambdas are identical to procs.  


lambda { |param| block }


Nota:  

lambda checks the number of arguments passed to it, while a proc does not. This means that a lambda will throw an error   

proc will ignore unexpected arguments and assign nil to any that are missing.  

when a lambda returns, it passes control back to the calling method;  

 when a proc returns, it does so immediately, without going back to the calling method.  

example:  

def batman_ironman_proc  
  victor = Proc.new { return "Batman will win!" }  
  victor.call  
  "Iron Man will win!"  
end  

puts batman_ironman_proc 

def batman_ironman_lambda  
  victor = lambda { return "Batman will win!" }  
  victor.call  
  "Iron Man will win!"  
end  

puts batman_ironman_lambda  

**proc** termina la ejecucion con su retorno  
**lambda** regresa el control a la funcion y es ella quien termina la eecucion  

### sumary block lambda procs

A block is just a bit of code between do..end or {}. It’s not an object on its own, but it can be passed to methods like .each or .select.  
A proc is a saved block we can use over and over.  
A lambda is just like a proc, only it cares about the number of arguments it gets and it returns to its calling method rather than returning immediately.  


## classes  

class Language  
  @@class_var
  def initialize(name, creator)  
    @instance_variable
    @name = name  
    @creator = creator  
  end  

 **@var** represents variables of instance  

 **$var** global variables  
 
 **@@var** class variables  

**super**  

### cuando llamas super, desde un metodo esto le dice a rubi que busque en la clase padre un metodo con el mismo nombre y lo ejecute

sintax:  

class DerivedClass < Base  
  def some_method  
    super(optional args)  
      # Some stuff  
    end  
  end  
end  


> error por intentar multiple herencia:  

**superclass mismatch for class my_class**


**class methods**    

class Machine  
  **def Machine.hello**  
    puts "Hello from the machine!"  
  end  
end  


## public and private methods   

(That name= might look funny, but you’re allowed to put an = sign in a method name. That’s just a Ruby convention saying, “hey, this method sets a value!”)

getter:  

def name  
  @name  
end  
 
setter:  

def name=(value)  
  @name = value  
end  

accesor:  We can use attr_accessor to make a variable readable and writeable in one fell swoop.  

attr_accessor(:name, :job)  


## modules  

module ModuleName  (Camelcase)
  #Bits 'n pieces  
end  

>It doesn’t make sense to include variables in modules, since variables (by definition) change (or vary).   

> Constants, however, are supposed to always stay the same, so including helpful constants in modules is a great idea.  

>modules are stored in **namespaces**

**::** scope resolution operator (it tells Ruby where you’re looking for a specific bit of code)  

example:  

math::PI  
circle::PI  

**require** kind of import  

**include** Any class that includes a certain module can use those module’s methods!  
se usa para incluir modulos y sus funciones dentro de clases

>When a module is used to mix additional behavior and information into a class, it’s called a mixin. Mixins allow us to customize a class without having to rewrite code!  

>this way we can imitate Multiple inheritance!

>include mixes a module’s methods in at the instance level (allowing instances of a particular class to use the methods  

include permite a instancias mezclarse con modulos  

module MartialArts  
  def swordsman   
    puts "I'm a swordsman"  
  end  
end  
class Ninja  
include MartialArts  
  def initialize(clan)  
    @clan = clan  
  end  
end  

**extend**

>the extend keyword mixes a module’s methods at the class level. This means that class itself can use the methods, as opposed to instances of the class.  

extend permite a la clase mezclarse con los modulos

module ThePresent  
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.  new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."  
  end  
end  

class TheHereAnd  
  extend ThePresent  
end  
 
TheHereAnd.now  

## optional parameter  

def func(a, b=1)  

b is an optional parameter because i has a default value


## sumary oop  

example:  

class Account  
    attr_reader :name  
    attr_reader :balance  
    def initialize(name, balance=100)  
    @name = name  
    @balance = balance  
  end  
end  



# RUBY ON RAILS codecademy

https://gorails.com/series/rails-for-beginners
