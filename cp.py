def count_file_contents(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
        
        # Count lines
        lines = content.splitlines()
        num_lines = len(lines)
        
        # Count tabs, spaces, and characters
        num_tabs = content.count('\t')
        num_spaces = content.count(' ')
        num_characters = len(content)
        
        # Count words
        words = content.split()
        num_words = len(words)
        
        # Print the results
        print(f'Number of lines: {num_lines}')
        print(f'Number of tabs: {num_tabs}')
        print(f'Number of spaces: {num_spaces}')
        print(f'Number of words: {num_words}')
        print(f'Number of characters: {num_characters}')

file_path = 'input.txt'  
count_file_contents(file_path)
