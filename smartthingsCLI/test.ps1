$folderName = $args[0]
$newFolder = "$folderName-shadow"

Remove-Item -Recurse -Force $newFolder 
New-Item -ItemType Directory -Path $newFolder
Copy-Item "$folderName/*" $newFolder

./smartthings.exe edge:drivers:package $newFolder

$process = Start-Process -FilePath ./smartthings.exe -ArgumentList "edge:channels:create" -PassThru
$process.StandardInput.WriteLine("shadow-drivers")
$process.StandardInput.WriteLine("Shadow drivers")
$process.StandardInput.WriteLine("uncc.edu")
$process.WaitForExit()