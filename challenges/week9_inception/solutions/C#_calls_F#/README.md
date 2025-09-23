# DOTNET 
All dotnet languanges have interoperability, meaning they can all call eachother. This is a C# program calling a F# library.


## 🛠️ Directory Layout
```
.
├── CSharpApp
│   ├── CSharpApp.csproj
│   └── Program.cs
└── HelloLib
    ├── Hello.fs
    └── HelloLib.fsproj

```

## How to Clean, Build, and Run the Project
1. Clean project
```bash
# Clean the F# library
dotnet clean HelloLib

# Clean the C# application
dotnet clean CSharpApp
```
2. Build Project
```bash
# Build the F# library
dotnet build HelloLib

# Build the C# application (which references the F# library)
dotnet build CSharpApp
```
3. Run the C# Application
```bash
dotnet run --project CSharpApp
```
4. Reclean project
```bash
dotnet clean HelloLib
dotnet clean CSharpApp
rm -rf CSharpApp/bin
rm -rf CSharpApp/obj
rm -rf HelloLib/bin
rm -rf HelloLib/obj
```

