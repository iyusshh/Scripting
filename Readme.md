# 🖥️ Scripting Utilities

A small collection of batch scripts and examples for automating git workflows, login scripts, and miscellaneous tasks.

---

## 📂 Contents

| File | Purpose |
|---|---|
| `BlindCommit.bat` | Automates git commit with a generic message even when there are no staged changes. |
| `GitPush(NoCommit).bat` | Pushes to remote without staging or committing (for intentional direct pushes). |
| `GitPush.bat` | Standard commit + push script. |
| `WiFiLogin.example` | Example script for automating WiFi login (username/password template). |
| `test.txt` | Sample or placeholder file for testing or reference. |

---

## ⚙️ Usage

### BlindCommit.bat  
Use when you want to force a commit even if there are no changes staged:

BlindCommit.bat


You may edit the script to customize commit message or behavior.

---

### GitPush(NoCommit).bat  
Pushes directly to remote without creating a commit:



GitPush(NoCommit).bat


Caution: Use only when you’re sure about your push.

---

### GitPush.bat  
Standard workflow script:



GitPush.bat


This will typically `git add`, `git commit`, then `git push`. You can modify the commit message prompt inside the script.

---

### WiFiLogin.example  
Template script to automate WiFi login (if your network requires login credentials via a web form).  
Rename and fill in your credentials:



WiFiLogin.example → WiFiLogin.bat


Then run:



WiFiLogin.bat


---

## 🧩 Customization Tips

- Modify the commit messages used in the `.bat` scripts to better reflect your project naming conventions.
- Add error handling in scripts (e.g. check if git is installed, internet is connected, etc.).
- For `WiFiLogin`, you could extend it using `curl` or `powershell` scripts to handle login form submissions automatically.

---

## ⚠️ Warnings & Best Practices

- Use `GitPush(NoCommit).bat` with caution — skipping commit stage can lead to unintended pushes.
- Always test `WiFiLogin` scripts with dummy credentials first to avoid accidental lockouts.
- Backup your files before using any automation.




