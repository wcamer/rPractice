######## actual game components
#MAIN FUNCTION
main_fun <- function(){
    exit <- FALSE
    while(exit == FALSE){
    #runs the game
    hide_n_seek()
    }
}

hide_n_seek <- function(){
    game_over <- FALSE
    while(game_over == FALSE){
    print("what is your name?\n\n")
    p1 <- create_player()
    
    #prompt user to enter their name
    p1[1,2] <- user_said()
    #set user to seeking to start the game on their turn
    p1[4,2] <-"Seeking"
    #user will pick a hiding place
    set_hiding_place(p1)
    #cpu setup
    cpu <-create_player()

    
    set_hiding_place(cpu)
    print("22222222222222222")

    move_finder(p1,cpu)
    }
    exit <- TRUE
    return (exit)


}

##get user input
##user input function
user_said <- function() {
    response <- readline(prompt="Enter your response... ")
    return (response)
}

create_player <- function() {
    player <- matrix (c("Name: ","Location X: ","Location Y: ","Status: ","Guesses X: ","Guesses Y: ","CPU",
       0,
       0,
        "Hiding",
        as.numeric(matrix(c(0))),
        as.numeric(matrix(c(0)))),
         nrow =6, ncol=2)##this is is showing the structure
    
    return (player)
}

move_finder <- function (person1, person2) {
    
    if(person2[4,2] == "Seeking"){
   
        print(paste("Watch out!!! ", person1[1,2]," is looking for you!!!"))
        rando_x <- sample(0:10, 1)
        rando_y <- sample(0:10, 1)
        append(person2[5,2], rando_x)
        append(person2[6,2], rando_y)
        check_positions(person1,person2,rando_x,rando_y)
       
     
            #pulling an already done guess from the players guess bank
          
                #if the guess is the same as the current guess the player is trying to make then they lose their turn
        
        #             print("you already guessed this spot!!!\n\nYou lose your turn")
        #             person2[4,2] <- "Hiding"
        #             person1[4,1] <- "Seeking"
        #             move_finder(person1,person2)
        #         }else{
        #             # if this is a brand new guess, we will add it to the player's guess bank
        #             person1[5,2] <- c(guesses,guess)
        #             # send the guess to check if the cpu is there.
        #             check_positions(person1,person2,guess)
        #         }
        #     }
        # }
        



    }else{
        print("444444444444444444444444")
        plot_guesses(person1)
        print("the player is finding\nWhere do you want to check?\nEnter a number for the 'X' axis.") # nolint: line_length_linter.
        x_check <- as.numeric(user_said())
        print("Enter for the 'Y' axis")
        y_check <- as.numeric(user_said())

        #guesses might need to be a matrix#######################
        # newMatX <- matrix(c(person1[5,2], x_check))
        # newMatY <- matrix(c(person1[6,2], y_check))

        # person1[5,2] <- newMatX
        # person1[6,2] <- newMatY

        # person1[5,2] <- cbind(c(person1[5,2], x_check))
        # person1[6,2] <- cbind(c(person1[6,2], y_check))

        # newMatX <- matrix(c(person1[5,2], x_check))
        # newMatY <- matrix(c(person1[6,2], y_check))

        append(person1[5,2], x_check)
        append(person1[6,2], y_check)
        
        check_positions(person1, person2, x_check, y_check)




        ###########coming back to work on it in the future
        #if the player has at least made 1 guess we need to check it
        # if(length(gsx) > 0){
        #     #pulling an already done guess from the players guess bank
        #     for(i in length(gsx)){
        #         if ( x_check == gsx[i] && y_check == gsy[i]){
        #             print("you already guessed this spot!!!")
        #         }else{
        #             person1[5,2] <- c(gsx, x_check)
        #             person1[6,2] <- c(gsy ,y_check)
        #             print("Checking the postion now")
        #             check_positions(person1, person2, x_check, y_check)
        #         }
                    

              
                # #if the guess is the same as the current guess the player is trying to make then they lose their turn
                
                #     # if this is a brand new guess, we will add it to the player's guess bank
                #      person1[5,2] <- c(guesses,guess)
                #     # send the guess to check if the cpu is there.
                #     check_positions(person1,person2,guess)
                
            
        

        #person[5,2] <- c(x_check,y_check)
        






    }
    #print(person)
}#end of move_finder

