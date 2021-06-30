if(![System.IO.File]::Exists('ffmpeg/bin/ffmpeg.exe')){
	Write-Host "#############[ WARNING ]#############`n## You don't have ffmpeg installed ##`n#####################################"   -ForegroundColor Green
} 

Write-Host "#####################################`n##  Youtube-dl Powershell script.  ##`n##            ViralWare            ##`n#####################################"   -ForegroundColor Red

$msg = 'Wanna download another one? [ Y | n ]'
do {
	try {
		$url = Read-Host -Prompt 'Enter Video URL' 
		Write-Host "URL: $url" -ForegroundColor Red -BackgroundColor Yellow
		.\youtube-dl.exe --no-warnings --console-title --newline --ffmpeg-location "ffmpeg/bin" $url
	}
	catch {
		"An error occurred"
		Write-Host $_
		$dlreq = "It seems you don't have youtube-dl installed. Would you like to install it? [ Y | N ]"
		do {
			Write-Host -NoNewline -ForegroundColor Red -BackgroundColor Yellow "It seems you don't have youtube-dl installed. Would you like to install it? y/n:"
			Write-Host -NoNewline ' '
			$dlresponse = Read-Host
			if ($dlresponse -eq 'n') {
				break
			}
		} until ($dlresponse -eq 'y')
		Invoke-WebRequest -Uri 'https://yt-dl.org/downloads/2021.06.06/youtube-dl.exe' -OutFile "youtube-dl.exe"
		$url = Read-Host -Prompt 'Enter Video URL' 
		Write-Host "URL: $url" -ForegroundColor Red -BackgroundColor Yellow
		.\youtube-dl.exe --no-warnings --console-title --newline --ffmpeg-location "ffmpeg/bin" $url
	}
	Write-Host -NoNewline -ForegroundColor Red -BackgroundColor Yellow 'Wanna download another one? Y/n:'
	Write-Host -NoNewline ' '
	$response = Read-Host 
} until ($response -eq 'n') break