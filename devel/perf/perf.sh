#!/bin/bash

// allow papi
sudo sysctl -w kernel.perf_event_paranoid=0

papi_avail