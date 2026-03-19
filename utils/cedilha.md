https://gist.github.com/MarceloHoffmeister/78789b6145503ab7d9dcf4a68e26060c

Confirme que o layout (Fonte de entrada) do seu teclado possui “intern.” ou “intl.” no nome

    Exemplos: Ingês (EUA, intern. alt.) e English (US, intl., with dead keys). Esta informação está na tela de configuração do teclado do sistema.
    Edite o arquivo /etc/environment

    A maneira mais fácil para editar este arquivo é abrir um terminal e digitar:
    sudo gnome-text-editor /etc/environment
    OU
    sudo gedit /etc/environment

    O comando acima vai pedir a senha do seu usuário e depois de digitá-la (enquanto você digita o terminal não irá mostrar nada) é só apertar a tecla ENTER que o editor gedit vai abrir. Não tem problema se o seu arquivo estiver vazio.
    Adicionar linhas no final do arquivo

    Adicione as seguintes linhas no final do arquivo:
    GTK_IM_MODULE=cedilla
    QT_IM_MODULE=cedilla
    Salve o arquivo

    Clique no botão ” Salvar” localizado no canto direito superior da tela, ou use a tecla de atalho CTRL+S.
    Encerre a sessão do seu usuário ou reinice o computador

    É necessário deslogar e logar novamente para a alteração funcionar. Caso não funcione, reinicie seu computador.
@JasminDreasond
Comment