#check_positions function
check_positions <- function( person1, person2, guessX, guessY){
    #if the user made the guess
    if(person1[4,2]=="Seeking"){
        if(as.numeric(person2[2,2]) == guessX && as.numeric(person2[3,2]) == guessY){
            person2[4,2] <- "FOUND!!!"
            print("Congrats you found the CPU and won the game!!!")
            
            print("here is the cpu x")
            print(person2[2,2])
            
            print("here is the cpu y")
            print(person2[3,2])

            dto <- class(guessX)
            dtoo <- class(person2[2,2])
            print(dto)
            print(dtoo)


            game_over <- TRUE
            return(game_over)
        }else{
            print("The game continues...\n\n")
            #plot the points
         
            print("here is the cpu x")
            print(person2[2,2])
            
            print("here is the cpu y")
            print(person2[3,2])

            dto <- class(guessX)
            dtoo <- class(person2[2,2])
            print(dto)
            print(dtoo)
            person1[4,2] <- "Hiding"
            person2[4,2] <- "Seeking"
            move_finder(person1,person2)
        }
    }else{
        if(person1[2,2] == guessX && person1[3,2] == guessY){
            person1[4,2] <- "FOUND!!!"
            print("OH NO YOU WERE FOUND!!!\n\nYou Lose...\n\n")

             print("here is the cpu x")
            print(person2[2,2])
            
            print("here is the cpu y")
            print(person2[3,2])

            dto <- class(guessX)
            dtoo <- class(person2[2,2])
            print(dto)
            print(dtoo)


            game_over <- TRUE
            return(game_over)
        }else{
            print("You got lucky that the CPU didn't find you...\n\nIt's your turn to go find the CPU\n\n")
            #plot the points
            person2[4,2] <- "Hiding"
            person1[4,2] <- "Seeking"
            move_finder(person1,person2)
        }
    }

} # end of check_positions


#plot guesses 
plot_guesses <- function(person) {
    gx <- person[5,2]
    gy <- person[6,2]
    print("5555555555555")
    print("here is gx and gy")
    print(gx)
    print(gy)
    print(person)
    
    if(person[1,2] != "CPU"){
        pcolor <- "red"
        
    }else{
        pcolor <- "green"
    }
    plot_name <- paste(person[1,2], "Guessing Plot")
   
    plot(0, 0, xlim = c(0, 10), ylim = c(0, 10), type = "n", xlab = "X values", ylab = "Y values", main = plot_name)
    points(gx, gy, pch = 10, cex = 2, col = pcolor)
    # for(i in length(gx)){
        
    #         x_plot <- gx[i]
    #         y_plot <- gy[i]
    #         print("Poltingggggggggggggggggggggggggggggggg")
    #         plot(x_plot,y_plot, pch=10, cex=2, col = pcolor, main = plot_name )
    #         show()
    #     }
    
    
    
        
    
}#end of plot guesses 

set_hiding_place <- function(person){
    if(person[1,2] == "CPU"){
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!The CPU has picked it's hiding spot which is at (?,?) \nHere's a hint, it between (0,0) and (10,10)")
        rando_x <- as.numeric(sample(0:10, 1))
        rando_y <- as.numeric(sample(0:10, 1))
        person[2,2] <- rando_x
        person[3,2] <- rando_y
        print(person) #debugging line
    }else{
        print("The CPU has picked it's hiding spot which is at (?,?) \nHere's a hint, it between but including (0,0) and (10,10)")
        print("Pick an x corridnate where you want to hide. No more than 10, no less than 0, whole numbers only\n\n")
        x_plot <- as.numeric(user_said())
        print("Pick an y corridnate where you want to hide. No more than 10, no less than 0, whole numbers only\n\n")
        y_plot <- as.numeric(user_said())
        person[2,2] <- x_plot
        person[3,2] <- y_plot
        if((x_plot > 10 || x_plot < 0) && (y_plot > 10 || y_plot < 0)){
            print("invalid entry!!! You need to pick no less than 0 and no greater than 10 on either axis")
            set_hiding_place(person)
        }
        print(person)
    }
}#end of set_hiding_place

main_fun()