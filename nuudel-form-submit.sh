#!/bin/bash
#
# Purpose: Add Saturday after next to the specified nuudel poll
# Helpful source for date magic: https://unix.stackexchange.com/a/274966
# Command example: curl --data "newdate=2022-12-31&newmoment=Test&confirm_add_column=''" https://nuudel.digitalcourage.de/uwLnt3fcNUvoxIXi8IoWaV3S/admin
#

declare nextsaturday="$(date -d "next sat" +%Y-%m-%d)"
declare -i addition=21

for moment in Nomi Obe; do
  date=$(date -d "$nextsaturday +${addition} day" +%Y-%m-%d)
  curl --silent --output /dev/null --show-error --fail --data "newdate=$date&newmoment=$moment&confirm_add_column=''" $NUUDEL_ADMIN_URL
done
