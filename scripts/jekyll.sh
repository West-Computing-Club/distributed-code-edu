#!/bin/bash

# Builds Jekylly
cd gh-pages && jekyll new dce-sites

jekyll build && mv dce-sites ..

cd ..

