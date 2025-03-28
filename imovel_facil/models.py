from django.db import models          

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
    
    # Campo virtual para o nome da imagem (não armazenado no Banco de Dados)
    @property
    def imagem(self):
        return f"imovel_{self.id:02d}.jpg"
    
    @property
    def nome(self):
        return f"{self.categoria}"
    
    class Meta:
        db_table = 'imovel'  # Nome exato da tabela no MySQL
        managed = False      # Indica que Django não gerencia esta tabela