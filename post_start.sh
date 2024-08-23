#!/bin/bash

set -e

# Tail jupyter logs
tail_logs() {
   # Sleep a bit before setting logs
   sleep 2
   tail -f /jupyter.log &
}

tail_logs &
