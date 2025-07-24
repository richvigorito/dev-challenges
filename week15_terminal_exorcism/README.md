# 😈 Week 15: Terminal Exorcist – Delete the Undeletables

## 💀 Challenge Overview  
You’re dropped into a Docker container with a haunted ~/files/ directory. It's full of cursed files that:

- Have invisible characters
- Start with - or --
- Use unicode weirdness
- Contain slashes or backticks
- Use newlines or null bytes (yikes!)

Your job? Exorcise the directory until it’s empty.

## 🏁 Challenge Format:  
**Head-to-Head Speed Round** ⚡🌐  
- Build container:  `docker build -t terminal_exorcism .`
- Put **5 minutes** on the clock
- Start by running  container:  `docker run -it terminal_exorcism`
- Delete as many files as you can. 

## 🎯 Bonus Ideas
- Discuss any challeges
- Discuss any times these mightmare files exists
- Add your own undeleteable files to the container (if you do please submit a PR 👊 


