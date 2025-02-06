
# Caps Lock

¿Tu teclado no tiene un indicador que te avise si las mayúsculas no están activadas?

No sufras más, te hice un script para que cada vez que pulses "Bloq Mayús", o "Caps Lock" justamente, te avise en una notificación si las acabás de activar o desactivar.


## ¿Cómo lo activo?

Abrís una terminal y escribís lo siguiente:

```bash
    sudo nano /etc/systemd/system/capslock_notify.service
```

A ese archivo le pegás lo siguiente:

```bash
[Unit]
Description=Caps Lock Notify Service
After=graphical.target

[Service]
Type=simple
ExecStart=[reemplazá por la ruta donde tengas el archivo]/capslock_notify.sh
Restart=always
User=[tu usuario]
Environment=DISPLAY=:0
Environment=XAUTHORITY=/home/[tu usuario]/.Xauthority

[Install]
WantedBy=default.target

```
Recargá ```systemd``` para que detecte el nuevo servicio
```
    sudo systemctl daemon-reload
```
Habilitá el servicio para que se inicie automáticamente al encender tu PC
```
    sudo systemctl enable capslock_notify.service
```
[OPCIONAL]
Podés iniciar el servicio manualmente (para probar)
```
sudo systemctl start capslock_notify.service
```
Y verificá que esté corriendo
```
systemctl status capslock_notify.service
```

