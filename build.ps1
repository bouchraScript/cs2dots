if(-not(Test-Path dist))
{
    New-Item -ItemType Directory dist
}
cd src/Cs2Dots.Lib
dotnet restore
cd ../Cs2Dots
dotnet restore
dotnet publish -o ../cs-syntax-visualizer/out/bin/Cs2Dots
dotnet publish -o ../../dist/Cs2Dots
cd ../Cs2DotsWeb
dotnet restore
dotnet publish -o ../../dist/Cs2DotsWeb
cd ../cs-syntax-visualizer
npm install
vsce package
cp *.vsix ../../dist