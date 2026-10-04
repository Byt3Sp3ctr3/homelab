#!/usr/bin/env python3
"""Nettoie un CSV : supprime les lignes vides et les espaces en trop."""
import csv, sys

def clean(path_in, path_out):
    with open(path_in, newline="", encoding="utf-8") as fi, open(path_out, "w", newline="", encoding="utf-8") as fo:
        w = csv.writer(fo)
        for row in csv.reader(fi):
            row = [c.strip() for c in row]
            if any(row):
                w.writerow(row)

if __name__ == "__main__":
    clean(sys.argv[1], sys.argv[2])
