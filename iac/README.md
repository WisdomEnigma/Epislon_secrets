
Updated Terraform Software package already installed on your machine.

# Consul IAC 

    Before run terraform chdir (Change your directory) with this path 'iac/network'
    Steps
        1. Write terraform block 
        2. Initialize terraform configurations $ terraform init
        3. Make terraform plan  $ terraform plan
        4. Apply on terraform plan $ terraform apply
    
# Vault IAC

    Pre-required commands
    1. Before run terraform chdir (Change your directory) with this path 'iac/vault'
    2. Run vault server on your terminal (read first readme)
    3. Configure your vault server
    4. Type vault operator init

            With this command will shared 5 shared secrets and a token value
    
    5. Open vaultinit.json and type all unseal keys and root token value in respective fields
    6. Export Token value 
        
        $ export TF_VAR_vsecret='Root_token'
    
    7. Run terraform Step (1 and 2).
    8. Compile your vault credentials 
        
        $ terraform import vaultoperator_init.unseal file://vaultinit.json && terraform apply 
        
        and answer the question
    
    9. Open local_vault (127.0.0.1:8200/ui/vault)