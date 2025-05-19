draw_set_font(fnt_example);
if (!pause) p = "pause"; else p = "resume";
if (!ProcIdExists(procId) || exe == "") e = "<undefined>"; else e = exe;
for (var n = 0; n < 4; n++) {
  tmp[n] = string_replace_all(key[n], " ", "");
  tmp[n] = string_replace_all(key[n], "\r", "");
  tmp[n] = string_replace_all(key[n], "\n", "");
  tmp[n] = string_replace_all(key[n], "\t", "");
  tmp[n] = string_replace_all(key[n], "\v", "");
  tmp[n] = string_replace_all(key[n], "\f", "");
  tmp[n] = string_replace_all(key[n], "\b", "");
  if (tmp[n] == "") key[n] = "<undefined>";
}
if (e != "<undefined>") {
  versinfo = " \nFile Description = " + key[0] +
  " \nSoftware Product Name = " + key[1] +
  " \nOriginal File Name = " + key[2] +
  " \nCompany = " + key[3] +
  " \nCopyright = " + key[4];
} else {
  versinfo = " \nFile Description = " + e +
  " \nSoftware Product Name = " + e +
  " \nOriginal File Name = " + e +
  " \nCompany = " + e +
  " \nCopyright = " + e;
}
str = "Press 'p' key to " + p + " enumeration. Use up and down\narrow keys when paused to navigate manually." +
" \n\nProcess Identifier = " + string(procId) +
" \nExecutable File Name = " + e + versinfo;
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
display_set_gui_size(string_width(str) + 32, string_height(str) + 32);
window_set_size(string_width(str) + 32, string_height(str) + 32);
window_center();
draw_text((string_width(str) + 32) / 2, (string_height(str) + 32) / 2, str);