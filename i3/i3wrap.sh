#!/bin/sh

# Shim between conky and i3

echo '{"version":1}'
echo '['
echo '[],'

exec conky -c $HOME/.conkyrc
