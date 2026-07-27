resource "aws_cloudfront_distribution" "roboshop" {
    origin {
        domain_name              = "${var.project}-${var.environment}.${var.domain_name}"
        origin_id                = "${var.project}-${var.environment}.${var.domain_name}"
    }

    enabled             = true
    is_ipv6_enabled     = false
    comment             = "Some comment"

    aliases = ["${var.project}-cdn.${var.domain_name}"]

    default_cache_behavior {
        allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = "${var.project}-${var.environment}.${var.domain_name}"


        viewer_protocol_policy = "https-only"
        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
        cache_policy_id = local.CachingDisabled
    }

    # Cache behavior with precedence 0
    ordered_cache_behavior {
        path_pattern     = "/content/immutable/*"
        allowed_methods  = ["GET", "HEAD", "OPTIONS"]
        cached_methods   = ["GET", "HEAD", "OPTIONS"]
        target_origin_id = "${var.project}-${var.environment}.${var.domain_name}"


        min_ttl                = 0
        default_ttl            = 86400
        max_ttl                = 31536000
        compress               = true
        viewer_protocol_policy = "https-only"
        cache_policy_id = local.CachingOptimized
    }

    # Cache behavior with precedence 1
    ordered_cache_behavior {
        path_pattern     = "/content/*"
        allowed_methods  = ["GET", "HEAD", "OPTIONS"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = "${var.project}-${var.environment}.${var.domain_name}"


        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
        compress               = true
        viewer_protocol_policy = "https-only"
        cache_policy_id = local.CachingOptimized
    }


    restrictions {
        geo_restriction {
        restriction_type = "whitelist"
        locations        = ["US", "CA", "GB", "DE"]
        }
    }

    tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}"
        }
    )
        
    

    viewer_certificate {
        acm_certificate_arn = local.certificate_arn
        ssl_support_method  = "sni-only"
    }
    }

    # Create Route53 records for the CloudFront distribution aliases
resource "aws_route53_record" "www" {
    zone_id = var.zone_id
    name    = "${var.project}-cdn.maxdevopstech.online"
    type    = "A"

    alias {
        # AWS details
        name                   = aws_cloudfront_distribution.roboshop.domain_name
        zone_id                = aws_cloudfront_distribution.roboshop.hosted_zone_id
        evaluate_target_health = true
    }
    allow_overwrite = true
    }