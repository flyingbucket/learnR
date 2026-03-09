library(tidyverse)
library(ggplot2)
library(ggthemes)
library(palmerpenguins)

glimpse(penguins)
dim(penguins)
summary(penguins)
str(penguins)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

# exercise 3
# 创建一个 bill_depth_mm vs. bill_length_mm 的散点图。
# 也就是说，在 y-axis 上绘制 bill_depth_mm，在 x-axis 上绘制 bill_length_mm。
# 描述这两个变量之间的关系。
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth()

# exercise 4
# 如果你绘制 species vs. bill_depth_mm 的散点图，会发生什么？
# 选择什么样的几何图形可能更好？
?aes
ggplot(data = penguins, mapping = aes(x = species, y = bill_depth_mm)) +
  geom_boxplot(mapping = aes(color = species))

# exercise 6
# 在 geom_point() 中，na.rm 参数的作用是什么？
# 这个参数的默认值是什么？ 创建一个散点图，并成功地将该参数设置为 TRUE。
ggplot(data = penguins, mapping = aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point(mapping = aes(color = species), na.rm = TRUE)


# excerise 7
# 在前面绘制的图中添加以下说明：“Data come from the palmerpenguins package.”
# 提示：查看 labs() 的文档。
?labs
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species",
    caption = "Data come from the palmerpenguins package."
  ) +
  scale_color_colorblind()
