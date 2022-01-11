library(hexSticker)

sticker("https://drexel.edu/identity/drexel/dragon-icon/",
        package="shinyUHC",

        filename="imgfile.png")


library(hexSticker)
library(ggplot2)

p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point()
p <- p + theme_void() + theme_transparent()

sticker(p, package="hexSticker", p_size=20, s_x=1, s_y=.75, s_width=1.3, s_height=1,
        filename="ggplot2.png")


### Imagea
imgurl <- system.file("DragonIcon_Blue_HEX.png")


sticker("DragonIcon_Blue_HEX.png", package="shinyUHC",
        p_color  = "#303C51", p_family = "lato",p_size=25,
        h_fill="#ffffff", h_color="#303C51",
        s_x=1, s_y=.75, s_width=.6,
        filename="imgfile.png")




