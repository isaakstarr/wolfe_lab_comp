' export_to_mol.vbs
Option Explicit

Dim FSO, folder, file, app, doc
Dim cdxmlPath, molPath

' Create FileSystemObject and ChemDraw application
Set FSO = CreateObject("Scripting.FileSystemObject")
Set app = CreateObject("ChemDraw.Application")

' Point to your folder of CDXMLs
Set folder = FSO.GetFolder("C:\Users\WolfeLab2\Desktop\docking\Compounds_test")

For Each file In folder.Files
    cdxmlPath = file.Path
    
    ' Only process .cdxml files
    If LCase(FSO.GetExtensionName(cdxmlPath)) = "cdxml" Then
        WScript.Echo "Processing: " & cdxmlPath
        
        ' Try to open in ChemDraw
        On Error Resume Next
        Set doc = app.Documents.Open(cdxmlPath)
        On Error GoTo 0
        
        If Not doc Is Nothing Then
            ' Wait for the document to load
            WScript.Sleep 500
            
            ' Build the .mol path
            molPath = FSO.BuildPath(folder.Path, FSO.GetBaseName(cdxmlPath) & ".mol")
            
            ' SaveAs without specifying a filter: ChemDraw infers from extension
            On Error Resume Next
            doc.SaveAs molPath
            If Err.Number = 0 Then
                WScript.Echo "  ✅ Saved: " & molPath
            Else
                WScript.Echo "  ❌ SaveAs error: " & Err.Description
                Err.Clear
            End If
            On Error GoTo 0
            
            ' Close the document without saving
            doc.Close False
            Set doc = Nothing
        Else
            WScript.Echo "  ❌ Open error for: " & cdxmlPath
        End If
    End If
Next

' Quit ChemDraw
app.Quit
Set app = Nothing
Set FSO = Nothing

WScript.Echo "All done exporting Molfiles."
