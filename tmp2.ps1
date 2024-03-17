$csvPath = "C:\path\to\your\csvfile.csv"
$fileNames = Import-Csv -Path $csvPath | Select-Object -ExpandProperty name

# コピー元とコピー先のフォルダパスを設定
$sourceFolder = "C:\path\to\source\folder"
$destinationFolder = "C:\path\to\destination\folder"

# ファイルをコピーする
foreach ($fileName in $fileNames) {
    $sourceFile = Join-Path -Path $sourceFolder -ChildPath $fileName
    $destinationFile = Join-Path -Path $destinationFolder -ChildPath $fileName
    Copy-Item -Path $sourceFile -Destination $destinationFile -Force
}
