$files = @(
    'article-avk.html',
    'article-integrator.html',
    'article-lighting.html',
    'article-room-vs-livingroom.html',
    'article-security.html',
    'article-smart-home-guide.html',
    'article-theater-budget.html'
)

foreach($f in $files) {
    $path = "F:/OpenClaw/ws_xiaoyang/blog/$f"
    $content = Get-Content $path -Raw
    if($content -match '<link rel="stylesheet" href="article.css">\s*</head>') {
        $newContent = $content -replace '(<link rel="stylesheet" href="article.css">\s*</head>)', '<link rel="stylesheet" href="article.css">
    <style>body { padding-top: 70px !important; }</style>
</head>'
        Set-Content $path -Value $newContent -NoNewline
        Write-Host "Fixed: $f"
    }
}
