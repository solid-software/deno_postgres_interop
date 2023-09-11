import argparse
from pathlib import Path
import yaml

search_for_prefix = 'new self.'


def main():
    filename, configpath = read_args()
    source = Path(filename).read_text()
    config = yaml.safe_load(Path(configpath).read_text())

    print(config)

    indices = find_indices(source)
    classes = filter_classes(indices, source, config['classes_map'])

    if (len(classes) == 0):
        return

    new_source = create_prefix(classes, config['file_url_prefix']) + '\n' + source
    Path(filename).write_text(new_source)


def read_args():
    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument('filename')
    argument_parser.add_argument('configpath')
    args = argument_parser.parse_args()
    
    return args.filename, args.configpath


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


def filter_classes(indices, source, classes_map):
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
            if source.find(f'import {{ {classname} }}') == -1:
                classes.append((classname, filename_))
    
    return classes


def create_prefix(classes, file_url_prefix):
    return '\n'.join(
        map(
            lambda f: '\n'.join(
                map(f, classes)
            ),
            [
                lambda class_: create_import_string(
                    class_[0],
                    class_[1],
                    file_url_prefix,
                ),
                create_init_string,
            ]
        )
    )


def create_init_string(class_):
    classname= class_[0]
    return f'self.{classname} = {classname}'


def create_import_string(classname, filename, file_url_prefix):
    url = f'{file_url_prefix}{filename}'
    return f'import {{ {classname} }} from "{url}";'


if __name__ == '__main__':
    main()
