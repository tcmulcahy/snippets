#!/usr/bin/env python3

import argparse
import functools
import math
import re
import secrets
import string
import sys


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--bits-desired', default=64, type=int)
    args = parser.parse_args()
    generate_password(args.bits_desired, get_alphabet())


@functools.cache
def get_alphabet():
    alphabet = string.ascii_letters + string.digits + '''-_!@#$%^&*()[]{}~;:"'''

    # Remove easily confused characters
    alphabet = re.sub(r'1l0O', '', alphabet)

    # Make sure there aren't any dupes
    assert len(alphabet) == len(set(alphabet))

    return alphabet


def generate_password(bits_desired, alphabet):
    bits_per_char = math.log2(len(alphabet))
    chars_required = math.ceil(bits_desired / bits_per_char)
    print(f'alphabet="""{alphabet}"""', file=sys.stderr)
    print(f'{bits_per_char=}', file=sys.stderr)
    print(f'{bits_desired=}', file=sys.stderr)
    print(f'{chars_required=}', file=sys.stderr)
    print(f'actual_entropy={chars_required*bits_per_char}', file=sys.stderr)
    password = ''.join(secrets.choice(alphabet) for i in range(chars_required))
    print(password)

    return 0

if __name__ == '__main__':
    sys.exit(main())
