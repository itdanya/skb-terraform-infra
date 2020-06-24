variable "token" {
	description = "Задайте ваш Yandex Cloud security OAuth token"
	type = string
	default = "AgAAAABBNLNyAATuwQ4J2wFim0IEupgFHJ2GnjE"
}

variable "folder_id" {
	description = "Задайте ваш Yandex Cloud Folder ID where resources will be created"
	type = string
	default = "b1gtdfj0iq939kfud3t9"
}

variable "cloud_id" {
	description = "Задайте ваш Yandex Cloud ID where resources will be created"
	type = string
	default = "b1gmeungv2hc95u2986h"
}

variable "zone" {
	description = "Задайте ваш Yandex Cloud default Zone for provisioned resources"
	default = "ru-central1-a"
}

variable "public_key_path" {
	description = "Путь к public ssh key file"
	default = "~/.ssh/id_rsa.pub"
}

variable "yc_image_family" {
	description = "Ос с которой будем разворачиваться"
	default = "centos-7"
}

variable "cluster_size" {
	description = "Кол-во необходимых узлов"
	default = 6
}

variable "instance_cores" {
	description = "Кол-во ядер на 1 ноде"
	default = "2"
}

variable "instance_memory" {
	description = "кол-во памяти на 1 ноде"
	default = "4"
}
