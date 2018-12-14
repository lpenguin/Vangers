//
// Created by nikita on 2018-12-13.
//

#include "Font.h"

std::shared_ptr<Font> Font::fromAciFont(const aciFont* font){
	auto texture = vgl::Texture2DArray::create(
			{font->SizeX, font->SizeY, font->Size},
			vgl::TextureInternalFormat::R8ui
			);
	texture->subImage(
			{0, 0, 0},
			texture->getDimensions(),
			vgl::TextureFormat::RedInteger,
			vgl::TextureDataType::UnsignedByte,
			font->data
			);
	std::vector<int> leftOffs(font->Size);
	std::vector<int> rightOffs(font->Size);

	for(int i = 0; i < font->Size; i++){
		leftOffs.push_back(font->LeftOffs[i]);
		rightOffs.push_back(font->RightOffs[i]);
	}
	return std::make_shared<Font>(texture, font->Size, leftOffs, rightOffs);
}