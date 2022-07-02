# Epislon_secrets :cyclone: :key:

Many time use different strategies to implement keys security. Most common mistake is to store keys in configuration files such as dockerfile, terraform or any such configuration file. What if developer will store keys openly? The answer is simple use vault to store keys. There is a one problem that is vault in cloud so that application will access around the world. Otherwise developer use Padd-key or content_key.

  :wine_glass: Padding Key = add some additional letters or even change sequence of the message (old cryptography)

  :satellite:  Content key = through special key function or call content will unlock

# Consul Server :clubs: :spades:

    Type Ctrl+Shift+T (new terminal) & type following command
        $ consul agent -dev -enable-script-checks -node=epilson -config-dir=./consul.d


# Vault Server :shell: :collision:

        Type Ctrl+Shift+T (new terminal) & type following command
          $ vault server -config=vault/config_vault.hcl 
        
        Type Ctrl+Shift+T (new terminal) & type following command 
          $ export VAULT_ADDR='http://127.0.0.1:8200'

# How to Deploy? :question: :alien:

        https://learn.hashicorp.com/tutorials/vault/getting-started-deploy


# How to Save keys in secrets (Vault) :cop:

    Enable key value secret engine
        $ vault secrets enable kv 
        $ vault kv put kv/consul/config/ hello=world
        $ vault kv get kv/consul/config/ hello

    More information please visit vault documentation. However I'm not a contributor of vault or any hashicorp products. Perhaps vault will be better solution for keys protection and hashicorp products and services are excellent. :smile:   
    
# Bit Transaction :moneybag: :money_with_wings:

        bc1q4n65rrpzz04d2ax394e0j6wmh5ayc6lvffyxc
