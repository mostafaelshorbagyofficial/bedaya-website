Add-Type -AssemblyName System.Drawing
$imgPath = "C:\Users\0000\.gemini\antigravity\scratch\bedaya-website\assets\reference_mockup.jpg"
$outPath = "C:\Users\0000\.gemini\antigravity\scratch\bedaya-website\assets\hero_bg.jpg"

$img = [System.Drawing.Image]::FromFile($imgPath)
Write-Output "Image size: $($img.Width) x $($img.Height)"

# Crop top 43% of height
$h = [int]($img.Height * 0.43)
$rect = New-Object System.Drawing.Rectangle(0, 0, $img.Width, $h)
$crop = New-Object System.Drawing.Bitmap($rect.Width, $rect.Height)
$g = [System.Drawing.Graphics]::FromImage($crop)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.DrawImage($img, (New-Object System.Drawing.Rectangle(0, 0, $rect.Width, $rect.Height)), $rect, [System.Drawing.GraphicsUnit]::Pixel)
$crop.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)

$g.Dispose()
$crop.Dispose()
$img.Dispose()
Write-Output "Saved hero_bg.jpg"
