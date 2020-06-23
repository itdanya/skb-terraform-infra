variable "token" {
	description = "Yandex Cloud security OAuth token"
}

variable "folder_id" {
	description = "Yandex Cloud Folder ID where resources will be created"
}

variable "cloud_id" {
	description = "Yandex Cloud ID where resources will be created"
}

variable "zone" {
	description = "Yandex Cloud default Zone for provisioned resources"
	default = "ru-central1-a"
}

variable "public_key_path" {
	description = "Path to public key file"
	default = "~/.ssh/id_rsa.pub"
}
