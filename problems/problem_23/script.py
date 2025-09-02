#!/usr/bin/env python

import psutil
import socket
import platform
import shutil

def get_cpu_info():
    print("=== CPU Info ===")
    print(f"Physical cores: {psutil.cpu_count(logical=False)}")
    print(f"Total cores: {psutil.cpu_count(logical=True)}")
    print(f"CPU usage: {psutil.cpu_percent(interval=1)}%")
    print()

def get_memory_info():
    print("=== Memory Info ===")
    mem = psutil.virtual_memory()
    print(f"Total: {mem.total // (1024**3)} GB")
    print(f"Available: {mem.available // (1024**3)} GB")
    print(f"Used: {mem.used // (1024**3)} GB")
    print(f"Usage: {mem.percent}%")
    print()

def get_disk_info():
    print("=== Disk Info ===")
    for partition in psutil.disk_partitions():
        try:
            usage = psutil.disk_usage(partition.mountpoint)
            print(f"Device: {partition.device}")
            print(f"  Mountpoint: {partition.mountpoint}")
            print(f"  File system type: {partition.fstype}")
            print(f"  Total Size: {usage.total // (1024**3)} GB")
            print(f"  Used: {usage.used // (1024**3)} GB")
            print(f"  Free: {usage.free // (1024**3)} GB")
            print(f"  Usage: {usage.percent}%\n")
        except PermissionError:
            continue

def get_network_info():
    print("=== Network Info ===")
    addrs = psutil.net_if_addrs()
    for interface, addr_list in addrs.items():
        print(f"Interface: {interface}")
        for addr in addr_list:
            if addr.family == socket.AF_INET:
                print(f"  IPv4 Address: {addr.address}")
            elif addr.family == socket.AF_INET6:
                print(f"  IPv6 Address: {addr.address}")
            elif addr.family == psutil.AF_LINK:
                print(f"  MAC Address: {addr.address}")
    print()

def get_system_info():
    print("=== System Info ===")
    uname = platform.uname()
    print(f"System: {uname.system}")
    print(f"Node Name: {uname.node}")
    print(f"Release: {uname.release}")
    print(f"Version: {uname.version}")
    print(f"Machine: {uname.machine}")
    print(f"Processor: {uname.processor}")
    print()

def run_health_check():
    get_system_info()
    get_cpu_info()
    get_memory_info()
    get_disk_info()
    get_network_info()

if __name__ == "__main__":
    run_health_check()
