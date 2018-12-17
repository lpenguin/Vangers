//
// Created by nikita on 2018-12-08.
//

#ifndef UPLOADBENCH_UNIFORM_EXT_H
#define UPLOADBENCH_UNIFORM_EXT_H

#include "uniform.h"
#include "glm/glm.hpp"

namespace vgl {
	template <>
	void Uniform<glm::vec4>::_assign(GLint attrId, const glm::vec4& data);

	template <>
	void Uniform<glm::vec3>::_assign(GLint attrId, const glm::vec3& data);

	template <>
	void Uniform<glm::vec2>::_assign(GLint attrId, const glm::vec2& data);

	template <>
	void Uniform<glm::mat4>::_assign(GLint attrId, const glm::mat4& data);
}
#endif //UPLOADBENCH_UNIFORM_EXT_H