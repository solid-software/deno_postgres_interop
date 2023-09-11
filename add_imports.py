import argparse
from pathlib import Path

search_for_prefix = 'new self.'

classes_map = {
    'query/query.ts': ['QueryObjectResult'],
    'mod.ts': ['QueryClient', 'Client', 'Transaction'], 
}

def main():
    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('filename')
    args = argument_parser.parse_args()
    source = Path(args.filename).read_text()

    indexes = []
    start_index = 0

    while True:
        index = source.find(search_for_prefix, start_index)
        if index == -1:
            break
        indexes.append(index)
        start_index = index + 1

    prefix_len = len(search_for_prefix)

    classes = []
    for index in indexes:
        end = source.find('(', index)
        start = index + prefix_len
        classname = source[start:end]

        filename = None
        for file, file_classes in classes_map.items():
            if classname in file_classes:
                filename = file
                break

        if filename is not None:
            classes.append((classname, filename))


    new_source = ''
    for classname, filename in classes:
        url = f'https://deno.land/x/postgres@v0.17.0/{filename}'
        new_source += f'import {{ {classname} }} from "{url}";\n'
    
    for classname, filename in classes:
        new_source += f'self.{classname} = {classname}\n'

    new_source += source

    Path(args.filename).write_text(new_source)

if __name__ == '__main__':
    main()
