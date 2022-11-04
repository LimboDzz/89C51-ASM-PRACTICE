#include <reg52.h>

#define uint unsigned int
#define uchar unsigned char
#define OUT P2

sbit pos=P1^0;									//clockwise
sbit neg=P1^1;									//anti-clockwise

char idx=0;
uint rpm=60;
uchar code turn[]={0x02,0x06,0x04,0x0c,0x08,0x09,0x01,0x03};

void setTimer0(uint rpm){
	//((1m*60)s*1000000)us | 24step/rev
	uint t0=60*1000000/rpm/24;	//us per step
	TH0=(65536-t0)/256;
	TL0=(65536-t0)%256;
}

void init(){
	TMOD=0x01;			//0b00000001
	setTimer0(rpm);
	EA=1;ET0=1;TR0=1;
}

void timer0() interrupt 1 {
	setTimer0(rpm);
	OUT=turn[idx];
	idx=++idx%8;
}

void main(){
	OUT=0x03;
	init();
	while(1);
}

