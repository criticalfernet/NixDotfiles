function fish_prompt
set -l last $status
set -l clr
if test $status -ne 0
set clr (set_color red)
else
set clr (set_color green)
end
echo ''
echo (set_color blue) (prompt_pwd -D 3 -d 3)
echo $clr '❱ '
end
