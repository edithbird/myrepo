Super <- c("A", "B", "C", "D", "E", "F")
Examiner <- c("AA", "BB", "CC", "DD", "EE", "FF")

Grade <- c("6", "7", "7", "9", "9", "6")
Special <- c("X", "Y", "Y", "X","X", "Y")
df <- data.frame(Super, Examiner, Grade, Special)
write.csv(df, "Super.csv", row.names = F)
SuperTable <- read.table("Super.csv")
Player <- c("k", "l", "m", "n")
Q1_11 <- c(1,0,1,0)



m <- matrix(data=1, nrow=5, ncol=4)  # same matrix as above, 5x4, full of 1s

m <- matrix(1,5,4)                       # same matrix as above

dim(m)                               # What are the dimensions of m?
m <- cbind(1:5, 5:1, 5:9)  # Bind 3 vectors as columns, 5x3 matrix

m <- rbind(1:5, 5:1, 5:9)  # Bind 3 vectors as rows, 3x5 matrix
m
m[1,]==m[,1] 
plot(x=1:18, y=rep(5,18), pch=12, cex=3, col="darkblue", bty = "n", yaxt = "n", xaxt = "n", xlab = "", ylab = "")
points(x=1:18, y=rep(6,18), pch=19, cex=3, col=rep(c("yellow", "darkblue", "red", "red", "yellow")))
points(x=1:18, y=rep(4,18), pch=19, cex=3, col=rep(c( "darkblue", "yellow","red",  "yellow","red")))
points(x=1:18, y=rep(7,18), pch=19, cex=3, col="red")
points(x=1:18, y=rep(3,18), pch=19, cex=3, col="yellow")
points(x=1:18, y=rep(2,18), pch=19, cex=3, col=rep(c("darkblue","yellow", "darkblue", "red",  "yellow","red")))
points(x=1:18, y=rep(8,18), pch=19, cex=3, col=rep(c("darkblue","yellow", "darkblue", "red",  "yellow","red")))
# #points(x=1:10, y=rep(1, 10), pch=19, cex=3, col="yellow"))
# points(x=1:10, y=rep(2, 10), pch=19, cex=3, col="darkblue")
# points(x=1:10, y=rep(7, 10), pch=19, cex=3, col="yellow")
# points(x=1:10, y=rep(8, 10), pch=19, cex=3, col="darkblue")
# points(x=1:10, y=rep(9, 10), pch=19, cex=3, col="yellow")
# points(x=1:10, y=rep(3, 10), pch=19, cex=3, col="red")

#points(x=1:10, y=rep(4, 10), pch=19, cex=3, col=rgb(.995, .425, .193))

pal1 <- heat.colors(5, alpha=1)   #  5 colors from the heat palette, opaque

pal2 <- rainbow(5, alpha=.5)      #  5 colors from the heat palette, transparent
pal1 <- c("red", "yellow", "darkblue")
plot(x=1:10, y=1:10, pch=19, cex=4
     , col=pal1)
g4 <- graph( c("John", "Jim", "Jim", "Jack", "Jim", "Jack", "John", "John"), 
             
             isolates=c("Jesse", "Janis", "Jennifer", "Justin") )  

# In named graphs we can specify isolates by providing a list of their names.

g4 <- graph( c("John", "Jim", "Jim", "Jack", "Jim", "Jack", "John", "John"), 
             
             isolates=c("Jesse", "Janis", "Jennifer", "Justin") )  

plot(g4, edge.arrow.size=.5, vertex.color="gold", vertex.size=15, 
     
     vertex.frame.color="gray", vertex.label.color="black", 
     
     vertex.label.cex=0.8, vertex.label.dist=2, edge.curved=0.2) 
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T) 

par(mfrow=c(2,2), mar=c(0,0,0,0))
net.bg <- sample_pa(99) 

V(net.bg)$size <- 12

V(net.bg)$frame.color <- "darkblue"

V(net.bg)$color <- rep(c("red", "yellow", "darkblue"))

V(net.bg)$label <- "" 

E(net.bg)$arrow.mode <- 0

plot(net.bg, layout=layout_with_fr)
plot(net.bg, layout=layout_with_fr)
plot(net.bg, layout=layout_with_fr)
plot(net.bg, layout=layout_with_fr)
