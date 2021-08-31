# Issue: For AWS, whenever regions are considered for inclusion in the naming
# of buckets and other resources, these strings add considerable length to
# the names of those resources.  The challenge here is to come up with a short
# hopefully unambiguous code to describe each region, like "us-east-1" => "ue1".

locals {
  regions_list = [
    "us-east-2",
    "us-east-1",
    "us-west-1",
    "us-west-2",
    "af-south-1",
    "ap-east-1",
    "ap-south-1",
    "ap-northeast-3",
    "ap-northeast-2",
    "ap-southeast-1",
    "ap-southeast-2",
    "ap-northeast-1",
    "ca-central-1",
    "eu-central-1",
    "eu-west-1",
    "eu-west-2",
    "eu-south-1",
    "eu-west-3",
    "eu-north-1",
    "me-south-1",
    "sa-east-1",
    "us-gov-east-1",
    "us-gov-west-1",
  ]
}

output "region_short_codes" {
  value = { for reg in local.regions_list :
    reg => join("", [for tok in split("-", reg) : substr(tok,0,1)])
  }
}

# Note: The region short codes generated from the first letter of each token
# leave the following cases of ambiguity:
#   "af-south-1"     = "as1"
#   "ap-south-1"     = "as1"
#   "ap-southeast-1" = "as1"

