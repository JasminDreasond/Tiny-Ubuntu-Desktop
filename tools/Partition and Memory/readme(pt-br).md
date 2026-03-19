21gb
Para criar um swap de **21 GB** no Kubuntu, você pode seguir este guia detalhado.

### Passo 1: Criar um arquivo de swap

1. **Abra o terminal**.
2. Use o comando `dd` para criar um arquivo de swap. Execute:
   ```bash
   sudo dd if=/dev/zero of=/mnt/swapfile bs=1G count=21
   ```
   Aqui, `if=/dev/zero` informa que estamos preenchendo o arquivo com zeros, `of=/mnt/swapfile` é o caminho do arquivo que será criado, `bs=1G` define o tamanho do bloco como 1 gigabyte, e `count=21` indica que queremos 21 blocos.

---

### Passo 2: Configurar o arquivo de swap

3. **Altere as permissões do arquivo** para garantir que apenas o root possa acessá-lo:
   ```bash
   sudo chmod 600 /mnt/swapfile
   ```

4. **Configure o arquivo como swap**:
   ```bash
   sudo mkswap /mnt/swapfile
   ```

5. **Ative o swap**:
   ```bash
   sudo swapon /mnt/swapfile
   ```

---

### Passo 3: Tornar a configuração permanente

6. Para garantir que o swap seja ativado sempre que o sistema iniciar, adicione a seguinte linha no arquivo `/etc/fstab`:
   ```bash
   /mnt/swapfile none swap sw 0 0
   ```
   Para editar esse arquivo, você pode usar um editor de texto:
   ```bash
   sudo nano /etc/fstab
   ```
   Adicione a linha acima e salve o arquivo (no nano, pressione `CTRL + X`, depois `Y` e `ENTER`).

---

### Passo 4: Verificar a configuração

7. Para verificar se o swap está ativo, use:
   ```bash
   sudo swapon --show
   ```
   Você deve ver o arquivo de swap listado.

Após seguir esses passos, você terá com sucesso configurado um swap de **21 GB** no Kubuntu. Se tiver alguma dúvida ou precisar de mais informações, fique à vontade para perguntar!
