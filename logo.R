# Helper theme for ggplot icon
theme_icon <- function () {
  theme_void() + 
    theme(
      panel.background = element_rect(fill = "transparent", colour = NA), 
      plot.background = element_rect(fill = "transparent", colour = NA), 
      legend.background = element_rect(fill = "transparent", colour = NA), 
      legend.box.background = element_rect(fill = "transparent", colour = NA)
    )
}

library(hexSticker)
library(lubridate)
data=bind_cols(x=1,y=1,label=paste("SDS\n",year(now())))
p=ggplot(data,aes(x=x,y=y,label=label)) + 
  geom_text(size=13,color = "white", fill = "transparent") +
  theme_icon()



  p.sticker <- sticker(
  p, package=" ", p_size=2, 
  s_x=1, s_y=1.1, s_width=1.3, s_height=1.5,
  h_color = "#478bca", h_fill = "#478bca",
  filename="SDS-icon-sticker.png"
)
