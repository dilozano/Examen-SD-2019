@echo off
echo ....SCRIPT PARA CREAR MAQUINA CON SO DE 64BITS...
echo CREANDO LA MAQUINA...
set /p so=Nombre del SO:
set /p tam=Tamano de disco:
set /p mem=Cantidad de memoria:
vboxmanage createvm --name %so% --ostype "Ubuntu_64" --register
echo CONFIGURANDO RED...
#vboxmanage modifyvm Ubuntu --nic1 bridged --bridgeadapter1 enp0s3
vboxmanage modifyvm %so% --bridgeadapter1 enp0s3
vboxmanage modifyvm %so% --nic1 bridged
echo CONFIGURANDO MEMORIA...
vboxmanage modifyvm %so% --memory %mem%
echo CREANDO DISCO DURO...
vboxmanage createhd --filename ubuntuserver18_64.vdi --size %tam% --format VDI
vboxmanage storagectl %so% --name "SATA Controller" --add sata --controller IntelAhci
vboxmanage storageattach %so% --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ubuntuserver18_64.vdi
vboxmanage storagectl %so% --name "IDE Controller" --add ide --controller PIIX4
echo RELACIONANDO DISCO DURO CON LA IMAGEN QUE CONTIENE EL SO...
vboxmanage storageattach %so% --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium ubuntu-18.04.2-live-server-amd64.iso