@echo off

::Renaming all archives to RAR
ren *.cbr *.rar
ren *.cbz *.rar
ren *.zip *.rar

::Delete article The/A/An
ren "The *.rar" "////*.rar"
ren "The_*.rar" "////*.rar"
ren "A *.rar" "//*.rar"
ren "A_*.rar" "//*.rar"
ren "An *.rar" "///*.rar"
ren "An_*.rar" "///*.rar"
