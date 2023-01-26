# npm run build
$server_root="../flask-server"
if ( Test-Path $server_root/static -PathType Container ) {
    rm -r $server_root/static
}
mkdir $server_root/static

if ( Test-Path $server_root/templates -PathType Container ) {
    rm -r $server_root/templates
}
mkdir $server_root/templates

cp dist/index.html $server_root/templates/
cp -r dist/* $server_root/static
rm $server_root/static/index.html
