
////////////////////////////////////////////////////
//
//    W_template.pde (ie "Widget Template")
//
//    This is a Template Widget, intended to be used as a starting point for OpenBCI Community members that want to develop their own custom widgets!
//    Good luck! If you embark on this journey, please let us know. Your contributions are valuable to everyone!
//
//    Created by: Conor Russomanno, November 2016
//
///////////////////////////////////////////////////,

class W_YesNoTest extends Widget {

    //to see all core variables/methods of the Widget class, refer to Widget.pde
    //put your custom variables here...
    Button widgetTemplateButton;
    String widgetLabel;
    float timePassed = 0.0f;
    boolean testStarted = false;
    boolean ifYesIsShown = true;
    boolean isPressed = false;
    String yesStatus =  "YES";

    W_YesNoTest(PApplet _parent){
        super(_parent); //calls the parent CONSTRUCTOR method of Widget (DON'T REMOVE)

        //This is the protocol for setting up dropdowns.
        //Note that these 3 dropdowns correspond to the 3 global functions below
        //You just need to make sure the "id" (the 1st String) has the same name as the corresponding function

        widgetTemplateButton = new Button (x + w/2, y + h/2, 400, navHeight, "Press Me To Start Yes / Off Check", 12);
        widgetTemplateButton.setFont(p4, 14);
    }

    void update(){
        super.update(); //calls the parent update() method of Widget (DON'T REMOVE)

        //put your code here...
        //If using a TopNav object, ignore interaction with widget object (ex. widgetTemplateButton)
        if (topNav.configSelector.isVisible || topNav.layoutSelector.isVisible)
        {
            widgetTemplateButton.setIgnoreHover(true);
        } 
        else 
        {
            widgetTemplateButton.setIgnoreHover(false);
        }

        if(!testStarted)
        {
            widgetLabel = "Start Calibration";
            
        }
        else
        {
            widgetLabel = "Keep me pressed when you see NO";
        }

    }

    void draw(){
        super.draw(); //calls the parent draw() method of Widget (DON'T
        //put your code here... //remember to refer to x,y,w,h which are the positioning variables of the Widget class
        if(testStarted)
        {
            ReverseTime();
        }
        pushStyle();
        widgetTemplateButton.draw();
        textSize(40);
        text(yesStatus,x + w/2, y + h/2);
        popStyle();
    }   

    void screenResized(){
        super.screenResized(); //calls the parent screenResized() method of Widget (DON'T REMOVE)

        //put your code here...
        widgetTemplateButton.setPos(x + w/2 - widgetTemplateButton.but_dx/2, y + h/2 - widgetTemplateButton.but_dy/2);


    }

    void mousePressed(){
        super.mousePressed(); //calls the parent mousePressed() method of Widget (DON'T REMOVE)

        //put your code here...
        //If using a TopNav object, ignore interaction with widget object (ex. widgetTemplateButton)
        if (!topNav.configSelector.isVisible && !topNav.layoutSelector.isVisible) 
        {
            if(widgetTemplateButton.isMouseHere()){
                widgetTemplateButton.setIsActive(true);
                isPressed = true;
            }
        }
    }

    void mouseReleased(){
        super.mouseReleased(); //calls the parent mouseReleased() method of Widget (DON'T REMOVE)

        //put your code here...
        if(widgetTemplateButton.isActive && widgetTemplateButton.isMouseHere())
        {
            if(!testStarted)
            {
                testStarted = true;
                    
            }
            else
            {
                isPressed = false;
            }  
        }
    }   

    //add custom functions here
    void ReverseTime(){
        //this is a fake function... replace it with something relevant to this widget
        if(testStarted)
        {   
            timePassed = second();
            if(ifYesIsShown){            
                if(timePassed % 5 == 0 )
                {
                    yesStatus = "NO";
                    println(ifYesIsShown);
                // background(1f,0f,0f); 
                    ifYesIsShown = false;
                    timePassed=0;
                }
            }
            else    
            {
                timePassed = second();
                if(timePassed % 5 == 0)
                {
                    yesStatus = "YES"
                    ifYesIsShown = true;
                    println(ifYesIsShown);
                    timePassed=0;
                }
            }
        }
    }
}

//These functions need to be global! These functions are activated when an item from the corresponding dropdown is selected

// void Dropdown1(int n){
//     println("Item " + (n+1) + " selected from Dropdown 1");
//     if(n==0)
//     {
//         //do this
//     } 
//     else if(n==1)
//     {
//         //do this instead
//     }
//     closeAllDropdowns(); // do this at the end of all widget-activated functions to ensure proper widget interactivity ... we want to make sure a click makes the menu close
//     }
