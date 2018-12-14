//
// Created by nikita on 2018-12-12.
//

#ifndef VANGERS_INTERFACERENDERER_H
#define VANGERS_INTERFACERENDERER_H

#include <memory>
#include "vgl/shader.h"
#include "vgl/texture_ext.h"
#include "glm/glm.hpp"
#include "Font.h"


class InterfaceRenderer {
private:
	std::shared_ptr<vgl::Shader> shader;
public:
	void renderTexture(std::shared_ptr<vgl::Texture2D>& texture, const glm::vec2& pos, const glm::vec2& size) const;
	void renderTexture(std::shared_ptr<vgl::Texture2DArray>& texture, int frame, const glm::vec2& pos, const glm::vec2& size) const;
	void renderFont(const std::string& str, const Font& font, const glm::vec2& pos, int scale = 1) const;
};


#endif //VANGERS_INTERFACERENDERER_H
