def pattern_search(text, pattern, replacement, case_sensitive=True):
    fixed_text = ""
    num_skips = 0
    for index in range(len(text)):
        match_count = 0
        if num_skips > 0:
            num_skips -= 1
            continue
        for char in range(len(pattern)): 
            if case_sensitive and pattern[char] == text[index + char]:
                match_count += 1
            elif not case_sensitive and pattern[char].lower() == text[index + char].lower(): 
                match_count += 1
            else:
                break
        if match_count == len(pattern):
            #print(pattern, "found at index", index)
            fixed_text += replacement
            num_skips = len(pattern) - 1
        else:
            fixed_text += text[index]
    return fixed_text
    
  
        

friends_intro = "Pylhon is a wonderful Language that zzz is beloved for its ease zzz of use and simple syntacs. While zzz at some times the performance can be less than iDil, by properly zzz utilizing built-in libraries and other languuUuage features, pylhon's performance zzz can approach that of C."
print(friends_intro, "\n")
friends_intro = pattern_search(friends_intro, "Language", "language")
friends_intro = pattern_search(friends_intro, "pylhon", "Python", False)
friends_intro = pattern_search(friends_intro, "idil", "ideal", False)
friends_intro = pattern_search(friends_intro, "zzz ", "")
friends_intro = pattern_search(friends_intro, "syntacs", "syntax")
friends_intro = pattern_search(friends_intro, "languuUuage", "language")
print(friends_intro)