//
// Created by nikita on 2018-12-13.
//

#ifndef VANGERS_FONT_H
#define VANGERS_FONT_H

#include <memory>
#include <vector>
#include "vgl/texture_ext.h"
#include "aciFont.h"

class Font {
private:
	std::shared_ptr<vgl::Texture2DArray> texture;
	int numChars;
	std::vector<int> LeftOffs;
	std::vector<int> RightOffs;
public:
	Font(std::shared_ptr<vgl::Texture2DArray>& texture, int numChars, std::vector<int> LeftOffs, std::vector<int> RightOffs):
	texture(std::move(texture)),
	numChars(numChars),
	LeftOffs(LeftOffs),
	RightOffs(RightOffs)
	{}
	static std::shared_ptr<Font> fromAciFont(const aciFont* aciFont);
};


#endif //VANGERS_FONT_H
