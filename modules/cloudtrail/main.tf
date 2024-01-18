resource "aws_cloudtrail" "insecure-logging" {
  name           = "cloudtrail-logging"
  s3_bucket_name = "my-cloudtrail-bucket"
  enable_logging = true
  enable_log_file_validation = true
  cloud_watch_logs_group_arn = "arnthingy"
  is_multi_region_trail = true
  kms_key_id = "avalidkey"
}
