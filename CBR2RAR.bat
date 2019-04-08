@echo off

::Renaming all archives to RAR
ren *.cbr *.rar
ren *.cbz *.rar
ren *.zip *.rar

::Delete article THE
ren "The *.rar" "////*.rar"
ren "The_*.rar" "////*.rar"
