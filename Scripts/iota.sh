#!/bin/bash

# <bitbar.title>IOTA Prices</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Yann Feunteun</bitbar.author>
# <bitbar.author.github>yafeunteun</bitbar.author.github>
# <bitbar.desc>Displays CoinMarketCap buy prices of IOTA. Prices are in euros.</bitbar.desc>
# <bitbar.image>https://img15.hostingpics.net/pics/688243iota.png</bitbar.image>
# <bitbar.dependencies>bash, python</bitbar.dependencies>
#
# Based on Cryptocurrency Prices plugin by viiraj (github.com/viiraj).
#


iota_logo='iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0IArs4c6QAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAABRdJREFUWAmtlWuIlVUUhk9ZmtOopZVW0pyJMdMuInYRqaaL2FUtNUkrmTBMybKyIiyrSWQQI4nM/lgk3Sizi2kQ6Y9k7IfdIKXLgJF/MkMrmsq00Xqe7+w1fmd07Az0wvPtvde+rb322ucUCv+vjkjLFSk/h79hLqjoK7Uq+DrhqNxE27FIN+rSUY5XTfAPtMHvcCKomF9q8Y0J7YZcJRYIk+3QvlRxwSNhP+T7W1O/Tu4BHalY4eXJzJgJ/aEHvAWvQ3eYAlMhLzdzrhwHz8NGGA9KR6M/Mxzqkx+wmgGeaiXUprrtM1Ld0A6HZ0EnlfM7kw6E2scd7gpMIOXJtsFt8Bu0wDTYCUUwShvADd4Ar8cNauEe+AaWgdfUG3ZDrE21XC4SideX+gSozg0ZRP2YXNtqFUwEHfLaIjnfoW7EZCSMgh3g6zgNVD4qZeHzBN77IngVdOIBcLFHYQR8CdeCcqwON8NYUGsgHLiQ+iu59n3UVfsNuKEaCuOyWqEwhjIWmES9AfaCk68D+6bDKlgH6lyIJ+cVLIHZoGaAc4yUB1BZBCIMbv4TOKgRjofP4FuoA3Vmqci+2nR8AcyHZ8B8yMvI5FWkIcp9nd8ehsnU48Sb7EBHl4qy7wBag8sspUYTxSxw0Z7gFbSC0VOe+k7oBdnGlJlsSB94G7bCxRC6gMp7cDOYgN/BX+BzXAzrwQ3zMhnjMEtTh+tqW57aRrwq1csKN9GBIcn6PqUTfwSf0dfwB+jABvgZLoNdED86VAu3wstwOhjuj8F15kEDuMaHkHWajd6XkZgPDjQfijAVfoGnQXkFPkdlwkkNvAtmu6qHS7LagY+vxFejMy+Be5jUB6kZi53i5qof6Jz8lwz/PnD+WeCGT8BrECH3p/opuAEKA2EhxHO5hvo2WAu+hI6b6tRqqE59buAYy9B6KpvB6HSDPaBDo+FUuBu86kyb+MaJ5ySbi4dcwCvy/dfAvWAidgcVm/tihsECOAXiBZmgE6ARXGcFuN+T4NpZw6zWaJg8SdZB6T2ahD6dFogkq6deB0oHRD0OrnMLqHGwHa62kTSR8gswHzI9x9dJrRAD9d5Fh0Ms5gTv12txvCH2RDpsqE3eK2EmnAAe4nr4ExrgWPBJTgbnlcmTDk2W/InWYVsMTnbTRnDycnCj0HlU7L8pGXpT7oBZ0CfZdMoxzamdz5lkOhDKCOlF9IwAB3uPvv2QbaN3EthfB0ZuCdwBK8GEVvNgDhihs8H1yxwwXHlDOPAB9jVpwhTKjTAEjMIP4ImmQV5v0mhIBqNaD877KNnKChdSvttD6VOMO8GNzodR0APa4GEYCSapOeA4NQkGw0LoC+bRpeABPahr7YfDKiJQzaiH4Bzw2RXBTd0wNJfKr9AIbuKhPPki6Jeg6JoiMoZdj/3VUmaw7bWgQ0bjE9C2BTqTB4pDdTamzB6DzeDbYVDqNal2wwupbXEFrILRMBB8IY+BzkXYqWZ1y4oVTjjBfy3vuicUwWfZCI9AXi/SMBpi9EIR0WhXVOq9Tnj/sahPTt0IYRubWUqfZTn7eOo6vAL80ZoOynW7LN/8VVCXymGU28GnWAP+9teDSdcEvnk1G8LRvdQdq7rkhFFQPqGt4ILmRX/wn81NW0C7m+d1P41wwKdXmzq77ICbD4Bd4IL5ux+TbNq/Al+Hd67j/g74i/g93AUqDlRqVfiNSZcz/kEwCbV5kl7gL2YbzADV8YRVJfPB338BUyEA7GlIJ24AAAAASUVORK5CYII='


iota_price=$(curl -s "https://api.coinmarketcap.com/v1/ticker/?convert=EUR" | python -c 'import json, sys; print(list(filter(lambda x: x["id"] == "iota", json.load(sys.stdin)))[0]["price_eur"])')
iota_variation_1d=$(curl -s "https://api.coinmarketcap.com/v1/ticker/?convert=EUR" | python -c 'import json, sys; print(list(filter(lambda x: x["id"] == "iota", json.load(sys.stdin)))[0]["percent_change_24h"])')
iota_variation_7d=$(curl -s "https://api.coinmarketcap.com/v1/ticker/?convert=EUR" | python -c 'import json, sys; print(list(filter(lambda x: x["id"] == "iota", json.load(sys.stdin)))[0]["percent_change_7d"])')

iota_price=$(python -c "print (round(float($iota_price), 2))")

echo "$iota_price € - 1d: $iota_variation_1d% - 7d: $iota_variation_7d% | templateImage=$iota_logo"



