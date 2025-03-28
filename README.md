Aqui está a documentação convertida para Markdown:

# Documentação do Projeto ImóvelFácil

## Visão Geral

ImóvelFácil é uma aplicação web para uma imobiliária, desenvolvida com Django, que permite visualizar e gerenciar imóveis. O projeto utiliza MySQL como banco de dados e apresenta uma interface responsiva construída com Tailwind CSS e Alpine.js.

## Estrutura do Projeto

```
manage.py                     # Script de gerenciamento Django
imobiliaria/                  # Configuração principal do projeto Django
  settings.py                 # Configurações do projeto
  urls.py                     # Rotas principais
imovel_facil/                 # Aplicação principal
  models.py                   # Modelos de dados
  views.py                    # Lógica de visualização
  urls.py                     # Rotas da aplicação
  templates/                  # Templates HTML
  static/                     # Arquivos estáticos (CSS, JS, imagens)
SQL/                          # Scripts SQL
  casa.sql                    # Script para criar tabela de imóveis
```

## Configuração do Banco de Dados

O projeto utiliza MySQL com as seguintes configurações em `imobiliaria/settings.py`:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'imovel_facil',
        'USER': 'djj',
        'PASSWORD': 'tQ6#ZsSTpW',
        'HOST': 'localhost',  
        'PORT': '3306'   
    }
}
```

## Modelo de Dados

A aplicação trabalha com o modelo `Imovel` definido em `models.py`:

```python
class Imovel(models.Model):
    id = models.AutoField(primary_key=True)
    categoria = models.CharField(max_length=20)
    cozinha = models.IntegerField()
    sala = models.IntegerField()
    quarto = models.IntegerField()
    casa_de_banho = models.IntegerField()
    garagem = models.IntegerField()
    numero_de_comodo = models.IntegerField()
    area = models.IntegerField()
    endereco = models.CharField(max_length=200)
    preco = models.DecimalField(max_digits=10, decimal_places=0)
    descricao = models.CharField(max_length=200)
    
    # Propriedades virtuais
    @property
    def imagem(self):
        return f"imovel_{self.id:02d}.jpg"
    
    @property
    def nome(self):
        return f"{self.categoria}"
```

O modelo utiliza uma tabela externa já existente chamada `imovel` conforme configuração na Meta classe.

## Views e URLs

A aplicação possui uma view principal em `views.py`:

```python
def pagina_inicial(request):
    # Buscar todas as casas do banco de dados
    imoveis = Imovel.objects.all()
    
    # Serializa os dados para o Alpine.js
    imoveis_list = []
    # ...
    
    return render(request, 'imovel_facil/pagina-inicial.html', {
        'imoveis': imoveis,
        'imoveis_json': imoveis_json,
        'imovel_destaque': imovel_destaque,
    })
```

A URL principal está configurada em `imobiliaria/urls.py`:

```python
urlpatterns = [
    path('', views.pagina_inicial, name='pagina-inicial'),
    path('admin/', admin.site.urls),
]
```

## Templates

O principal template é `pagina-inicial.html`, que contém:

1. Cabeçalho com navegação
2. Seção de destaque com imóvel principal
3. Lista de imóveis disponíveis
4. Modal de detalhes do imóvel (usando Alpine.js)
5. Seção "Sobre Nós"
6. Formulário de contato
7. Rodapé

## Frontend

A interface utiliza:
* **Tailwind CSS** para estilização
* **Alpine.js** para interatividade (modais, menus responsivos)

## Funcionalidades

1. Exibição de imóveis destacados
2. Listagem de imóveis disponíveis
3. Visualização detalhada de imóveis em modal
4. Layout responsivo (desktop e mobile)
5. Formulário de contato

## Como executar o projeto

Para executar o projeto localmente:

1. Certifique-se de ter Python e MySQL instalados
2. Configure o banco de dados usando o script em `SQL/casa.sql`
3. Execute as migrações:
   ```
   python manage.py migrate
   ```
4. Inicie o servidor de desenvolvimento:
   ```
   python manage.py runserver
   ```
5. Acesse http://127.0.0.1:8000/ no navegador

## Recursos Estáticos

Os recursos estáticos como imagens devem ser organizados em:
`imovel_facil/static/imovel_facil/img/`

As imagens dos imóveis devem seguir o padrão de nomenclatura: `imovel_XX.jpg`, onde XX é o ID do imóvel formatado com dois dígitos.