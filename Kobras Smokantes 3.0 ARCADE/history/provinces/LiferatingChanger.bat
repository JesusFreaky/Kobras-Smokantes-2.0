import os
import re

path = "provinces"  
new_life_rating = 32 

for root, _, files in os.walk(path):
    for filename in files:
        if filename.endswith(".txt"):
            filepath = os.path.join(root, filename)
            with open(filepath, "r+") as file:
                content = file.read()
                new_content = re.sub(r"^life_rating\s*=\s*\d+", lambda m: f"life_rating = {new_life_rating}", content, flags=re.MULTILINE)
                file.seek(0)
                file.truncate()
                file.write(new_content)