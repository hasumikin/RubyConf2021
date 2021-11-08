# puts font_families.sort
@xx_large_font_size = screen_size(13 * Pango::SCALE)
@x_large_font_size = screen_size(8 * Pango::SCALE)
@large_font_size = screen_size(6 * Pango::SCALE)
@normal_font_size = screen_size(5 * Pango::SCALE)
@small_font_size = screen_size(4 * Pango::SCALE)
@x_small_font_size = screen_size(3.5 * Pango::SCALE)
@xx_small_font_size = screen_size(3 * Pango::SCALE)

#@font_family = find_font_family('Oswald')
#@font_family = find_font_family('OCR A Extended')
@font_family = find_font_family('Courier Prime')
@monospace_font_family = 'OCR A Extended'
@title_font_family = find_font_family('antimatrix')

@default_headline_line_color = '#171714'
@default_headline_line_width = 0
@default_headline_line_expand = false

matrix_green_terminal = "#a9f9d5"
matrix_green_title = "#e2ffd6"
matrix_green_title_2 = "#00FFAF"
set_graffiti_color matrix_green_title
set_graffiti_line_width 8

#@table_frame_color = "#ffffff"
#@table_fill_color = "#0f0428"
#@table_body_frame_color = "#ffffff"
#@table_body_fill_color = "#3f3468"
#@table_head_frame_color = "#ffffff"
#@table_head_fill_color = "#rf0428"

@preformatted_fill_color = "#000000"
@preformatted_frame_color = matrix_green_title
# @preformatted_centering = true
@space = screen_y(1)

@image_slide_number_show_flag = false
@image_slide_number_start_flag_color = "#0c0c0c"
@image_slide_number_goal_flag_color  = "#0c0c0c"
@image_slide_number_text_color  = "#0c0c0c"
@image_slide_number_image = "images/black.png"
@image_timer_image = "images/black.png"

include_theme('default')

match Slide, HeadLine do |heads|
  heads.prop_set("size", @large_font_size)
  heads.prop_set("weight", "bold")
end
match Slide do |slides|
  #slides.prop_set("foreground", "#171714")
  slides.prop_set "foreground", matrix_green_terminal
end

@slide_headline_hide = true
match TitleSlide do |slides|
  #slides.margin_left = 900
  slides.vertical_centering = true
  #slides.prop_set "foreground", "#171714"
  slides.prop_set "foreground", matrix_green_title
  slides.prop_set "font-family", "antimatrix"
  slides.prop_set("weight", "bold")
end
match TitleSlide, Title do |title|
  title.margin_top = 220
  title.prop_set("size", @xx_large_font_size)
end
match TitleSlide, Subtitle do |subtitle|
  subtitle.margin_top = 0
  subtitle.prop_set("size", screen_size(7 * Pango::SCALE))
end
match TitleSlide, Author do |author|
  author.margin_top = 150
  author.prop_set("weight", "normal")
  author.prop_set("size", screen_size(6.5 * Pango::SCALE))
end
match TitleSlide, Place do |place|
  place.prop_set("size", screen_size(4 * Pango::SCALE))
end
#match TitleSlide, "*" do |elems|
#  elems.horizontal_centering = false
#end

# Cites
#match Slide do |slides|
#  slides.each do |slide|
#    if slide.match?(/Acknowledgement/)
#      slide.horizontal_centering = true
#    end
#  end
#end

@title_slide_background_image = 'images/matrix_prk_firmware.jpg'
include_theme("title-slide-background-image")

@slide_background_image = 'images/black.png'
include_theme("slide-background-image")

#@slide_logo_image = 'images/mark48.png'
#include_theme('slide-logo')

@item_image_1 = 'images/red_pill_48.png'
@item_image_2 = 'images/red_pill_40.png'
@item_image_3 = 'images/red_pill_32.png'

include_theme("default-item-mark")

add_image_path("rabbit-images")

slide_body = [Slide, Body]
item_list_item = [ItemList, ItemListItem]

indent = 50

match(*(slide_body + (item_list_item * 1))) do |items|
  name = "item1"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_1, name, indent: indent)
end

match(*(slide_body + (item_list_item * 2))) do |items|
  name = "item2"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_2, name, indent: indent)
end

match(*(slide_body + (item_list_item * 3))) do |items|
  name = "item3"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_3, name, indent: indent)
end

enum_list_item = [EnumList, EnumListItem]

match(*(slide_body + enum_list_item + item_list_item)) do |items|
  name = "enum-item1"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_1, name, indent: indent)
end

match(*(slide_body + enum_list_item + (item_list_item * 2))) do |items|
  name = "enum-item2"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image_2, name, indent: indent)
end


match(Slide) do |slides|
  slides.each do |slide|
    if slide.match? /VCENTER/
      slide.vertical_centering = true
    end
    if slide.match? /HCENTER/
      slide.horizontal_centering = true
      slide.vertical_centering = false
    end
    if slide.match? /XXLARGE/
      slide.prop_set "size", @xx_large_font_size
    elsif slide.match? /XLARGE/
      slide.prop_set "size", @x_large_font_size
    end
    if slide.match? /MONO/
      slide.prop_set "font-family", @monospace_font_family
      slide.prop_set "foreground", matrix_green_title_2
    elsif  slide.match? /TITLE/
      slide.prop_set "font-family", @title_font_family
      slide.prop_set "foreground", matrix_green_title_2
    end
  end
end

match(Slide, HeadLine) do |heads|
  heads.each do |head|
    if head.match? /(VCENTER|HCENTER|TITLE|HIDE)/
      head.prop_set "size", 0
    end
  end
end
