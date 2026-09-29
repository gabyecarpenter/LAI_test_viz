library(sf)

# 1. Define paths (Replace with your actual file paths)
input_tif  <- "data/CFN_CA-1_2024-04-12.tif"
output_tif <- "data/CFN_CA-1_2024-04-12_web.tif"

# 2. Run GDAL Warp directly on disk (Resizes & Reprojects safely)
gdal_utils(
  util = "warp",
  source = input_tif,
  destination = output_tif,
  options = c(
    "-t_srs", "EPSG:4326",            # Reproject to Leaflet WGS84
    "-ts", "1000", "0",                # Set max width to 1000px (auto-height)
    "-r", "bilinear",                  # Downsampling method
    "-co", "COMPRESS=LZW",             # Compress file size
    "-overwrite"
  )
)

message("Done! Saved lightweight file to: ", output_tif)
