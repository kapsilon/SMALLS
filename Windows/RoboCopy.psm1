# Copying all folders and files
Function RoboCopy-All-Files($oldDirectory, $newDirectory) {
    robocopy  `
        $oldDirectory `
        $newDirectory `
        /E `
        /COPY:DAT `
        /DCOPY:DAT `
        /R:100 `
        /sl
}
Set-Alias copyall -Value RoboCopy-All-Files

# Create tree of files with zero length
Function RoboCopy-Zero-Tree($oldDirectory, $newDirectory) {
    robocopy  `
        $oldDirectory `
        $newDirectory `
        /CREATE `
        /MIR `
        /COPY:DAT `
        /DCOPY:DAT `
        /R:100
}

# Very simple diff of file trees
Function Compare-Difference-Of-Trees($old, $new, $diff) {
    if ($old -and $new -and $diff) {
        $treeold = tree $old
        $treenew = tree $new
        Compare-Object $treeold $treenew > $diff
    } else{
        Write-Output "difftree path/to/dir1 path/to/dir2 path/to/difffile"
    }
}
Set-Alias difftree -Value Compare-Difference-Of-Trees