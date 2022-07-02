# Epislon_secrets

Many time use different strategies to implement keys security. Most common mistake is to store keys in configuration files such as dockerfile, terraform or any such configuration file. What if developer will store keys openly? The answer is simple use vault to store keys. There is a one problem that is vault in cloud so that application will access around the world. Otherwise developer use Padd-key or content_key.

Padd_Key = add some additional letters or even change sequence of the message (old cryptography)

Content_key = through special key function or call content will unlock

# Consul Server 

    Type Ctrl+Shift+T (new terminal) & type following command
      [:computer:]  $ consul agent -dev -enable-script-checks -node=epilson -config-dir=./consul.d


# Vault Server

        Type Ctrl+Shift+T (new terminal) & type following command
          [:computer:]  $ vault server -config=vault/config_vault.hcl 
        
        Type Ctrl+Shift+T (new terminal) & type following command 
          [:web:]  $ export VAULT_ADDR='http://127.0.0.1:8200'

# How to Deploy

        https://learn.hashicorp.com/tutorials/vault/getting-started-deploy


# How to Save keys in secrets (Vault) 

    Enable key value secret engine
      [:smile:]  $ vault secrets enable kv 
      [:plant:] $ vault kv put kv/consul/config/ hello=world
      [:eye:]  $ vault kv get kv/consul/config/ hello

    More information please vault documentation. However I'm not a contributor of vault or any hashicorp. Perhaps vault will be better solution for keys protection    