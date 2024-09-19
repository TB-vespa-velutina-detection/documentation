# Lire toutes les lignes du fichier
$inputFile = "ImageNetQant_1_none_CPU_no.txt"
$outputFile = "ImageNetQant_1_none_CPU_no.csv"
$lines = Get-Content $inputFile

# Initialiser un tableau pour stocker les lignes transformées
$outputLines = @()

# Grouper les lignes par paquets de 3
for ($i = 0; $i -lt $lines.Count; $i += 3) {
    # Sélectionner jusqu'à 3 lignes et les joindre avec des virgules
    $group = $lines[$i..([math]::Min($i + 2, $lines.Count - 1))] -join ","
    # Ajouter le groupe au tableau de sortie
    $outputLines += $group
}

# Écrire le résultat dans le fichier de sortie
$outputLines | Set-Content $outputFile
