module "create_2tier_app" {
    source="github.com/nourhanabdallah/two_tier_app_modules.git"
    vpc_id= var.vpc_id
    naming=var.naming



}


