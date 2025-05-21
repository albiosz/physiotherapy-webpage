resource "aws_s3_object" "website-upload" {
  for_each = local.website_files

  bucket = aws_s3_bucket.hubertszulc_eu.id
  key    = each.value
  source = "${path.module}/../../${each.value}"

  content_type = lookup(
    {
      "css"  = "text/css"
      "html" = "text/html"
      "js"   = "application/javascript"
      "jpg"  = "image/jpeg"
      "jpeg" = "image/jpeg"
      "png"  = "image/png"
      "svg"  = "image/svg+xml"
      "ico"  = "image/x-icon"
      "json" = "application/json"
      "txt"  = "text/plain"
      "md"   = "text/markdown"
    },
    element(split(".", each.value), length(split(".", each.value)) - 1),
    "binary/octet-stream"
  )

  etag = filemd5("${path.module}/../../${each.value}")
}

# Define which files to upload and which to exclude
locals {
  exclude_dirs = [
    ".git",
    ".github",
    "example",
    "node_modules",
    "scss",
    "terraform",
    ".sass-cache/"
  ]

  exclude_files = [
    "package-lock.json",
    ".gitignore",
    "README.md",
    "package.json",
    "notes.md",
    "design.md",
    "style.css.map"
  ]

  # Get all files recursively from the project root
  all_files = fileset("${path.module}/../../", "**/*.*")

  # Filter out files from excluded directories and excluded files
  website_files = {
    for file in local.all_files :
    file => file
    if !contains([for dir in local.exclude_dirs : startswith(file, "${dir}/")], true) &&
    !contains(local.exclude_files, file)
  }
}

