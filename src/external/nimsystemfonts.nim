import os

const defaultFontsDirectories =
  when defined(android):
    ["/system/fonts"]
  elif defined(macosx):
    [
      "/Library/Fonts/",
      "/System/Library/Fonts/",
      "/Network/Library/Fonts/",
      expandTilde("~/Library/Fonts/")
    ]
  elif defined(windows):
    [
      getEnv("WINDIR", r"C:\Windows") & r"\Fonts\",
      getEnv("WINDIR", r"C:\Windows") & r"\System32\Fonts\",
      getEnv("USERPROFILE") & r"\AppData\Local\Microsoft\Windows\Fonts\"
    ]
  else:
    [ 
      "/usr/share/fonts/",
      "/usr/local/share/fonts/",
      "/usr/lib/X11/fonts/",
      "/usr/local/lib/X11/fonts/",
      "/usr/X11R6/lib/X11/fonts/",
      "/usr/local/X11R6/lib/X11/fonts/",
      "/var/lib/fonts/",
      expandTilde("~/.local/share/fonts/"),
      expandTilde("~/.fonts/")
    ]

proc getSystemFonts*(): seq[string] =
  result = @[]
  for dir in defaultFontsDirectories:
    for filePath in walkDirRec(dir, {pcFile, pcLinkToFile}):
      if splitFile(filePath).ext in [".ttf", ".otf"]:
        result.add(filePath)