#!/usr/bin/env python
import re
import uuid
import argparse

def find_uuids_in_file(filename):
    """Reads the whole file and searches for uuid occurences.

    Returns a dictionary with keys for all found uuids, and new replacement
    uuids as its values.
    """
    uuidre = re.compile(r'\buuid:\s*(?P<uuid>[0-9a-f]{32})\b')
    result = {}
    with open(filename, mode = 'r', encoding = 'utf-8') as f:
        for line in f:
            m = uuidre.search(line)
            if not m or not m.group('uuid'):
                continue
            old_uuid = m.group('uuid')
            if not result.get(old_uuid):
                new_uuid = uuid.uuid4().hex
                result[old_uuid] = new_uuid
    return result

def copy_file_and_replace_uuids(input_filename, output_filename, uuids):
    """Copies the content from input to output, replacing any occurences of
    uuids keys with its corresponding value.
    """
    with open(input_filename, mode = 'r', encoding = 'utf-8') as inputf:
        with open(output_filename, mode = 'w+', encoding = 'utf-8') as outputf:
            for line in inputf:
                for k in uuids.keys():
                    line = line.replace(k, uuids[k])
                outputf.write(line)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Replace existing uuid values with new ones')
    parser.add_argument('-i', '--input', dest='input', required=True, help='input file')
    parser.add_argument('-o', '--output', dest='output', required=True, help='output file')
    args = parser.parse_args()

    copy_file_and_replace_uuids(args.input, args.output, find_uuids_in_file(args.input))
