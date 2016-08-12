map <F3> :Tlist<CR>
"autocmd VimEnter * TlistToggle "启动时强制打开taglist窗口
let Tlist_Show_One_File=1 "一次只显示一个文件的tag，默认会显示所有打开过的
let Tlist_Use_Right_Window=1 "将taglist窗口放到右边，因为左边放了NERDTree，所以这条很有用！
let Tlist_Compact_Format=1 "紧凑显示，在有限的窗口里可以多显示几行内容
