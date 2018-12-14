//
// Created by nikita on 2018-12-13.
//

#include "xglobal.h"
#include "xstream.h"
#include "aciFont.h"

aciFont::aciFont(void)
{
	flags = 0;
	SizeX = SizeY = Size = 0;
	data = nullptr;
	LeftOffs = RightOffs = nullptr;
}

aciFont::~aciFont(void)
{
	if(data) delete data;
	if(LeftOffs) delete LeftOffs;
	if(RightOffs) delete RightOffs;
}

void aciFont::load(char* fname)
{
	short sx,sy,sz;
	XStream fh(fname, XS_IN);
	fh > sx > sy > sz;
	SizeX = sx;
	SizeY = sy;
	Size = sz;

	data = new unsigned char[SizeX * SizeY * Size];
	fh.read(data,SizeX * SizeY * Size);
	fh.close();
}

void aciFont::calc_offs(void)
{
	int i,j,s,offs = 0;
	int align_left,align_right,fl,fr;
	unsigned char* p = data;

	LeftOffs = new char[Size];
	RightOffs = new char[Size];

	for(s = 0; s < Size; s ++){
		offs = SizeX * SizeY * s;
		align_left = align_right = 3;
		for(i = 0; i < SizeY; i ++){
			fl = fr = 0;
			for(j = 0; j < SizeX - 1; j ++){
				if(flags & ACI_RANGE_FONT){
					if(!fl && p[offs + j] && j < align_left){
						align_left = j;
						fl = 1;
					}
					if(!fr && p[offs + SizeX - j - 1] && j < align_right){
						align_right = j;
						fr = 1;
					}
				}
				else {
					if(!fl && p[offs + j] == 1 && j < align_left){
						align_left = j;
						fl = 1;
					}
					if(!fr && p[offs + SizeX - j - 1] == 1 && j < align_right){
						align_right = j;
						fr = 1;
					}
				}
			}
			offs += SizeX;
		}
		if(s != ' '){
			LeftOffs[s] = align_left;
			RightOffs[s] = align_right;
		}
		else {
			if(SizeX < 8){
				LeftOffs[s] = 1;
				RightOffs[s] = 1;
			}
			else {
				LeftOffs[s] = 3;
				RightOffs[s] = 3;
			}
		}
	}
}