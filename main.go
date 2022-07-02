package main

import (
	"log"
	"net/http"
	"os"
	"reflect"
	"strings"
	"time"

	vclient "github.com/WisdomEnigma/vault-keygen/vault"
	"github.com/hashicorp/vault/api"
)

// constant attributes
const path string = "kv/consul/config"
const MAC_ROTATION_KEY string = "tfZysa34TMOyFSI53LsGS*xTTagiU6UN6aAzxhKWW9Qn4X3qVVoFEPNPQJIi0p8xM="
const VAULT_API string = "http://127.0.0.1:8200"

func main() {

	// ensure key is not empty
	if mac := os.Getenv("MAC_ROTATION_KEY"); reflect.DeepEqual(mac, " ") {

		log.Fatalln("Key should not be empty", mac)
		return
	}

	// create new vault client. This commad will save vault client address . export VAULT_ADDR="127.0.0.1:8200"
	client, err := api.NewClient(&api.Config{Address: VAULT_API, HttpClient: &http.Client{Timeout: time.Second * 30}})
	if err != nil {
		log.Fatalln("Client is not initialized", err)
		panic(err)
	}

	// set vault token ; If you had use vault cli command then it will like hold token (export VAULT_TOKEN="")
	client.SetToken("hvs.SbSaLpncovroVF1lQt6OkAEL")

	// vclient is wrapper package that will communicate with vault api
	vault_api := vclient.NewClient(client)

	// Save keygen is a rest call that will save keys in your vault
	_, err = vault_api.SaveKeygen(vclient.Keygen{Vault_path: path, Vault_record: map[string]interface{}{
		"data": map[string]interface{}{
			"key": Extraction(MAC_ROTATION_KEY, MAC_ROTATION_KEY[0:22]),
		}}})

	if err != nil {
		log.Fatalln("Vault secrets is not store properly", err)
		panic(err)
	}

	// Get Keygen is another rest call that will return the key
	keygen, err := vault_api.GetKeygen(vclient.Keygen{Vault_path: path, Vault_record: nil})
	if err != nil {
		log.Fatalln("Vault secrets is not store properly", err)
		return
	}

	log.Println("Secrets secrets reveal:", keygen.Data["data"])

}

func Extraction(str, str1 string) string {

	return strings.Trim(str, str1)
}
