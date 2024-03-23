
# #point ploter prototype, Uncomment this and comment out the other functions to test out
pointPlotter <-function () {
   
    x_list <- list()
    y_list <- list()

    for( i in 1:10){
            rando_x <- sample(0:10, 1)
            rando_y <- sample(0:10, 1)
        x_list <- append(x_list, rando_x)
        y_list <- append(y_list, rando_y)
    }

    print("here is rando x")
    print(rando_x)
    print("here is rando y")
    print(rando_y)

    plot(0, 0, xlim = c(0, 10), ylim = c(0, 10), type = "n", xlab = "X values", ylab = "Y values")
    points(x_list, y_list, pch = 10, cex = 2, col = "red")
}

pointPlotter()




##guess validator demo Uncomment to test out this and comment out other functions to test out.
##looping through a list
# rando_gx <- sample(0:3, 1)
# rando_gy <- sample(0:3, 1)

# guessValidator <- function(x , y){

# print("Start of VAlidator/////////////")

# x_list <- list(1,2,3,4,5)
# y_list <- list(10,9,8,7,6)

#     print("starting check")
#     print(length(x_list))

#     for( i in 1:length(x_list)){
#         if((x == x_list[i]) && (y == y_list[i])){
#             print("You already guessed this spot")
#             print("here is x")
#             print(x)
#             print("here is x_list at this iteration")
#             print(x_list[i])
#             print("here is y")
#             print(y)
#             print("here is x_list at this iteration")
#             print(y_list[i])

#         }else{
#             print("NO match yet")
#         }
#     }
# }

# guessValidator(5,6)


