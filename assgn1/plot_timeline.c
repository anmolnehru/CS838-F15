#include<stdio.h>
#include<stdlib.h>
#define NO_OF_ENTRIES 42
void main()
{

double start[] = {
 695614
,695631
,695632
,695632
,695633
,695633
,695634
,695634
,695634
,695635
,695635
,695636
,695636
,695637
,695638
,695638
,695639
,695639
,695640
,695640
,695641
,695641
,695641
,695642
,695642
,695643
,752673
,752681
,752682
,752682
,752683
,752683
,752683
,778386
,778401
,778401
,778402
,778402
,806587
,806595
,830632
,830645};

double end[]=
{
 712802
,712946
,713640
,713863
,714703
,714755
,714764
,714781
,714889
,715310
,715322
,715528
,715643
,716808
,718102
,718122
,724770
,727912
,728036
,728406
,729168
,729207
,729503
,729597
,729862
,731085
,765128
,766244
,767139
,767573
,769515
,769824
,769913
,790308
,790311
,790345
,790607
,798930
,814567
,822819
,838518
,845743
};



int initial=start[0];
int final = end[0];

//This will be the number of elements in the array
size_t span = final-initial;

//This runs over all values from min to max
int iter;

//This array will store the data 
int *count=(int *)malloc(span*sizeof(int));

size_t index=span;
//index=span;

while(index--)
{
count[index]=0;
}


int counter;

//iterate over all values of iter
for(iter=initial;iter<final;iter++)
{	
	counter=0;
	for(index=0;index<NO_OF_ENTRIES;index++)//span over all tasks
	{
		if(iter>=start[index] && iter <=end[index])
		counter++; //task is running
		
	}
	count[iter-initial]=counter;
	printf("% d  %d\n",iter-initial, counter);

	
}

//for(index=0;index<span;index++){
//	printf("%d \n",count[index]);
//}

}
