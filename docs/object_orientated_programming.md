Object Orientated Programming



Class
    // User defined data type (getters and setters)
    // Declared with the word "class", followed by the class name, and then curly brackets
    // Contains constructors, fields, functions, getters and setters.and

    class class_name{
        constructors;
        fields;
        functions;
    }

    // Example of a "class" being used

    class example{
        string myname = "OpenGenus Foundation"  ;

    void disp (){
        print (name)    ;
    }
    }

    // In this instance,
       "example" is the class name.
       "disp" is the function of the class.
       string is the field of the class.



Objects
    //Entity
    //Declared to access functions & data declared in a class

    //Syntax
        var object_name = new class_name(arguements);
    //Example
        var name = new example(arguements);
    //object_name is the "name"
    //new creates a new object_name
    //example is the class name
      //for accessing class properties and methods, we use .operator



Data Encapsulation
     //binding data and function that use data into one unit
            //referred to as data hiding and information hiding
            //does not have keywords like private, public, and protected
            //happens at the library level and not at the class level
            //any identifier that starts with an underscore "__"is private to its library

                syntax:
                _identifier

                Example
                library loggerlibrary;
                void _log(message)
                {
                    print ("Log method called in the loggerlibrary message:$message");
                }
                in the above example we have defined a library with a private function



Inheritances
    //The ability to create new classes from existing classes
            //newly created classes are called sub classes or child classes.
            //class from which new subclasses are derived from are called super class or parent class.

    // a class is inhered from another class by using the word "extend" keyword
            //Dart supports the following types of inheritance.
                   //1. Single (one child class is inherited by one parent class only)
                   //2. Multi level (child class can inherit from another child class)
                        //Dart does not support multiple inheritance.

   //the "super" keyword is used to refer to immediate parent of a class.
   //Keyword can be used to refer to the super class version of a method or a variable

   //Example:

   void()
   {
   var obj = new model();
   obj.price();
   }

  class car
  {
    void price()
    {
    print ("price of car model in the car class");
    }
  }
  class model extends car{}

  //Output
    ==> Price of car model in the car class



Polymorphism
    //Achieved through inheritance and it represents the ability of an objec
      to copy the behavior of another object.
        //One object can have multiple forms
    //subclasses or child classes usually override instance methods,
      Getters and Setters.inheritance

    //@Override is used to indicates that we are overriding a member.
    //Dart doesn't allow overloading. To overcome this, we can use arguement definitions like
      "optional" and "positional"

    //Example
    class Car extends vehicle
    {
        Car();
        {
            this.topspped = 240;
            this.name = "Car";
        }

    void EngineStart()
    {
        print('Engine Started');
    }
  }


  main()
  {
    car model ;
    model = new Lights (73);
    model.turnOn();
    model.goForward();
    model.turnOff();

    model = newCar();
    model.turnOn();
    model.goForward();
    model.turnOff();
  }

//here the object - "model" has multiple forms