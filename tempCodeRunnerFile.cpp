#include<iostream>
#include<bits/stdc++.h>
using namespace std;

int main(){
    int A[]={-12,17,-13,17};
    int N=sizeof(A)/sizeof(A[0]);
    sort(A,A+N);
    for(int i=0;i<N;i++){
        cout<<A[i];
    }
    return 0;
}