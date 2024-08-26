#!/usr/bin/env python3

# Distroless's test.sh runs pylint on all python files, but this module will not exist
# pylint: disable=import-error
import psutil


def mib(total_bytes):
    '''Converts bytes to MiB (float).'''
    return total_bytes / 1024 / 1024


def main():
    current_process = psutil.Process()
    memory = current_process.memory_info()
    print(f'RSS: {mib(memory.rss):.1f} MiB;  SHARED: {mib(memory.shared):.1f} MiB; VIRTUAL: {mib(memory.vms):.1f} MiB')


if __name__ == '__main__':
    main()
