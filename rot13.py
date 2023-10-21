
# a rot13 chiffre from ceasar for secret message 

def rot13(text):
    result=""
    for char in text:
        if 'a' <= char <= 'z':
            result += chr(((ord(char) - ord('a') + 13) % 26) + ord('a'))
        elif 'A' <= char <= 'Z':
            result += chr(((ord(char) - ord('A') + 13) % 26) + ord('A'))
        else:
            result += char
    return result

# chiffre text with rot13 
plain_text = "Hallo"
secret_text = rot13(plain_text)
print(secret_text)  # "Hallo" is "Unyyb" with rot13

# dechiffre Text with rot13 
plain_text = rot13(secret_text)
print(plain_text)  # "Unyyb"  is "Hallo" with rot13

