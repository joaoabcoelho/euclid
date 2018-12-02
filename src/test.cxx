#include <iostream>
#include <ctime>
#include <math.h>

using namespace std;

int main(){

    float d;
   
    float x = 1;
    float y = 20;

    int trials = 1e8;

    clock_t startTime = clock();

    for(int i=0; i<trials; i++){
        d = sqrt(x*x + y*y);
    }  

    clock_t endTime = clock();
    clock_t clockTicksTaken = endTime - startTime;
    double timeInSeconds = clockTicksTaken / (double) CLOCKS_PER_SEC;

    cout << endl << "  Clock: " << timeInSeconds*1e9/trials << " ns / computation." << endl << endl;
    
    cout << "  200kx200k = " << timeInSeconds/trials*2e5*2e5 << " sec" << endl << endl;

    return 0;

}
