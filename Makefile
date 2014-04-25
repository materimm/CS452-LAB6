run: lab6.cpp
	g++ lab6.cpp -lGL -lGLEW -lSDL2 -o lab6 
clean: 
	rm -f *.out *~ run
