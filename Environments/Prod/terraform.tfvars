rg = {
    rg1 = {
        name = "rg-prod"
        location = "centralindia"
    }
}

vnet = {
    vnet1 = {
        name = "vnet-prod"
        location = "centralindia"
        resource_group_name = "rg-prod"
        address_space = ["15.0.0.0/16"] 
    }
}

subnet = {
    subnet-bastion = {
        name = "AzureBastionSubnet"
        resource_group_name = "rg-prod"
        virtual_network_name = "vnet-prod"
        address_prefixes = ["15.0.3.0/24"]
    }
}

pubip = {
    pubip-bastion = {
        name = "bastion-pubip"
        location = "centralindia"
        resource_group_name = "rg-prod"
        allocation_method   = "Static"
        sku = "Standard"
    }
}

bastion = {
    var-bastion = {
        # Bastion
        name                = "AzureBastion"
        location            = "centralindia"
        resource_group_name = "rg-prod"

        #Bastion - Ip Configurations
        bastion-ip-config                 = "bastion-config"
    
    
        # Datablock - Subnet 
        bastion-subnet-name                 = "AzureBastionSubnet"
        virtual_network_name        = "vnet-prod"
    
        # Datablock - PublicIp
        bastion-pubip-name                        = "bastion-pubip"
    }
}
