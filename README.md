# Epislon_secrets :cyclone: :key:

Pre-require software are consul, vault and terraform 

Many time use different strategies to implement keys security. Most common mistake is to store keys in configuration files such as dockerfile, terraform or any such configuration file. What if developer will store keys openly? The answer is simple use vault to store keys. There is a one problem that is vault in cloud so that application will access around the world. Otherwise developer use Padd-key or content_key.

1. Salt Password :wine_glass:
2. Pepper Password   :satellite:
3. Salt and Pepper Password :wine_glass:
4. Secret Shamir Shared Key   :satellite:


# Consul Server  :clubs: :spades:

    Make a directory name it 'consul/data' inside consul.d directory.
    Type Ctrl+Shift+T (new terminal) & type following command
       [:computer] $ consul agent -dev -enable-script-checks -node=epilson -config-dir=./consul.d


# Vault Server :shell: :collision:

        Make a directory named 'vault/data' inside vault directory.
        Type Ctrl+Shift+T (new terminal) & type following command
          [:computer:]  $ vault server -config=vault/config.hcl 
        
        Type Ctrl+Shift+T (new terminal) & type following command 
          [:web]  $ export VAULT_ADDR='http://127.0.0.1:8200'

# How to Deploy :question: :alien:

        https://learn.hashicorp.com/tutorials/vault/getting-started-deploy


# How to Save keys in secrets (Vault)  :cop:

    Enable key value secret engine
      [:smile:]  $ vault secrets enable kv 
      [:plant:] $ vault kv put kv/consul/config/ hello=world
      [:eye:]  $ vault kv get kv/consul/config/ hello

    More information please vault documentation. However I'm not a contributor of vault or any hashicorp. Perhaps vault will be better solution for keys protection.

  # Encryption Key :key:

    $ consul keygen | tee encryption.key
    $ vault kv put kv/consul/config/encryption key=$(encryption.key) ttl=1hr

  # Contact us :man:

      wizdwarfs@gmail.com or follow discord @ 
      https://discord.com/channels/960060161060401172/960060161060401175  

  # Bit Transaction :moneybag: :money_with_wings:

        bc1q4n65rrpzz04d2ax394e0j6wmh5ayc6lvffyxc
