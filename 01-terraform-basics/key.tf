resource tls_private_key pvtkey {
	algorithm = "RSA"
	rsa_bits = 4096
}

resource "local_file" "key_details" {
  filename = "/root/key.txt"
  content = "${tls_private_key.pvtkey.public_key_pem}"
}