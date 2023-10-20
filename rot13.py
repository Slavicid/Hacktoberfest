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

# decode with rot13 chiffre
right_text = "Hallo"
encrypt_text = rot13(right_text)
print(encrypt_text)  # Hallo is "Uynno" 

# encode with rot13 chiffre
decrypt_text = rot13(encrypt_text)
print(decrypt_text)  #is "Hallo" 