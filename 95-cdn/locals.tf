locals {
    CachingOptimized = data.aws_cloudfront_cache_policy.cachingOptmized.id
    CachingDisabled = data.aws_cloudfront_cache_policy.cachingOptmized.id
    common_name = "${var.project}-${var.environment}"
    common_tags ={
        Project = "${var.project}"
        Environment = "${var.environment}"
    }
    certificate_arn = data.aws_ssm_parameter.certificate_arn.value
}