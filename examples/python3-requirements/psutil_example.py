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
    print('RSS: {:.1f} MiB;  SHARED: {:.1f} MiB; VIRTUAL: {:.1f} MiB'.format(
        mib(memory.rss), mib(memory.shared), mib(memory.vms)))


if __name__ == '__main__':
    main()
