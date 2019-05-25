$minConstantValue = 1000
$minBs = 0
$minNdays = 0
for ($bs=1; $bs -le 9; $bs++) {
    for ($ndays=1; $ndays -le 9; $ndays++) {
        wsl make t BS=$bs NDAYS=$ndays
        $constantValueLine = wsl make BS=$bs NDAYS=$ndays | wsl grep Constant
        $null = ($constantValueLine -match '\d+\.\d+$')
        $constantValue = [decimal]$Matches[0]
        Write-Host "BS=$bs NDAYS=$ndays Constant=$constantValue"
        if ($constantValue -lt $minConstantValue) {
            $minConstantValue = $constantValue
            $minBs = $bs
            $minNdays = $ndays
        }
    }
}

Write-Host "Minimal values BS=$minBs NDAYS=$minNdays Constant=$minConstantValue"