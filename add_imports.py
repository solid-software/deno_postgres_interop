import argparse
from pathlib import Path

search_for_prefix = 'new self.'

classes_map = {
    'query/query.ts': ['QueryObjectResult'],
    'mod.ts': ['QueryClient', 'Client', 'Transaction'], 
}

file_url_prefix = 'https://deno.land/x/postgres@v0.17.0/'


def main():
    filename = read_filename()
    source = Path(filename).read_text()

    indices = find_indices(source)
    
    prefix_len = len(search_for_prefix)

    classes = []
    for index in indices:
        end = source.find('(', index)
        start = index + prefix_len
        classname = source[start:end]

        filename_ = None
        for file, file_classes in classes_map.items():
            if classname in file_classes:
                filename_ = file
                break

        if filename_ is not None:
            classes.append((classname, filename_))

    new_source = create_prefix(classes) + '\n' + source

    Path(filename).write_text(new_source)


def read_filename():
    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('filename')
    args = argument_parser.parse_args()
    
    return args.filename


def find_indices(source):
    indices = []
    start_index = 0
    while True:
        index = source.find(search_for_prefix, start_index)
        if index == -1:
            break
        indices.append(index)
        start_index = index + 1

    return indices


def create_prefix(classes):
    return '\n'.join(
        map(
            lambda f: '\n'.join(
                map(f, classes)
            ),
            [create_import_string, create_init_string]
        )
    )


def create_init_string(class_):
    classname= class_[0]
    return f'self.{classname} = {classname}'


def create_import_string(class_):
    classname, filename = class_
    url = f'{file_url_prefix}{filename}'
    return f'import {{ {classname} }} from "{url}";'


if __name__ == '__main__':
    main()
