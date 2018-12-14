//
// Created by nikita on 2018-12-13.
//

#ifndef VANGERS_ACIFONT_H
#define VANGERS_ACIFONT_H

const int ACI_RANGE_FONT = 0x01;

struct aciFont
{
	int flags;

	int SizeX;
	int SizeY;
	int Size;

	unsigned char* data;
	char* LeftOffs;
	char* RightOffs;

	void load(char* fname);
	void calc_offs(void);

	aciFont(void);
	~aciFont(void);
};


#endif //VANGERS_ACIFONT_H
